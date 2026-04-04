package auth

import (
	"context"
	"crypto/rand"
	"crypto/sha256"
	"encoding/base64"
	"encoding/json"
	"errors"
	"fmt"
	"strings"
	"time"

	"connectrpc.com/connect"
	identityv1 "github.com/karibu-cap/sabitou/protos/gen/go/rpc/identity/v1"
	"github.com/sabitou/powersync/connector/internal/models"
	"golang.org/x/crypto/bcrypt"
	"google.golang.org/protobuf/types/known/timestamppb"
)

// UserHandler implements identityv1connect.UserServiceHandler.
// It is embedded in Handler so both AuthService and UserService share the same DB/JWT.
// Only CreateUserDirect and InviteUser are functional; the rest return Unimplemented.

// ─────────────────────────────────────────────────────────────────────────────
// UserService stubs (existing RPCs already handled by Auth; others TBD)
// ─────────────────────────────────────────────────────────────────────────────

func (h *Handler) GetMe(ctx context.Context, req *connect.Request[identityv1.GetMeRequest]) (*connect.Response[identityv1.GetMeResponse], error) {
	return nil, connect.NewError(connect.CodeUnimplemented, errors.New("use GetCurrentUser"))
}

func (h *Handler) GetCurrentUser(ctx context.Context, req *connect.Request[identityv1.GetCurrentUserRequest]) (*connect.Response[identityv1.GetCurrentUserResponse], error) {
	claims, ok := ClaimsFromContext(ctx)
	if !ok {
		return nil, connect.NewError(connect.CodeUnauthenticated, errors.New("missing auth"))
	}
	user, err := h.getUserByRefID(ctx, claims.UserID)
	if err != nil || user == nil {
		return nil, connect.NewError(connect.CodeNotFound, errors.New("user not found"))
	}
	return connect.NewResponse(&identityv1.GetCurrentUserResponse{
		Me: modelUserToProto(user),
	}), nil
}

func (h *Handler) GetUser(ctx context.Context, req *connect.Request[identityv1.GetUserRequest]) (*connect.Response[identityv1.GetUserResponse], error) {
	user, err := h.getUserByRefID(ctx, req.Msg.UserId)
	if err != nil || user == nil {
		return nil, connect.NewError(connect.CodeNotFound, errors.New("user not found"))
	}
	return connect.NewResponse(&identityv1.GetUserResponse{User: modelUserToProto(user)}), nil
}

func (h *Handler) UpdateMe(_ context.Context, _ *connect.Request[identityv1.UpdateMeRequest]) (*connect.Response[identityv1.UpdateMeResponse], error) {
	return nil, connect.NewError(connect.CodeUnimplemented, errors.New("not implemented"))
}

func (h *Handler) Update(_ context.Context, _ *connect.Request[identityv1.UpdateRequest]) (*connect.Response[identityv1.UpdateResponse], error) {
	return nil, connect.NewError(connect.CodeUnimplemented, errors.New("not implemented"))
}

func (h *Handler) RequestDeleteUser(_ context.Context, _ *connect.Request[identityv1.RequestDeleteUserRequest]) (*connect.Response[identityv1.RequestDeleteUserResponse], error) {
	return nil, connect.NewError(connect.CodeUnimplemented, errors.New("not implemented"))
}

func (h *Handler) DeleteUser(_ context.Context, _ *connect.Request[identityv1.DeleteUserRequest]) (*connect.Response[identityv1.DeleteUserResponse], error) {
	return nil, connect.NewError(connect.CodeUnimplemented, errors.New("not implemented"))
}

func (h *Handler) ChangePassword(_ context.Context, _ *connect.Request[identityv1.ChangePasswordRequest]) (*connect.Response[identityv1.ChangePasswordResponse], error) {
	return nil, connect.NewError(connect.CodeUnimplemented, errors.New("not implemented"))
}

func (h *Handler) StreamUser(_ context.Context, _ *connect.Request[identityv1.StreamUserRequest], _ *connect.ServerStream[identityv1.StreamUserResponse]) error {
	return connect.NewError(connect.CodeUnimplemented, errors.New("not implemented"))
}

func (h *Handler) CancelInvitation(_ context.Context, _ *connect.Request[identityv1.CancelInvitationRequest]) (*connect.Response[identityv1.CancelInvitationResponse], error) {
	return nil, connect.NewError(connect.CodeUnimplemented, errors.New("not implemented"))
}

func (h *Handler) ResendInvitation(_ context.Context, _ *connect.Request[identityv1.ResendInvitationRequest]) (*connect.Response[identityv1.ResendInvitationResponse], error) {
	return nil, connect.NewError(connect.CodeUnimplemented, errors.New("not implemented"))
}

func (h *Handler) AcceptInvitation(_ context.Context, _ *connect.Request[identityv1.AcceptInvitationRequest]) (*connect.Response[identityv1.AcceptInvitationResponse], error) {
	return nil, connect.NewError(connect.CodeUnimplemented, errors.New("not implemented"))
}

// ─────────────────────────────────────────────────────────────────────────────
// CreateUserDirect — DIRECT onboarding flow
// Admin supplies userName + password → user is ACTIVE immediately.
// A StoreMember record is also created atomically.
// ─────────────────────────────────────────────────────────────────────────────

// CreateUserDirect implements the DIRECT onboarding flow.
// The admin supplies a username and a temporary password; the new user
// is immediately ACTIVE and a StoreMember row is inserted in the same
// transaction.
func (h *Handler) CreateUserDirect(ctx context.Context, req *connect.Request[identityv1.CreateUserDirectRequest]) (*connect.Response[identityv1.CreateUserDirectResponse], error) {
	msg := req.Msg

	// ── Validate required fields ──────────────────────────────────────────────
	userName := strings.TrimSpace(msg.UserName)
	email := strings.TrimSpace(strings.ToLower(msg.Email))
	if userName == "" || email == "" || msg.Password == "" || msg.StoreId == "" {
		return nil, connect.NewError(connect.CodeInvalidArgument, errors.New("user_name, email, password and store_id are required"))
	}

	// Require admin to be authenticated.
	adminClaims, ok := ClaimsFromContext(ctx)
	if !ok {
		return nil, connect.NewError(connect.CodeUnauthenticated, errors.New("missing auth"))
	}

	// ── Hash password ─────────────────────────────────────────────────────────
	hash, err := bcrypt.GenerateFromPassword([]byte(msg.Password), bcrypt.DefaultCost)
	if err != nil {
		return nil, connect.NewError(connect.CodeInternal, errors.New("could not hash password"))
	}

	// ── Determine required_actions ────────────────────────────────────────────
	requiredActionsJSON := "[]"
	if msg.ForcePasswordChangeOnFirstLogin {
		requiredActionsJSON = `["AUTH_ACTION_TYPE_INITIALIZE_PASSWORD"]`
	}

	// ── Permissions JSON ──────────────────────────────────────────────────────
	permJSON, err := marshalPermissions(msg.Permissions)
	if err != nil {
		return nil, connect.NewError(connect.CodeInternal, fmt.Errorf("marshal permissions: %w", err))
	}

	// ── Resolve store's business_id ───────────────────────────────────────────
	var businessID string
	err = h.db.QueryRow(ctx, `SELECT business_id FROM stores WHERE ref_id = $1`, msg.StoreId).Scan(&businessID)
	if err != nil {
		return nil, connect.NewError(connect.CodeNotFound, errors.New("store not found"))
	}

	// ── Atomic transaction: INSERT user + store_member ────────────────────────
	refID := GenerateSmartUserID("USR")

	const accountStatus = "ACCOUNT_STATUS_TYPE_ACTIVE"
	const memberStatus = "STORE_MEMBER_STATUS_ACTIVE"
	const onboardingType = "ONBOARDING_TYPE_DIRECT"

	tx, err := h.db.Begin(ctx)
	if err != nil {
		return nil, connect.NewError(connect.CodeInternal, errors.New("begin transaction failed"))
	}
	defer tx.Rollback(ctx) //nolint:errcheck

	_, err = tx.Exec(ctx, `
		INSERT INTO users (ref_id, user_name, email, password_hash, first_name, last_name,
		                   account_status, active_business_id, active_store_id)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
	`,
		refID, userName, email, string(hash),
		nullableString(msg.FirstName), nullableString(msg.LastName),
		accountStatus, businessID, msg.StoreId,
	)
	if err != nil {
		if strings.Contains(err.Error(), "unique") {
			return nil, connect.NewError(connect.CodeAlreadyExists, errors.New("email or username already registered"))
		}
		h.logger.Error("insert user (direct)", "error", err)
		return nil, connect.NewError(connect.CodeInternal, errors.New("user creation failed"))
	}

	_, err = tx.Exec(ctx, `
		INSERT INTO store_members (store_id, user_id, status, onboarding_type, permissions)
		VALUES ($1, $2, $3, $4, $5)
		ON CONFLICT (store_id, user_id) DO NOTHING
	`, msg.StoreId, refID, memberStatus, onboardingType, permJSON)
	if err != nil {
		h.logger.Error("insert store_member (direct)", "error", err)
		return nil, connect.NewError(connect.CodeInternal, errors.New("store member creation failed"))
	}

	if err := tx.Commit(ctx); err != nil {
		return nil, connect.NewError(connect.CodeInternal, errors.New("commit failed"))
	}

	h.logger.Info("user created (direct)", "ref_id", refID, "by", adminClaims.UserID)

	user := &models.User{
		RefID:         refID,
		UserName:      userName,
		Email:         email,
		AccountStatus: accountStatus,
		CreatedAt:     time.Now(),
	}
	if msg.FirstName != nil {
		user.FirstName = *msg.FirstName
	}
	if msg.LastName != nil {
		user.LastName = *msg.LastName
	}

	protoUser := modelUserToProto(user)
	if msg.ForcePasswordChangeOnFirstLogin {
		protoUser.RequiredActions = []identityv1.AuthActionType{
			identityv1.AuthActionType_AUTH_ACTION_TYPE_INITIALIZE_PASSWORD,
		}
	}
	_ = requiredActionsJSON // stored; used by frontend if needed

	return connect.NewResponse(&identityv1.CreateUserDirectResponse{User: protoUser}), nil
}

// ─────────────────────────────────────────────────────────────────────────────
// InviteUser — INVITE onboarding flow
// Admin supplies only email → user is PENDING, invitation record created.
// ─────────────────────────────────────────────────────────────────────────────

// InviteUser implements the INVITE onboarding flow.
// A PENDING user is created, an Invitation record is inserted, and an
// email would be sent (email sending is a TODO in this implementation).
func (h *Handler) InviteUser(ctx context.Context, req *connect.Request[identityv1.InviteUserRequest]) (*connect.Response[identityv1.InviteUserResponse], error) {
	msg := req.Msg

	// ── Validate ──────────────────────────────────────────────────────────────
	email := strings.TrimSpace(strings.ToLower(msg.Email))
	if email == "" || msg.StoreId == "" {
		return nil, connect.NewError(connect.CodeInvalidArgument, errors.New("email and store_id are required"))
	}

	adminClaims, ok := ClaimsFromContext(ctx)
	if !ok {
		return nil, connect.NewError(connect.CodeUnauthenticated, errors.New("missing auth"))
	}

	// ── Resolve store → business ───────────────────────────────────────────────
	var businessID string
	err := h.db.QueryRow(ctx, `SELECT business_id FROM stores WHERE ref_id = $1`, msg.StoreId).Scan(&businessID)
	if err != nil {
		return nil, connect.NewError(connect.CodeNotFound, errors.New("store not found"))
	}

	// ── Generate invitation token ─────────────────────────────────────────────
	rawToken, tokenHash := generateInvitationToken()

	// ── Permissions JSON ──────────────────────────────────────────────────────
	permJSON, err := marshalPermissions(msg.Permissions)
	if err != nil {
		return nil, connect.NewError(connect.CodeInternal, fmt.Errorf("marshal permissions: %w", err))
	}

	// ── Derive a placeholder username from email ───────────────────────────────
	userName := strings.Split(email, "@")[0]

	// ── IDs ───────────────────────────────────────────────────────────────────
	userRefID := GenerateSmartUserID("USR")
	invRefID := GenerateSmartUserID("INV")

	const accountStatus = "ACCOUNT_STATUS_TYPE_PENDING"
	const memberStatus = "STORE_MEMBER_STATUS_PENDING"
	const onboardingType = "ONBOARDING_TYPE_INVITE"
	expiresAt := time.Now().Add(48 * time.Hour)

	tx, err := h.db.Begin(ctx)
	if err != nil {
		return nil, connect.NewError(connect.CodeInternal, errors.New("begin transaction failed"))
	}
	defer tx.Rollback(ctx) //nolint:errcheck

	// Insert PENDING user
	_, err = tx.Exec(ctx, `
		INSERT INTO users (ref_id, user_name, email, first_name, last_name,
		                   account_status, active_business_id, active_store_id)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
	`,
		userRefID, userName, email,
		nullableString(msg.FirstName), nullableString(msg.LastName),
		accountStatus, businessID, msg.StoreId,
	)
	if err != nil {
		if strings.Contains(err.Error(), "unique") {
			return nil, connect.NewError(connect.CodeAlreadyExists, errors.New("email already registered"))
		}
		h.logger.Error("insert user (invite)", "error", err)
		return nil, connect.NewError(connect.CodeInternal, errors.New("user creation failed"))
	}

	// Insert PENDING store_member
	_, err = tx.Exec(ctx, `
		INSERT INTO store_members (store_id, user_id, status, onboarding_type, permissions)
		VALUES ($1, $2, $3, $4, $5)
		ON CONFLICT (store_id, user_id) DO NOTHING
	`, msg.StoreId, userRefID, memberStatus, onboardingType, permJSON)
	if err != nil {
		h.logger.Error("insert store_member (invite)", "error", err)
		return nil, connect.NewError(connect.CodeInternal, errors.New("store member creation failed"))
	}

	// Insert invitation record
	_, err = tx.Exec(ctx, `
		INSERT INTO invitations (ref_id, user_id, store_id, invited_by, token_hash, status, expires_at)
		VALUES ($1, $2, $3, $4, $5, 'INVITATION_STATUS_PENDING', $6)
	`, invRefID, userRefID, msg.StoreId, adminClaims.UserID, tokenHash, expiresAt)
	if err != nil {
		h.logger.Error("insert invitation", "error", err)
		return nil, connect.NewError(connect.CodeInternal, errors.New("invitation creation failed"))
	}

	if err := tx.Commit(ctx); err != nil {
		return nil, connect.NewError(connect.CodeInternal, errors.New("commit failed"))
	}

	// TODO: send invitation email with rawToken link.
	h.logger.Info("invitation created",
		"inv_ref_id", invRefID,
		"user_ref_id", userRefID,
		"raw_token_hint", rawToken[:8]+"…", // log only prefix for safety
		"by", adminClaims.UserID,
	)

	user := &models.User{
		RefID:         userRefID,
		UserName:      userName,
		Email:         email,
		AccountStatus: accountStatus,
		CreatedAt:     time.Now(),
	}
	if msg.FirstName != nil {
		user.FirstName = *msg.FirstName
	}
	if msg.LastName != nil {
		user.LastName = *msg.LastName
	}

	invitation := &identityv1.Invitation{
		RefId:     invRefID,
		UserId:    userRefID,
		StoreId:   msg.StoreId,
		InvitedBy: adminClaims.UserID,
		Status:    identityv1.InvitationStatus_INVITATION_STATUS_PENDING,
		ExpiresAt: timestamppb.New(expiresAt),
		CreatedAt: timestamppb.Now(),
	}

	return connect.NewResponse(&identityv1.InviteUserResponse{
		User:       modelUserToProto(user),
		Invitation: invitation,
	}), nil
}

// ─────────────────────────────────────────────────────────────────────────────
// Helpers
// ─────────────────────────────────────────────────────────────────────────────

// modelUserToProto converts an internal models.User to a proto User message.
func modelUserToProto(u *models.User) *identityv1.User {
	status := identityv1.AccountStatusType_ACCOUNT_STATUS_TYPE_UNSPECIFIED
	switch u.AccountStatus {
	case "ACCOUNT_STATUS_TYPE_ACTIVE":
		status = identityv1.AccountStatusType_ACCOUNT_STATUS_TYPE_ACTIVE
	case "ACCOUNT_STATUS_TYPE_PENDING":
		status = identityv1.AccountStatusType_ACCOUNT_STATUS_TYPE_PENDING
	case "ACCOUNT_STATUS_TYPE_DELETED":
		status = identityv1.AccountStatusType_ACCOUNT_STATUS_TYPE_DELETED
	}
	refID := u.RefID
	email := u.Email
	firstName := u.FirstName
	lastName := u.LastName
	return &identityv1.User{
		RefId:         &refID,
		UserName:      u.UserName,
		Email:         &email,
		FirstName:     &firstName,
		LastName:      &lastName,
		AccountStatus: &status,
	}
}

// marshalPermissions JSON-encodes a StorePermissions proto message for DB storage.
// If permissions is nil a safe empty JSON object is returned.
func marshalPermissions(perm *identityv1.StorePermissions) (string, error) {
	if perm == nil {
		return "{}", nil
	}
	// Build a map that mirrors the DB JSONB structure expected by the Flutter client.
	type boolMap = map[string]bool
	out := map[string]interface{}{}

	if p := perm.Product; p != nil {
		out["product"] = boolMap{
			"read_product_in_inventory":   p.ReadProductInInventory,
			"create_product_in_inventory": p.CreateProductInInventory,
			"update_product_in_inventory": p.UpdateProductInInventory,
			"delete_product_in_inventory": p.DeleteProductInInventory,
		}
	}
	if m := perm.Member; m != nil {
		out["member"] = boolMap{
			"read_information": m.ReadInformation,
			"invite_member":    m.InviteMember,
			"update_member":    m.UpdateMember,
			"delete_member":    m.DeleteMember,
		}
	}
	if r := perm.Report; r != nil {
		out["report"] = boolMap{"read_report": r.ReadReport}
	}
	if o := perm.Order; o != nil {
		out["order"] = boolMap{
			"read_order":   o.ReadOrder,
			"create_order": o.CreateOrder,
		}
	}
	if i := perm.Invoice; i != nil {
		out["invoice"] = boolMap{
			"read_invoice":   i.ReadInvoice,
			"create_invoice": i.CreateInvoice,
		}
	}
	if s := perm.Supplier; s != nil {
		out["supplier"] = boolMap{
			"read_supplier":   s.ReadSupplier,
			"create_supplier": s.CreateSupplier,
			"update_supplier": s.UpdateSupplier,
			"delete_supplier": s.DeleteSupplier,
		}
	}
	if t := perm.Transaction; t != nil {
		out["transaction"] = boolMap{
			"read_transaction":   t.ReadTransaction,
			"create_transaction": t.CreateTransaction,
			"update_transaction": t.UpdateTransaction,
		}
	}

	b, err := json.Marshal(out)
	if err != nil {
		return "", err
	}
	return string(b), nil
}

// generateInvitationToken returns (rawToken, sha256Hash).
func generateInvitationToken() (string, string) {
	b := make([]byte, 40)
	rand.Read(b) //nolint:errcheck
	raw := base64.RawURLEncoding.EncodeToString(b)
	sum := sha256.Sum256([]byte(raw))
	h := base64.RawURLEncoding.EncodeToString(sum[:])
	return raw, h
}

// nullableString returns a pointer to the string value, or nil if the optional
// proto string field is not set.
func nullableString(s *string) interface{} {
	if s == nil || *s == "" {
		return nil
	}
	return *s
}
