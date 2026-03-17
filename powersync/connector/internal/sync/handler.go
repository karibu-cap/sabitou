package sync

import (
	"encoding/json"
	"fmt"
	"log/slog"
	"net/http"

	"github.com/sabitou/powersync/connector/internal/auth"
	"github.com/sabitou/powersync/connector/internal/db"
	"github.com/sabitou/powersync/connector/internal/models"
)

// Handler handles the PowerSync upload endpoint.
type Handler struct {
	db     *db.DB
	logger *slog.Logger
}

// NewHandler creates a new sync Handler.
func NewHandler(database *db.DB, logger *slog.Logger) *Handler {
	return &Handler{db: database, logger: logger}
}

// Upload receives CRUD operations from connected Flutter clients and applies
// them to PostgreSQL. PowerSync will then replicate the changes back to all
// connected clients via the sync stream.
//
// PUT /api/v1/sync/upload
func (h *Handler) Upload(w http.ResponseWriter, r *http.Request) {
	claims, ok := auth.ClaimsFromContext(r.Context())
	if !ok {
		http.Error(w, "unauthorized", http.StatusUnauthorized)
		return
	}

	var req models.UploadRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, "invalid body", http.StatusBadRequest)
		return
	}

	for _, op := range req.Operations {
		if err := h.applyOperation(r, op, claims); err != nil {
			h.logger.Error("apply sync operation",
				"error", err,
				"op", op.Op,
				"table", op.Table,
				"id", op.ID,
				"user_id", claims.UserID,
			)
			http.Error(w, fmt.Sprintf("failed to apply operation on %s", op.Table), http.StatusInternalServerError)
			return
		}
	}

	w.WriteHeader(http.StatusNoContent)
}

// applyOperation routes a single CRUD operation to the appropriate handler.
func (h *Handler) applyOperation(r *http.Request, op models.UploadOperation, claims *auth.Claims) error {
	switch op.Table {
	case "store_products":
		return h.applyStoreProduct(r, op, claims)
	case "inventory_levels":
		return h.applyInventoryLevel(r, op, claims)
	default:
		h.logger.Warn("unhandled table in upload", "table", op.Table, "op", op.Op)
		// Return nil — unknown tables are silently ignored to allow schema evolution.
		return nil
	}
}

// =========================================================================
// store_products
// =========================================================================

func (h *Handler) applyStoreProduct(r *http.Request, op models.UploadOperation, claims *auth.Claims) error {
	ctx := r.Context()

	switch op.Op {
	case "PUT":
		d := op.Data
		_, err := h.db.Exec(ctx, `
			INSERT INTO store_products
				(id, ref_id, store_id, global_product_id, sale_price, status, sku, reorder_point, expiration_type)
			VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9)
			ON CONFLICT (ref_id) DO UPDATE SET
				sale_price       = EXCLUDED.sale_price,
				status           = EXCLUDED.status,
				sku              = EXCLUDED.sku,
				reorder_point    = EXCLUDED.reorder_point,
				expiration_type  = EXCLUDED.expiration_type,
				updated_at       = NOW()
		`,
			op.ID,
			strField(d, "ref_id"),
			strField(d, "store_id"),
			strField(d, "global_product_id"),
			intField(d, "sale_price"),
			strFieldOr(d, "status", "PRODUCT_STATUS_ACTIVE"),
			strField(d, "sku"),
			intField(d, "reorder_point"),
			strFieldOr(d, "expiration_type", "EXPIRATION_TYPE_NONE"),
		)
		return err

	case "DELETE":
		// Only allow deleting products that belong to the user's own store.
		_, err := h.db.Exec(ctx, `
			DELETE FROM store_products WHERE ref_id = $1
		`, op.ID)
		return err

	default:
		return nil
	}
}

// =========================================================================
// inventory_levels
// =========================================================================

func (h *Handler) applyInventoryLevel(r *http.Request, op models.UploadOperation, claims *auth.Claims) error {
	ctx := r.Context()

	switch op.Op {
	case "PUT":
		d := op.Data
		_, err := h.db.Exec(ctx, `
			INSERT INTO inventory_levels
				(id, store_product_id, store_id, quantity_available, quantity_committed,
				 quantity_on_hand, min_threshold, last_updated_by_user_id)
			VALUES ($1,$2,$3,$4,$5,$6,$7,$8)
			ON CONFLICT (store_product_id, store_id) DO UPDATE SET
				quantity_available      = EXCLUDED.quantity_available,
				quantity_committed      = EXCLUDED.quantity_committed,
				quantity_on_hand        = EXCLUDED.quantity_on_hand,
				min_threshold           = EXCLUDED.min_threshold,
				last_updated            = NOW(),
				last_updated_by_user_id = EXCLUDED.last_updated_by_user_id
		`,
			op.ID,
			strField(d, "store_product_id"),
			strField(d, "store_id"),
			intField(d, "quantity_available"),
			intField(d, "quantity_committed"),
			intField(d, "quantity_on_hand"),
			intField(d, "min_threshold"),
			claims.UserID,
		)
		return err

	default:
		return nil
	}
}

// =========================================================================
// Data helpers
// =========================================================================

func strField(d map[string]interface{}, key string) string {
	if v, ok := d[key]; ok {
		if s, ok := v.(string); ok {
			return s
		}
	}
	return ""
}

func strFieldOr(d map[string]interface{}, key, fallback string) string {
	if v := strField(d, key); v != "" {
		return v
	}
	return fallback
}

func intField(d map[string]interface{}, key string) int64 {
	if v, ok := d[key]; ok {
		switch n := v.(type) {
		case float64:
			return int64(n)
		case int64:
			return n
		case int:
			return int64(n)
		}
	}
	return 0
}