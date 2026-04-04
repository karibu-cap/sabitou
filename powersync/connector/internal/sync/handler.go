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
// POST /api/v1/sync/upload
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
// Every table present in sync_rules.yml has a corresponding case here.
// Tables that are server-managed (read-only for clients) are explicitly
// acknowledged and silently ignored so unknown-table warnings don't fire.
func (h *Handler) applyOperation(r *http.Request, op models.UploadOperation, claims *auth.Claims) error {
	switch op.Table {
	// ── writable by clients ──────────────────────────────────────────────────
	case "store_products":
		return h.applyStoreProduct(r, op, claims)
	case "inventory_levels":
		return h.applyInventoryLevel(r, op, claims)
	case "cash_receipts":
		return h.applyCashReceipt(r, op, claims)
	case "cash_receipt_items":
		return h.applyCashReceiptItem(r, op, claims)
	case "payments":
		return h.applyPayment(r, op, claims)
	case "gift_vouchers":
		return h.applyGiftVoucher(r, op, claims)
	case "voucher_transactions":
		return h.applyVoucherTransaction(r, op, claims)
	case "purchase_orders":
		return h.applyPurchaseOrder(r, op, claims)
	case "purchase_order_line_items":
		return h.applyPurchaseOrderLineItem(r, op, claims)
	case "receiving_notes":
		return h.applyReceivingNote(r, op, claims)
	case "receiving_note_line_items":
		return h.applyReceivingNoteLineItem(r, op, claims)
	case "batches":
		return h.applyBatch(r, op, claims)
	case "inventory_transactions":
		return h.applyInventoryTransaction(r, op, claims)
	case "sales_orders":
		return h.applySalesOrder(r, op, claims)
	case "sales_order_line_items":
		return h.applySalesOrderLineItem(r, op, claims)
	case "invoices":
		return h.applyInvoice(r, op, claims)
	case "invoice_line_items":
		return h.applyInvoiceLineItem(r, op, claims)
	case "bills":
		return h.applyBill(r, op, claims)
	case "bill_line_items":
		return h.applyBillLineItem(r, op, claims)
	case "delivery_note_line_items":
		return h.applyDeliveryNoteLineItem(r, op, claims)
	case "suppliers":
		return h.applySupplier(r, op, claims)
	case "stores":
		return h.applyStore(r, op, claims)
	case "businesses":
		return h.applyBusiness(r, op, claims)
	case "users":
		return h.applyUser(r, op, claims)

	case "global_products":
		return h.applyGlobalProduct(r, op, claims)
	case "categories":
		return h.applyCategory(r, op, claims)
	case "resource_links":
		return h.applyResourceLink(r, op, claims)
	case "store_members":
		return h.applyStoreMember(r, op, claims)
	case "business_members":
		return h.applyBusinessMember(r, op, claims)
	case "invitations":
		return h.applyInvitation(r, op, claims)

	default:
		h.logger.Warn("unhandled table in upload", "table", op.Table, "op", op.Op)
		// Return nil — unknown tables are silently ignored to allow schema evolution.
		return nil
	}
}

// =========================================================================
// store_products
// =========================================================================

func (h *Handler) applyStoreProduct(r *http.Request, op models.UploadOperation, _ *auth.Claims) error {
	ctx := r.Context()
	d := op.Data

	h.logger.Info("applyStoreProduct", "op", op)

	switch op.Op {
	case "PUT":
		_, err := h.db.Exec(ctx, `
			INSERT INTO store_products
				(id, ref_id, store_id, global_product_id, sale_price, status, sku,
				 reorder_point, expiration_type, opening_stock, opening_stock_per_unit,
				 default_purchase_price, images_links_ids)
			VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13)
			ON CONFLICT (ref_id) DO UPDATE SET
				sale_price              = EXCLUDED.sale_price,
				status                  = EXCLUDED.status,
				sku                     = EXCLUDED.sku,
				reorder_point           = EXCLUDED.reorder_point,
				expiration_type         = EXCLUDED.expiration_type,
				default_purchase_price  = EXCLUDED.default_purchase_price,
				images_links_ids  		= EXCLUDED.images_links_ids,
				updated_at              = NOW()
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
			intField(d, "opening_stock"),
			numericField(d, "opening_stock_per_unit"),
			intField(d, "default_purchase_price"),
			strFieldOr(d, "images_links_ids", `[]`),
		)
		return err

	case "PATCH":
		_, err := h.db.Exec(ctx, `
			UPDATE store_products SET
				sale_price             = COALESCE(NULLIF($2::bigint, 0), sale_price),
				status                 = COALESCE(NULLIF($3, ''), status),
				sku                    = COALESCE(NULLIF($4, ''), sku),
				reorder_point          = COALESCE(NULLIF($5::bigint, 0), reorder_point),
				expiration_type        = COALESCE(NULLIF($6, ''), expiration_type),
				default_purchase_price = COALESCE(NULLIF($7::bigint, 0), default_purchase_price),
				updated_at             = NOW(),
				images_links_ids       = CASE WHEN $8 <> '' THEN (SELECT array_agg(x) FROM jsonb_array_elements_text($8::jsonb) AS x) ELSE images_links_ids END
			WHERE id = $1
		`,
			op.ID,
			intField(d, "sale_price"),
			strField(d, "status"),
			strField(d, "sku"),
			intField(d, "reorder_point"),
			strField(d, "expiration_type"),
			intField(d, "default_purchase_price"),
			strField(d, "images_links_ids"),
		)
		return err

	case "DELETE":
		_, err := h.db.Exec(ctx, `DELETE FROM store_products WHERE id = $1`, op.ID)
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
	d := op.Data

	switch op.Op {
	case "PUT":
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

	case "PATCH":
		_, err := h.db.Exec(ctx, `
			UPDATE inventory_levels SET
				quantity_available      = COALESCE(NULLIF($2::bigint, 0), quantity_available),
				quantity_committed      = COALESCE(NULLIF($3::bigint, 0), quantity_committed),
				quantity_on_hand        = COALESCE(NULLIF($4::bigint, 0), quantity_on_hand),
				min_threshold           = COALESCE(NULLIF($5::bigint, 0), min_threshold),
				last_updated            = NOW(),
				last_updated_by_user_id = $6
			WHERE id = $1
		`,
			op.ID,
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
// cash_receipts
// =========================================================================

func (h *Handler) applyCashReceipt(r *http.Request, op models.UploadOperation, claims *auth.Claims) error {
	ctx := r.Context()
	d := op.Data

	switch op.Op {
	case "PUT":
		_, err := h.db.Exec(ctx, `
			INSERT INTO cash_receipts
				(id, ref_id, cashier_user_id, customer, store_id, subtotal,
				 tax_amount, total_amount, amount_paid, change_given, currency,
				 payment_ids, notes, voucher_issued_code, owed_to_customer, status, transaction_time)
			VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,NOW())
			ON CONFLICT (ref_id) DO UPDATE SET
				cashier_user_id = EXCLUDED.cashier_user_id,
				customer     = EXCLUDED.customer,
				store_id        = EXCLUDED.store_id,
				subtotal        = EXCLUDED.subtotal,
				tax_amount      = EXCLUDED.tax_amount,
				total_amount    = EXCLUDED.total_amount,
				amount_paid     = EXCLUDED.amount_paid,
				change_given    = EXCLUDED.change_given,
				currency        = EXCLUDED.currency,
				payment_ids     = EXCLUDED.payment_ids,
				notes           = EXCLUDED.notes,
				voucher_issued_code = EXCLUDED.voucher_issued_code,
				owed_to_customer    = EXCLUDED.owed_to_customer,
				status          = EXCLUDED.status
		`,
			op.ID,
			strField(d, "ref_id"),
			claims.UserID,
			strField(d, "customer"),
			strField(d, "store_id"),
			numericField(d, "subtotal"),
			numericField(d, "tax_amount"),
			numericField(d, "total_amount"),
			numericField(d, "amount_paid"),
			numericField(d, "change_given"),
			strFieldOr(d, "currency", "XAF"),
			strField(d, "payment_ids"),
			strField(d, "notes"),
			strField(d, "voucher_issued_code"),
			numericField(d, "owed_to_customer"),
			strFieldOr(d, "status", "CASH_RECEIPT_STATUS_COMPLETED"),
		)
		return err

	case "PATCH":
		_, err := h.db.Exec(ctx, `
			UPDATE cash_receipts SET
				cashier_user_id   = COALESCE(NULLIF($2, ''), cashier_user_id),
				customer       = COALESCE(NULLIF($3, ''), customer),
				store_id          = COALESCE(NULLIF($4, ''), store_id),
				subtotal          = COALESCE($5, subtotal),
				tax_amount        = COALESCE($6, tax_amount),
				total_amount      = COALESCE($7, total_amount),
				amount_paid       = COALESCE($8, amount_paid),
				change_given      = COALESCE($9, change_given),
				currency          = COALESCE(NULLIF($10, ''), currency),
				payment_ids       = COALESCE(NULLIF($11, ''), payment_ids),
				notes             = COALESCE(NULLIF($12, ''), notes),
				voucher_issued_code = COALESCE(NULLIF($13, ''), voucher_issued_code),
				owed_to_customer  = COALESCE($14, owed_to_customer),
				status            = COALESCE(NULLIF($15, ''), status)
			WHERE id = $1
		`,
			op.ID,
			strField(d, "cashier_user_id"),
			strField(d, "customer"),
			strField(d, "store_id"),
			numericField(d, "subtotal"),
			numericField(d, "tax_amount"),
			numericField(d, "total_amount"),
			numericField(d, "amount_paid"),
			numericField(d, "change_given"),
			strField(d, "currency"),
			strField(d, "payment_ids"),
			strField(d, "notes"),
			strField(d, "voucher_issued_code"),
			numericField(d, "owed_to_customer"),
			strField(d, "status"),
		)
		return err

	case "DELETE":
		_, err := h.db.Exec(ctx, `DELETE FROM cash_receipts WHERE id = $1`, op.ID)
		return err

	default:
		return nil
	}
}

// =========================================================================
// cash_receipt_items
// =========================================================================

func (h *Handler) applyCashReceiptItem(r *http.Request, op models.UploadOperation, _ *auth.Claims) error {
	ctx := r.Context()
	d := op.Data

	switch op.Op {
	case "PUT":
		_, err := h.db.Exec(ctx, `
			INSERT INTO cash_receipt_items
				(id, receipt_id, store_id, product_id,
				 quantity, unit_price, subtotal, tax_rate, tax_amount, total, batch_id, product_name)
			VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12::jsonb)
			ON CONFLICT (receipt_id, product_id) DO UPDATE SET
				quantity   = EXCLUDED.quantity,
				unit_price = EXCLUDED.unit_price,
				subtotal   = EXCLUDED.subtotal,
				tax_rate   = EXCLUDED.tax_rate,
				tax_amount = EXCLUDED.tax_amount,
				total      = EXCLUDED.total,
				batch_id   = EXCLUDED.batch_id,
				product_name = EXCLUDED.product_name
		`,
			op.ID,
			strField(d, "receipt_id"),
			strField(d, "store_id"),
			strField(d, "product_id"),
			intField(d, "quantity"),
			numericField(d, "unit_price"),
			numericField(d, "subtotal"),
			numericField(d, "tax_rate"),
			numericField(d, "tax_amount"),
			numericField(d, "total"),
			strField(d, "batch_id"),
			strFieldOr(d, "product_name", "{}"),
		)
		return err

	case "PATCH":
		_, err := h.db.Exec(ctx, `
			UPDATE cash_receipt_items SET
				receipt_id = COALESCE(NULLIF($2, ''), receipt_id),
				store_id   = COALESCE(NULLIF($3, ''), store_id),
				product_id = COALESCE(NULLIF($4, ''), product_id),
				quantity   = COALESCE(NULLIF($5::bigint, 0), quantity),
				unit_price = COALESCE(NULLIF($6::numeric, 0), unit_price),
				subtotal   = COALESCE(NULLIF($7::numeric, 0), subtotal),
				tax_rate   = COALESCE($8, tax_rate),
				tax_amount = COALESCE($9, tax_amount),
				total      = COALESCE(NULLIF($10::numeric, 0), total),
				batch_id   = COALESCE(NULLIF($11, ''), batch_id),
				product_name = CASE WHEN $12 <> '' THEN $12::jsonb ELSE product_name END
			WHERE id = $1
		`,
			op.ID,
			strField(d, "receipt_id"),
			strField(d, "store_id"),
			strField(d, "product_id"),
			intField(d, "quantity"),
			numericField(d, "unit_price"),
			numericField(d, "subtotal"),
			numericField(d, "tax_rate"),
			numericField(d, "tax_amount"),
			numericField(d, "total"),
			strField(d, "batch_id"),
			strField(d, "product_name"),
		)
		return err

	case "DELETE":
		_, err := h.db.Exec(ctx, `DELETE FROM cash_receipt_items WHERE id = $1`, op.ID)
		return err

	default:
		return nil
	}
}

// =========================================================================
// payments
// =========================================================================

func (h *Handler) applyPayment(r *http.Request, op models.UploadOperation, claims *auth.Claims) error {
	ctx := r.Context()
	d := op.Data

	switch op.Op {
	case "PUT":
		_, err := h.db.Exec(ctx, `
			INSERT INTO payments
				(id, ref_id, payer_id, receiver_ref, amount, currency, warehouse_id,
				 payment_method, status, reference_number, created_by_user_id, notes,
				 related_docs)
			VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13::jsonb)
			ON CONFLICT (ref_id) DO UPDATE SET
				status         = EXCLUDED.status,
				related_docs   = EXCLUDED.related_docs
		`,
			op.ID,
			strField(d, "ref_id"),
			strField(d, "payer_id"),
			strField(d, "receiver_ref"),
			numericField(d, "amount"),
			strFieldOr(d, "currency", "XAF"),
			strField(d, "warehouse_id"),
			strField(d, "payment_method"),
			strFieldOr(d, "status", "PAYMENT_STATUS_COMPLETED"),
			strField(d, "reference_number"),
			claims.UserID,
			strField(d, "notes"),
			strFieldOr(d, "related_docs", "[]"),
		)
		return err

	case "PATCH":
		_, err := h.db.Exec(ctx, `
			UPDATE payments SET
				payer_id          = COALESCE(NULLIF($2, ''), payer_id),
				receiver_ref      = COALESCE(NULLIF($3, ''), receiver_ref),
				amount            = COALESCE($4, amount),
				currency          = COALESCE(NULLIF($5, ''), currency),
				warehouse_id      = COALESCE(NULLIF($6, ''), warehouse_id),
				payment_method    = COALESCE(NULLIF($7, ''), payment_method),
				status            = COALESCE(NULLIF($8, ''), status),
				reference_number  = COALESCE(NULLIF($9, ''), reference_number),
				notes             = COALESCE(NULLIF($10, ''), notes),
				related_docs      = CASE WHEN $11 <> '' THEN $11::jsonb ELSE related_docs END
			WHERE id = $1
		`,
			op.ID,
			strField(d, "payer_id"),
			strField(d, "receiver_ref"),
			numericField(d, "amount"),
			strField(d, "currency"),
			strField(d, "warehouse_id"),
			strField(d, "payment_method"),
			strField(d, "status"),
			strField(d, "reference_number"),
			strField(d, "notes"),
			strField(d, "related_docs"),
		)
		return err

	case "DELETE":
		_, err := h.db.Exec(ctx, `DELETE FROM payments WHERE id = $1`, op.ID)
		return err

	default:
		return nil
	}
}

// =========================================================================
// gift_vouchers
// =========================================================================

func (h *Handler) applyGiftVoucher(r *http.Request, op models.UploadOperation, claims *auth.Claims) error {
	ctx := r.Context()
	d := op.Data

	switch op.Op {
	case "PUT":
		_, err := h.db.Exec(ctx, `
			INSERT INTO gift_vouchers
				(id, ref_id, voucher_code, initial_value, remaining_value, currency,
				 issued_to_customer, issued_by_user_id, warehouse_id, status, issued_at, valid_until, notes)
			VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,NOW(),NULLIF($11,'')::timestamptz,$12)
			ON CONFLICT (ref_id) DO UPDATE SET
				voucher_code    = EXCLUDED.voucher_code,
				initial_value   = EXCLUDED.initial_value,
				remaining_value = EXCLUDED.remaining_value,
				currency        = EXCLUDED.currency,
				issued_to_customer = EXCLUDED.issued_to_customer,
				issued_by_user_id = EXCLUDED.issued_by_user_id,
				warehouse_id    = EXCLUDED.warehouse_id,
				status          = EXCLUDED.status,
				valid_until     = EXCLUDED.valid_until,
				notes           = EXCLUDED.notes
		`,
			op.ID,
			strField(d, "ref_id"),
			strField(d, "voucher_code"),
			numericField(d, "initial_value"),
			numericField(d, "remaining_value"),
			strFieldOr(d, "currency", "XAF"),
			strField(d, "issued_to_customer"),
			claims.UserID,
			strField(d, "warehouse_id"),
			strFieldOr(d, "status", "VOUCHER_STATUS_ACTIVE"),
			strField(d, "valid_until"),
			strField(d, "notes"),
		)
		return err

	case "PATCH":
		_, err := h.db.Exec(ctx, `
			UPDATE gift_vouchers SET
				voucher_code    = COALESCE(NULLIF($2, ''), voucher_code),
				initial_value   = COALESCE($3, initial_value),
				remaining_value = COALESCE($4, remaining_value),
				currency        = COALESCE(NULLIF($5, ''), currency),
				issued_to_customer = COALESCE(NULLIF($6, ''), issued_to_customer),
				warehouse_id    = COALESCE(NULLIF($7, ''), warehouse_id),
				status          = COALESCE(NULLIF($8, ''), status),
				valid_until     = NULLIF($9, '')::timestamptz,
				notes           = COALESCE(NULLIF($10, ''), notes)
			WHERE id = $1
		`,
			op.ID,
			strField(d, "voucher_code"),
			numericField(d, "initial_value"),
			numericField(d, "remaining_value"),
			strField(d, "currency"),
			strField(d, "issued_to_customer"),
			strField(d, "warehouse_id"),
			strField(d, "status"),
			strField(d, "valid_until"),
			strField(d, "notes"),
		)
		return err

	case "DELETE":
		_, err := h.db.Exec(ctx, `DELETE FROM gift_vouchers WHERE id = $1`, op.ID)
		return err

	default:
		return nil
	}
}

// =========================================================================
// voucher_transactions
// =========================================================================

func (h *Handler) applyVoucherTransaction(r *http.Request, op models.UploadOperation, claims *auth.Claims) error {
	ctx := r.Context()
	d := op.Data

	switch op.Op {
	case "PUT":
		_, err := h.db.Exec(ctx, `
			INSERT INTO voucher_transactions
				(id, ref_id, voucher_id, store_id, related_invoice_id, related_receipt_id,
				 amount_used, remaining_after, used_by_user_id)
			VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9)
			ON CONFLICT (ref_id) DO NOTHING
		`,
			op.ID,
			strField(d, "ref_id"),
			strField(d, "voucher_id"),
			strField(d, "store_id"),
			strField(d, "related_invoice_id"),
			strField(d, "related_receipt_id"),
			numericField(d, "amount_used"),
			numericField(d, "remaining_after"),
			claims.UserID,
		)
		return err

	case "PATCH":
		_, err := h.db.Exec(ctx, `
			UPDATE voucher_transactions SET
				voucher_id         = COALESCE(NULLIF($2, ''), voucher_id),
				store_id           = COALESCE(NULLIF($3, ''), store_id),
				related_invoice_id = COALESCE(NULLIF($4, ''), related_invoice_id),
				related_receipt_id = COALESCE(NULLIF($5, ''), related_receipt_id),
				amount_used        = COALESCE($6, amount_used),
				remaining_after    = COALESCE($7, remaining_after),
				used_by_user_id    = COALESCE(NULLIF($8, ''), used_by_user_id)
			WHERE id = $1
		`,
			op.ID,
			strField(d, "voucher_id"),
			strField(d, "store_id"),
			strField(d, "related_invoice_id"),
			strField(d, "related_receipt_id"),
			numericField(d, "amount_used"),
			numericField(d, "remaining_after"),
			strField(d, "used_by_user_id"),
		)
		return err

	default:
		return nil
	}
}

// =========================================================================
// purchase_orders
// =========================================================================

func (h *Handler) applyPurchaseOrder(r *http.Request, op models.UploadOperation, claims *auth.Claims) error {
	ctx := r.Context()
	d := op.Data

	switch op.Op {
	case "PUT":
		_, err := h.db.Exec(ctx, `
			INSERT INTO purchase_orders
				(id, ref_id, supplier_id, store_id, status, total_amount, currency,
				 created_by_user_id, expected_delivery_date, destination_address,
				 store_name, supplier_name, notes, payment_id, sub_total, tax_total, order_date)
			VALUES ($1,$2,$3,$4,$5,$6,$7,$8,
			        NULLIF($9,'')::date,
			        $10,$11,$12,$13,$14,$15,$16,$17)
			ON CONFLICT (ref_id) DO UPDATE SET
				status                 = EXCLUDED.status,
				total_amount           = EXCLUDED.total_amount,
				expected_delivery_date = EXCLUDED.expected_delivery_date,
				notes                  = EXCLUDED.notes
		`,
			op.ID,
			strField(d, "ref_id"),
			strField(d, "supplier_id"),
			strField(d, "store_id"),
			strFieldOr(d, "status", "PO_STATUS_DRAFT"),
			numericField(d, "total_amount"),
			strFieldOr(d, "currency", "XAF"),
			claims.UserID,
			strField(d, "expected_delivery_date"),
			strField(d, "destination_address"),
			strField(d, "store_name"),
			strField(d, "supplier_name"),
			strField(d, "notes"),
			strField(d, "payment_id"),
			numericField(d, "sub_total"),
			numericField(d, "tax_total"),
			strField(d, "order_date"),
		)
		return err

	case "PATCH":
		_, err := h.db.Exec(ctx, `
			UPDATE purchase_orders SET
				status = COALESCE(NULLIF($2, ''), status)
			WHERE id = $1
		`,
			op.ID,
			strField(d, "status"),
		)
		return err

	case "DELETE":
		_, err := h.db.Exec(ctx, `
			DELETE FROM purchase_orders WHERE id = $1 AND status = 'PO_STATUS_DRAFT'
		`, op.ID)
		return err

	default:
		return nil
	}
}

// =========================================================================
// purchase_order_line_items
// =========================================================================

func (h *Handler) applyPurchaseOrderLineItem(r *http.Request, op models.UploadOperation, _ *auth.Claims) error {
	ctx := r.Context()
	d := op.Data

	// log the request
	h.logger.Info("purchase_order_line_items", "op", op)

	switch op.Op {
	case "PUT":
		_, err := h.db.Exec(ctx, `
			INSERT INTO purchase_order_line_items
				(id, purchase_order_id, store_id, product_id,
				 quantity_ordered, unit_price, total, batch_id, quantity_received, tax_amount,
				 product_name)
			VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11::jsonb)
			ON CONFLICT (purchase_order_id, product_id) DO UPDATE SET
				purchase_order_id = EXCLUDED.purchase_order_id,
				store_id = EXCLUDED.store_id,
				product_id = EXCLUDED.product_id,
				quantity_ordered = EXCLUDED.quantity_ordered,
				unit_price = EXCLUDED.unit_price,
				total      = EXCLUDED.total,
				batch_id   = EXCLUDED.batch_id,
				quantity_received = EXCLUDED.quantity_received,
				tax_amount = EXCLUDED.tax_amount,
				product_name = EXCLUDED.product_name
		`,
			op.ID,
			strField(d, "purchase_order_id"),
			strField(d, "store_id"),
			strField(d, "product_id"),
			intField(d, "quantity_ordered"),
			numericField(d, "unit_price"),
			numericField(d, "total"),
			strField(d, "batch_id"),
			numericField(d, "quantity_received"),
			numericField(d, "tax_amount"),
			strField(d, "product_name"),
		)
		return err

	case "PATCH":
		_, err := h.db.Exec(ctx, `
			UPDATE purchase_order_line_items SET
				quantity_received = COALESCE(NULLIF($2::numeric, 0), quantity_received)
			WHERE id = $1
		`,
			op.ID,
			numericField(d, "quantity_received"),
		)
		return err

	case "DELETE":
		_, err := h.db.Exec(ctx, `DELETE FROM purchase_order_line_items WHERE id = $1`, op.ID)
		return err

	default:
		return nil
	}
}

// =========================================================================
// receiving_notes
// =========================================================================

func (h *Handler) applyReceivingNote(r *http.Request, op models.UploadOperation, claims *auth.Claims) error {
	ctx := r.Context()
	d := op.Data

	switch op.Op {
	case "PUT":
		_, err := h.db.Exec(ctx, `
			INSERT INTO receiving_notes
				(id, ref_id, related_purchase_order_id, supplier_id, store_id,
               received_by_user_id, received_at, notes, created_at)
			VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9)
			ON CONFLICT (ref_id) DO NOTHING
		`,
			op.ID,
			strField(d, "ref_id"),
			strField(d, "related_purchase_order_id"),
			strField(d, "supplier_id"),
			strField(d, "store_id"),
			claims.UserID,
			strField(d, "received_at"),
			strField(d, "notes"),
			strField(d, "created_at"),
		)
		return err

	case "PATCH":
		_, err := h.db.Exec(ctx, `
			UPDATE receiving_notes SET
				status = COALESCE(NULLIF($2, ''), status)
			WHERE id = $1
		`,
			op.ID,
			strField(d, "status"),
		)
		return err

	default:
		return nil
	}
}

// =========================================================================
// receiving_note_line_items
// =========================================================================

func (h *Handler) applyReceivingNoteLineItem(r *http.Request, op models.UploadOperation, _ *auth.Claims) error {
	ctx := r.Context()
	d := op.Data

	switch op.Op {
	case "PUT":
		_, err := h.db.Exec(ctx, `
			INSERT INTO receiving_note_line_items
				(id, receiving_note_id, store_id, product_id,
				 quantity_expected, quantity_received, quantity_rejected, batch_id, purchase_price)
			VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9)
			ON CONFLICT (receiving_note_id, product_id) DO UPDATE SET
				quantity_received = EXCLUDED.quantity_received,
				quantity_rejected = EXCLUDED.quantity_rejected,
				batch_id          = EXCLUDED.batch_id
		`,
			op.ID,
			strField(d, "receiving_note_id"),
			strField(d, "store_id"),
			strField(d, "product_id"),
			numericField(d, "quantity_expected"),
			numericField(d, "quantity_received"),
			numericField(d, "quantity_rejected"),
			strField(d, "batch_id"),
			numericField(d, "purchase_price"),
		)
		return err

	case "PATCH":
		_, err := h.db.Exec(ctx, `
			UPDATE receiving_note_line_items SET
				receiving_note_id = COALESCE(NULLIF($2, ''), receiving_note_id),
				store_id          = COALESCE(NULLIF($3, ''), store_id),
				product_id        = COALESCE(NULLIF($4, ''), product_id),
				quantity_expected   = COALESCE(NULLIF($5::numeric, 0), quantity_expected),
				quantity_received   = COALESCE(NULLIF($6::numeric, 0), quantity_received),
				quantity_rejected   = COALESCE(NULLIF($7::numeric, 0), quantity_rejected),
				rejection_reason    = COALESCE(NULLIF($8, ''), rejection_reason),
				batch_id            = COALESCE(NULLIF($9, ''), batch_id),
				expiration_date     = NULLIF($10, '')::timestamptz,
				purchase_price      = COALESCE(NULLIF($11::numeric, 0), purchase_price)
			WHERE id = $1
		`,
			op.ID,
			strField(d, "receiving_note_id"),
			strField(d, "store_id"),
			strField(d, "product_id"),
			numericField(d, "quantity_expected"),
			numericField(d, "quantity_received"),
			numericField(d, "quantity_rejected"),
			strField(d, "rejection_reason"),
			strField(d, "batch_id"),
			strField(d, "expiration_date"),
			numericField(d, "purchase_price"),
		)
		return err

	default:
		return nil
	}
}

// =========================================================================
// batches
// =========================================================================

func (h *Handler) applyBatch(r *http.Request, op models.UploadOperation, _ *auth.Claims) error {
	ctx := r.Context()
	d := op.Data

	switch op.Op {
	case "PUT":
		_, err := h.db.Exec(ctx, `
			INSERT INTO batches
				(id, ref_id, product_id, warehouse_id, quantity, expiration_date,
				 supplier_id, purchase_price, status, notes)
			VALUES ($1,$2,$3,$4,$5,
			        NULLIF($6,'')::timestamptz,
			        $7,$8,$9,$10)
			ON CONFLICT (ref_id) DO UPDATE SET
				quantity   = EXCLUDED.quantity,
				status     = EXCLUDED.status,
				notes      = EXCLUDED.notes
		`,
			op.ID,
			strField(d, "ref_id"),
			strField(d, "product_id"),
			strField(d, "warehouse_id"),
			intField(d, "quantity"),
			strField(d, "expiration_date"),
			strField(d, "supplier_id"),
			intField(d, "purchase_price"),
			strFieldOr(d, "status", "BATCH_STATUS_ACTIVE"),
			strField(d, "notes"),
		)
		return err

	case "PATCH":
		_, err := h.db.Exec(ctx, `
			UPDATE batches SET
				product_id       = COALESCE(NULLIF($2, ''), product_id),
				warehouse_id     = COALESCE(NULLIF($3, ''), warehouse_id),
				quantity         = COALESCE(NULLIF($4::bigint, 0), quantity),
				expiration_date  = NULLIF($5, '')::timestamptz,
				supplier_id      = COALESCE(NULLIF($6, ''), supplier_id),
				purchase_price   = COALESCE(NULLIF($7::bigint, 0), purchase_price),
				status           = COALESCE(NULLIF($8, ''), status),
				notes            = COALESCE(NULLIF($9, ''), notes)
			WHERE id = $1
		`,
			op.ID,
			strField(d, "product_id"),
			strField(d, "warehouse_id"),
			intField(d, "quantity"),
			strField(d, "expiration_date"),
			strField(d, "supplier_id"),
			intField(d, "purchase_price"),
			strField(d, "status"),
			strField(d, "notes"),
		)
		return err

	default:
		return nil
	}
}

// =========================================================================
// inventory_transactions
// =========================================================================

func (h *Handler) applyInventoryTransaction(r *http.Request, op models.UploadOperation, claims *auth.Claims) error {
	ctx := r.Context()
	d := op.Data

	switch op.Op {
	case "PUT":
		_, err := h.db.Exec(ctx, `
			INSERT INTO inventory_transactions
				(id, ref_id, store_id, product_id, transaction_type, quantity_change,
				 quantity_before, quantity_after, related_document_type, related_document_id,
				 performed_by_user_id, batch_id, notes, unit_price, total_amount, currency)
			VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16)
			ON CONFLICT (ref_id) DO NOTHING
		`,
			op.ID,
			strField(d, "ref_id"),
			strField(d, "store_id"),
			strField(d, "product_id"),
			strField(d, "transaction_type"),
			intField(d, "quantity_change"),
			intField(d, "quantity_before"),
			intField(d, "quantity_after"),
			strField(d, "related_document_type"),
			strField(d, "related_document_id"),
			claims.UserID,
			strField(d, "batch_id"),
			strField(d, "notes"),
			numericField(d, "unit_price"),
			numericField(d, "total_amount"),
			strFieldOr(d, "currency", "XAF"),
		)
		return err

	case "PATCH":
		_, err := h.db.Exec(ctx, `
			UPDATE inventory_transactions SET
				store_id              = COALESCE(NULLIF($2, ''), store_id),
				product_id            = COALESCE(NULLIF($3, ''), product_id),
				transaction_type      = COALESCE(NULLIF($4, ''), transaction_type),
				quantity_change       = COALESCE(NULLIF($5::bigint, 0), quantity_change),
				quantity_before       = COALESCE(NULLIF($6::bigint, 0), quantity_before),
				quantity_after        = COALESCE(NULLIF($7::bigint, 0), quantity_after),
				related_document_type = COALESCE(NULLIF($8, ''), related_document_type),
				related_document_id   = COALESCE(NULLIF($9, ''), related_document_id),
				batch_id              = COALESCE(NULLIF($10, ''), batch_id),
				notes                 = COALESCE(NULLIF($11, ''), notes),
				unit_price            = COALESCE($12, unit_price),
				total_amount          = COALESCE($13, total_amount),
				currency              = COALESCE(NULLIF($14, ''), currency)
			WHERE id = $1
		`,
			op.ID,
			strField(d, "store_id"),
			strField(d, "product_id"),
			strField(d, "transaction_type"),
			intField(d, "quantity_change"),
			intField(d, "quantity_before"),
			intField(d, "quantity_after"),
			strField(d, "related_document_type"),
			strField(d, "related_document_id"),
			strField(d, "batch_id"),
			strField(d, "notes"),
			numericField(d, "unit_price"),
			numericField(d, "total_amount"),
			strField(d, "currency"),
		)
		return err

	default:
		return nil
	}
}

// =========================================================================
// sales_orders
// =========================================================================

func (h *Handler) applySalesOrder(r *http.Request, op models.UploadOperation, claims *auth.Claims) error {
	ctx := r.Context()
	d := op.Data

	switch op.Op {
	case "PUT":
		_, err := h.db.Exec(ctx, `
			INSERT INTO sales_orders
				(id, ref_id, customer, seller_id, status, total_amount, currency,
				 created_by_user_id, notes)
			VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9)
			ON CONFLICT (ref_id) DO UPDATE SET
				status       = EXCLUDED.status,
				total_amount = EXCLUDED.total_amount,
				notes        = EXCLUDED.notes
		`,
			op.ID,
			strField(d, "ref_id"),
			strField(d, "customer"),
			strField(d, "seller_id"),
			strFieldOr(d, "status", "SO_STATUS_DRAFT"),
			numericField(d, "total_amount"),
			strFieldOr(d, "currency", "XAF"),
			claims.UserID,
			strField(d, "notes"),
		)
		return err

	case "PATCH":
		_, err := h.db.Exec(ctx, `
			UPDATE sales_orders SET
				status = COALESCE(NULLIF($2, ''), status)
			WHERE id = $1
		`,
			op.ID,
			strField(d, "status"),
		)
		return err

	default:
		return nil
	}
}

// =========================================================================
// sales_order_line_items
// =========================================================================

func (h *Handler) applySalesOrderLineItem(r *http.Request, op models.UploadOperation, _ *auth.Claims) error {
	ctx := r.Context()
	d := op.Data

	switch op.Op {
	case "PUT":
		_, err := h.db.Exec(ctx, `
			INSERT INTO sales_order_line_items
				(id, sales_order_id, store_id, product_id,
				 quantity, unit_price, total, batch_id)
			VALUES ($1,$2,$3,$4,$5,$6,$7,$8)
			ON CONFLICT (sales_order_id, product_id) DO UPDATE SET
				quantity   = EXCLUDED.quantity,
				unit_price = EXCLUDED.unit_price,
				total      = EXCLUDED.total,
				batch_id   = EXCLUDED.batch_id
		`,
			op.ID,
			strField(d, "sales_order_id"),
			strField(d, "store_id"),
			strField(d, "product_id"),
			intField(d, "quantity"),
			numericField(d, "unit_price"),
			numericField(d, "total"),
			strField(d, "batch_id"),
		)
		return err

	case "PATCH":
		_, err := h.db.Exec(ctx, `
			UPDATE sales_order_line_items SET
				sales_order_id = COALESCE(NULLIF($2, ''), sales_order_id),
				store_id       = COALESCE(NULLIF($3, ''), store_id),
				product_id     = COALESCE(NULLIF($4, ''), product_id),
				quantity       = COALESCE(NULLIF($5::bigint, 0), quantity),
				unit_price     = COALESCE(NULLIF($6::numeric, 0), unit_price),
				total          = COALESCE(NULLIF($7::numeric, 0), total),
				batch_id       = COALESCE(NULLIF($8, ''), batch_id)
			WHERE id = $1
		`,
			op.ID,
			strField(d, "sales_order_id"),
			strField(d, "store_id"),
			strField(d, "product_id"),
			intField(d, "quantity"),
			numericField(d, "unit_price"),
			numericField(d, "total"),
			strField(d, "batch_id"),
		)
		return err

	case "DELETE":
		_, err := h.db.Exec(ctx, `DELETE FROM sales_order_line_items WHERE id = $1`, op.ID)
		return err

	default:
		return nil
	}
}

// =========================================================================
// invoices
// =========================================================================

func (h *Handler) applyInvoice(r *http.Request, op models.UploadOperation, claims *auth.Claims) error {
	ctx := r.Context()
	d := op.Data

	switch op.Op {
	case "PUT":
		_, err := h.db.Exec(ctx, `
			INSERT INTO invoices
				(id, ref_id, invoice_type, issuer_id, recipient_id, status,
				 subtotal, tax_amount, total_amount, currency,
				 issue_date, due_date, created_by_user_id, notes)
			VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,
			        COALESCE(NULLIF($11,'')::date, CURRENT_DATE),
			        NULLIF($12,'')::date,
			        $13,$14)
			ON CONFLICT (ref_id) DO UPDATE SET
				status       = EXCLUDED.status,
				total_amount = EXCLUDED.total_amount,
				tax_amount   = EXCLUDED.tax_amount,
				notes        = EXCLUDED.notes
		`,
			op.ID,
			strField(d, "ref_id"),
			strField(d, "invoice_type"),
			strField(d, "issuer_id"),
			strField(d, "recipient_id"),
			strFieldOr(d, "status", "INVOICE_STATUS_DRAFT"),
			numericField(d, "subtotal"),
			numericField(d, "tax_amount"),
			numericField(d, "total_amount"),
			strFieldOr(d, "currency", "XAF"),
			strField(d, "issue_date"),
			strField(d, "due_date"),
			claims.UserID,
			strField(d, "notes"),
		)
		return err

	case "PATCH":
		_, err := h.db.Exec(ctx, `
			UPDATE invoices SET
				status = COALESCE(NULLIF($2, ''), status)
			WHERE id = $1
		`,
			op.ID,
			strField(d, "status"),
		)
		return err

	default:
		return nil
	}
}

// =========================================================================
// invoice_line_items
// =========================================================================

func (h *Handler) applyInvoiceLineItem(r *http.Request, op models.UploadOperation, _ *auth.Claims) error {
	ctx := r.Context()
	d := op.Data

	switch op.Op {
	case "PUT":
		_, err := h.db.Exec(ctx, `
			INSERT INTO invoice_line_items
				(id, invoice_id, store_id, product_id,
				 quantity, unit_price, subtotal, tax_rate, tax_amount, total, batch_id, product_name)
			VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12::jsonb)
			ON CONFLICT (invoice_id, product_id) DO UPDATE SET
				quantity   = EXCLUDED.quantity,
				unit_price = EXCLUDED.unit_price,
				subtotal   = EXCLUDED.subtotal,
				tax_amount = EXCLUDED.tax_amount,
				total      = EXCLUDED.total,
				batch_id   = EXCLUDED.batch_id,
				product_name = EXCLUDED.product_name
		`,
			op.ID,
			strField(d, "invoice_id"),
			strField(d, "store_id"),
			strField(d, "product_id"),
			intField(d, "quantity"),
			numericField(d, "unit_price"),
			numericField(d, "subtotal"),
			numericField(d, "tax_rate"),
			numericField(d, "tax_amount"),
			numericField(d, "total"),
			strField(d, "batch_id"),
			strFieldOr(d, "product_name", "{}"),
		)
		return err

	case "PATCH":
		_, err := h.db.Exec(ctx, `
			UPDATE invoice_line_items SET
				invoice_id   = COALESCE(NULLIF($2, ''), invoice_id),
				store_id     = COALESCE(NULLIF($3, ''), store_id),
				product_id   = COALESCE(NULLIF($4, ''), product_id),
				quantity     = COALESCE(NULLIF($5::bigint, 0), quantity),
				unit_price   = COALESCE(NULLIF($6::numeric, 0), unit_price),
				subtotal     = COALESCE(NULLIF($7::numeric, 0), subtotal),
				tax_rate     = COALESCE($8, tax_rate),
				tax_amount   = COALESCE($9, tax_amount),
				total        = COALESCE(NULLIF($10::numeric, 0), total),
				batch_id     = COALESCE(NULLIF($11, ''), batch_id),
				product_name = CASE WHEN $12 <> '' THEN $12::jsonb ELSE product_name END
			WHERE id = $1
		`,
			op.ID,
			strField(d, "invoice_id"),
			strField(d, "store_id"),
			strField(d, "product_id"),
			intField(d, "quantity"),
			numericField(d, "unit_price"),
			numericField(d, "subtotal"),
			numericField(d, "tax_rate"),
			numericField(d, "tax_amount"),
			numericField(d, "total"),
			strField(d, "batch_id"),
			strField(d, "product_name"),
		)
		return err

	case "DELETE":
		_, err := h.db.Exec(ctx, `DELETE FROM invoice_line_items WHERE id = $1`, op.ID)
		return err

	default:
		return nil
	}
}

// =========================================================================
// bills
// =========================================================================

func (h *Handler) applyBill(r *http.Request, op models.UploadOperation, _ *auth.Claims) error {
	ctx := r.Context()
	d := op.Data

	switch op.Op {
	case "PUT":
		_, err := h.db.Exec(ctx, `
			INSERT INTO bills
				(id, ref_id, related_purchase_order_id, supplier_id, store_id, status,
				 payment_ids, bill_date, due_date, sub_total, tax_total, total_amount, balance_due, currency, notes)
			VALUES ($1,$2,$3,$4,$5,$6,$7,
			        COALESCE(NULLIF($8,'')::date, CURRENT_DATE),
			        NULLIF($9,'')::date,
			        $10,$11,$12,$13,$14,$15)
			ON CONFLICT (ref_id) DO UPDATE SET
				status       = EXCLUDED.status,
				total_amount = EXCLUDED.total_amount,
				tax_total    = EXCLUDED.tax_total,
				balance_due  = EXCLUDED.balance_due,
				payment_ids  = EXCLUDED.payment_ids,
				notes        = EXCLUDED.notes
		`,
			op.ID,
			strField(d, "ref_id"),
			strField(d, "related_purchase_order_id"),
			strField(d, "supplier_id"),
			strField(d, "store_id"),
			strFieldOr(d, "status", "BILL_STATUS_DRAFT"),
			strField(d, "payment_ids"),
			strField(d, "bill_date"),
			strField(d, "due_date"),
			numericField(d, "sub_total"),
			numericField(d, "tax_total"),
			numericField(d, "total_amount"),
			numericField(d, "balance_due"),
			strFieldOr(d, "currency", "XAF"),
			strField(d, "notes"),
		)
		return err

	case "PATCH":
		_, err := h.db.Exec(ctx, `
			UPDATE bills SET
				status = COALESCE(NULLIF($2, ''), status),
				payment_ids = COALESCE(NULLIF($3, ''), payment_ids),
				balance_due = COALESCE($4, balance_due)
			WHERE id = $1
		`,
			op.ID,
			strField(d, "status"),
			strField(d, "payment_ids"),
			numericField(d, "balance_due"),
		)
		return err

	case "DELETE":
		_, err := h.db.Exec(ctx, `DELETE FROM bills WHERE id = $1`, op.ID)
		return err

	default:
		return nil
	}
}

// =========================================================================
// bill_line_items
// =========================================================================

func (h *Handler) applyBillLineItem(r *http.Request, op models.UploadOperation, _ *auth.Claims) error {
	ctx := r.Context()
	d := op.Data

	switch op.Op {
	case "PUT":
		_, err := h.db.Exec(ctx, `
			INSERT INTO bill_line_items
				(id, bill_id, store_id, product_id,
				 description, quantity, unit_price, tax_amount, total)
			VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9)
			ON CONFLICT (bill_id, product_id) DO UPDATE SET
				quantity    = EXCLUDED.quantity,
				unit_price  = EXCLUDED.unit_price,
				tax_amount  = EXCLUDED.tax_amount,
				total       = EXCLUDED.total,
				description = EXCLUDED.description
		`,
			op.ID,
			strField(d, "bill_id"),
			strField(d, "store_id"),
			strField(d, "product_id"),
			strField(d, "description"),
			intField(d, "quantity"),
			numericField(d, "unit_price"),
			numericField(d, "tax_amount"),
			numericField(d, "total"),
		)
		return err

	case "PATCH":
		_, err := h.db.Exec(ctx, `
			UPDATE bill_line_items SET
				bill_id      = COALESCE(NULLIF($2, ''), bill_id),
				store_id     = COALESCE(NULLIF($3, ''), store_id),
				product_id   = COALESCE(NULLIF($4, ''), product_id),
				description  = COALESCE(NULLIF($5, ''), description),
				quantity     = COALESCE(NULLIF($6::bigint, 0), quantity),
				unit_price   = COALESCE(NULLIF($7::numeric, 0), unit_price),
				tax_amount   = COALESCE($8, tax_amount),
				total        = COALESCE(NULLIF($9::numeric, 0), total)
			WHERE id = $1
		`,
			op.ID,
			strField(d, "bill_id"),
			strField(d, "store_id"),
			strField(d, "product_id"),
			strField(d, "description"),
			intField(d, "quantity"),
			numericField(d, "unit_price"),
			numericField(d, "tax_amount"),
			numericField(d, "total"),
		)
		return err

	case "DELETE":
		_, err := h.db.Exec(ctx, `DELETE FROM bill_line_items WHERE id = $1`, op.ID)
		return err

	default:
		return nil
	}
}

// =========================================================================
// delivery_note_line_items
// =========================================================================

func (h *Handler) applyDeliveryNoteLineItem(r *http.Request, op models.UploadOperation, _ *auth.Claims) error {
	ctx := r.Context()
	d := op.Data

	switch op.Op {
	case "PUT":
		_, err := h.db.Exec(ctx, `
			INSERT INTO delivery_note_line_items
				(id, delivery_note_id, store_id, product_id, quantity, batch_id)
			VALUES ($1,$2,$3,$4,$5,$6,$7)
			ON CONFLICT (delivery_note_id, product_id) DO UPDATE SET
				quantity = EXCLUDED.quantity,
				batch_id = EXCLUDED.batch_id
		`,
			op.ID,
			strField(d, "delivery_note_id"),
			strField(d, "store_id"),
			strField(d, "product_id"),
			numericField(d, "quantity"),
			strField(d, "batch_id"),
		)
		return err

	case "PATCH":
		_, err := h.db.Exec(ctx, `
			UPDATE delivery_note_line_items SET
				delivery_note_id = COALESCE(NULLIF($2, ''), delivery_note_id),
				store_id         = COALESCE(NULLIF($3, ''), store_id),
				product_id       = COALESCE(NULLIF($4, ''), product_id),
				quantity         = COALESCE(NULLIF($5::numeric, 0), quantity),
				batch_id         = COALESCE(NULLIF($6, ''), batch_id)
			WHERE id = $1
		`,
			op.ID,
			strField(d, "delivery_note_id"),
			strField(d, "store_id"),
			strField(d, "product_id"),
			numericField(d, "quantity"),
			strField(d, "batch_id"),
		)
		return err

	case "DELETE":
		_, err := h.db.Exec(ctx, `DELETE FROM delivery_note_line_items WHERE id = $1`, op.ID)
		return err

	default:
		return nil
	}
}

// =========================================================================
// suppliers
// =========================================================================

func (h *Handler) applySupplier(r *http.Request, op models.UploadOperation, _ *auth.Claims) error {
	ctx := r.Context()
	d := op.Data

	h.logger.Info("applySupplier", "op", op)

	switch op.Op {
	case "PUT":
		_, err := h.db.Exec(ctx, `
			INSERT INTO suppliers
				(id, ref_id, name, description, contact_phone, contact_email,
				 contact_address, status, logo_link_id, external_links_ids, store_ids)
			VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11)
			ON CONFLICT (ref_id) DO UPDATE SET
				name            = EXCLUDED.name,
				description     = EXCLUDED.description,
				contact_phone   = EXCLUDED.contact_phone,
				contact_email   = EXCLUDED.contact_email,
				contact_address = EXCLUDED.contact_address,
				status          = EXCLUDED.status
				logo_link_id          = EXCLUDED.logo_link_id
				external_links_ids          = EXCLUDED.external_links_ids
				store_ids          = EXCLUDED.store_ids
		`,
			op.ID,
			strField(d, "ref_id"),
			strField(d, "name"),
			strField(d, "description"),
			strField(d, "contact_phone"),
			strField(d, "contact_email"),
			strField(d, "contact_address"),
			strFieldOr(d, "status", "SUPPLIER_STATUS_ACTIVE"),
			strField(d, "logo_link_id"),
			strFieldOr(d, "external_links_ids", `[]`),
			strField(d, "store_ids"),
		)
		return err

	case "PATCH":
		_, err := h.db.Exec(ctx, `
			UPDATE suppliers SET
				name            = COALESCE(NULLIF($2, ''), name),
				description     = COALESCE(NULLIF($3, ''), description),
				contact_phone   = COALESCE(NULLIF($4, ''), contact_phone),
				contact_email   = COALESCE(NULLIF($5, ''), contact_email),
				contact_address = COALESCE(NULLIF($6, ''), contact_address),
				status          = COALESCE(NULLIF($7, ''), status),
				logo_link_id    = COALESCE(NULLIF($8, ''), logo_link_id),
				external_links_ids = COALESCE(NULLIF($9, ''), external_links_ids),
				store_ids = CASE WHEN $10 <> '' THEN (SELECT array_agg(x) FROM jsonb_array_elements_text($10::jsonb) AS x) ELSE store_ids END
			WHERE id = $1
		`,
			op.ID,
			strField(d, "name"),
			strField(d, "description"),
			strField(d, "contact_phone"),
			strField(d, "contact_email"),
			strField(d, "contact_address"),
			strField(d, "status"),
			strField(d, "logo_link_id"),
			strField(d, "external_links_ids"),
			strField(d, "store_ids"),
		)
		return err

	case "DELETE":
		_, err := h.db.Exec(ctx, `DELETE FROM suppliers WHERE id = $1`, op.ID)
		return err

	default:
		return nil
	}
}

// =========================================================================
// stores  (settings updates — name, phone, email, costing_method, tax)
// =========================================================================

func (h *Handler) applyStore(r *http.Request, op models.UploadOperation, _ *auth.Claims) error {
	ctx := r.Context()
	d := op.Data

	switch op.Op {
	case "PATCH":
		_, err := h.db.Exec(ctx, `
			UPDATE stores SET
				name           = COALESCE(NULLIF($2, ''), name),
				phone          = COALESCE(NULLIF($3, ''), phone),
				email          = COALESCE(NULLIF($4, ''), email),
				costing_method = COALESCE(NULLIF($5, ''), costing_method),
				updated_at     = NOW()
			WHERE id = $1
		`,
			op.ID,
			strField(d, "name"),
			strField(d, "phone"),
			strField(d, "email"),
			strField(d, "costing_method"),
		)
		return err

	default:
		return nil
	}
}

// =========================================================================
// businesses  (settings updates — name, description)
// =========================================================================

func (h *Handler) applyBusiness(r *http.Request, op models.UploadOperation, _ *auth.Claims) error {
	ctx := r.Context()
	d := op.Data

	switch op.Op {
	case "PATCH":
		_, err := h.db.Exec(ctx, `
			UPDATE businesses SET
				name        = COALESCE(NULLIF($2, ''), name),
				description = COALESCE(NULLIF($3, ''), description),
				updated_at  = NOW()
			WHERE id = $1
		`,
			op.ID,
			strField(d, "name"),
			strField(d, "description"),
		)
		return err

	default:
		return nil
	}
}

// =========================================================================
// users  (profile updates only — password_hash and sensitive fields are
//         never accepted from clients)
// =========================================================================

func (h *Handler) applyUser(r *http.Request, op models.UploadOperation, claims *auth.Claims) error {
	ctx := r.Context()
	d := op.Data

	// Security: a user may only update their own record.
	if op.ID != claims.UserID {
		h.logger.Warn("user attempted to mutate another user's record",
			"claimed_user", claims.UserID, "target_id", op.ID)
		return nil
	}

	switch op.Op {
	case "PATCH":
		_, err := h.db.Exec(ctx, `
			UPDATE users SET
				active_business_id = COALESCE(NULLIF($2, ''), active_business_id),
				active_store_id    = COALESCE(NULLIF($3, ''), active_store_id),
				first_name         = COALESCE(NULLIF($4, ''), first_name),
				last_name          = COALESCE(NULLIF($5, ''), last_name),
				phone_number       = COALESCE(NULLIF($6, ''), phone_number),
				updated_at         = NOW()
			WHERE id = $1
		`,
			op.ID,
			strField(d, "active_business_id"),
			strField(d, "active_store_id"),
			strField(d, "first_name"),
			strField(d, "last_name"),
			strField(d, "phone_number"),
		)
		return err

	default:
		return nil
	}
}

// =========================================================================
// global_products
// =========================================================================

func (h *Handler) applyGlobalProduct(r *http.Request, op models.UploadOperation, _ *auth.Claims) error {
	ctx := r.Context()
	d := op.Data

	h.logger.Info("applyGlobalProduct", "op", op)

	switch op.Op {
	case "PUT":
		// name and categories are JSONB — the client sends them as JSON strings.
		_, err := h.db.Exec(ctx, `
			INSERT INTO global_products
				(id, ref_id, name, description, bar_code_value, categories, status, images_links_ids)
			VALUES ($1,$2,$3::jsonb,$4::jsonb,$5,$6::jsonb,$7,$8)
			ON CONFLICT (ref_id) DO UPDATE SET
				name           = EXCLUDED.name,
				description    = EXCLUDED.description,
				bar_code_value = EXCLUDED.bar_code_value,
				categories     = EXCLUDED.categories,
				status         = EXCLUDED.status,
				images_links_ids       = EXCLUDED.images_links_ids
		`,
			op.ID,
			strField(d, "ref_id"),
			strFieldOr(d, "name", `{}`),
			strFieldOr(d, "description", `null`),
			strField(d, "bar_code_value"),
			strFieldOr(d, "categories", `[]`),
			strFieldOr(d, "status", "GLOBAL_PRODUCT_STATUS_ACTIVE"),
			strFieldOr(d, "images_links_ids", `[]`),
		)
		return err

	case "PATCH":
		_, err := h.db.Exec(ctx, `
			UPDATE global_products SET
				name           = CASE WHEN $2 <> '' THEN $2::jsonb ELSE name END,
				description    = CASE WHEN $3 <> '' THEN $3::jsonb ELSE description END,
				bar_code_value = COALESCE(NULLIF($4,''), bar_code_value),
				categories     = CASE WHEN $5 <> '' THEN $5::jsonb ELSE categories END,
				status         = COALESCE(NULLIF($6,''), status),
				images_links_ids = CASE WHEN $7 <> '' THEN (SELECT array_agg(x) FROM jsonb_array_elements_text($7::jsonb) AS x) ELSE images_links_ids END
			WHERE id = $1
		`,
			op.ID,
			strField(d, "name"),
			strField(d, "description"),
			strField(d, "bar_code_value"),
			strField(d, "categories"),
			strField(d, "status"),
			strField(d, "images_links_ids"),
		)
		return err

	case "DELETE":
		_, err := h.db.Exec(ctx, `DELETE FROM global_products WHERE id = $1`, op.ID)
		return err

	default:
		return nil
	}
}

// =========================================================================
// categories
// =========================================================================

func (h *Handler) applyCategory(r *http.Request, op models.UploadOperation, _ *auth.Claims) error {
	ctx := r.Context()
	d := op.Data

	switch op.Op {
	case "PUT":
		_, err := h.db.Exec(ctx, `
			INSERT INTO categories
				(id, ref_id, name, parent_category_id, status, type, business_id)
			VALUES ($1,$2,$3::jsonb,$4,$5,$6,$7)
			ON CONFLICT (ref_id) DO UPDATE SET
				name               = EXCLUDED.name,
				parent_category_id = EXCLUDED.parent_category_id,
				status             = EXCLUDED.status,
				type               = EXCLUDED.type
		`,
			op.ID,
			strField(d, "ref_id"),
			strFieldOr(d, "name", `{}`),
			strField(d, "parent_category_id"),
			strFieldOr(d, "status", "CATEGORY_STATUS_ACTIVE"),
			strFieldOr(d, "type", "CATEGORY_TYPE_PRODUCT"),
			strField(d, "business_id"),
		)
		return err

	case "PATCH":
		_, err := h.db.Exec(ctx, `
			UPDATE categories SET
				name               = CASE WHEN $2 <> '' THEN $2::jsonb ELSE name END,
				parent_category_id = COALESCE(NULLIF($3,''), parent_category_id),
				status             = COALESCE(NULLIF($4,''), status)
			WHERE id = $1
		`,
			op.ID,
			strField(d, "name"),
			strField(d, "parent_category_id"),
			strField(d, "status"),
		)
		return err

	case "DELETE":
		_, err := h.db.Exec(ctx, `DELETE FROM categories WHERE id = $1`, op.ID)
		return err

	default:
		return nil
	}
}

// =========================================================================
// resource_links
// =========================================================================

func (h *Handler) applyResourceLink(r *http.Request, op models.UploadOperation, _ *auth.Claims) error {
	ctx := r.Context()
	d := op.Data

	switch op.Op {
	case "PUT":
		_, err := h.db.Exec(ctx, `
			INSERT INTO resource_links
				(id, ref_id, target_uri, icon_uri, info, label, is_orphan)
			VALUES ($1,$2,$3,$4,$5,$6,$7)
			ON CONFLICT (ref_id) DO UPDATE SET
				target_uri = EXCLUDED.target_uri,
				icon_uri   = EXCLUDED.icon_uri,
				info       = EXCLUDED.info,
				label      = EXCLUDED.label,
				is_orphan  = EXCLUDED.is_orphan
		`,
			op.ID,
			strField(d, "ref_id"),
			strField(d, "target_uri"),
			strField(d, "icon_uri"),
			strField(d, "info"),
			strField(d, "label"),
			boolFieldOr(d, "is_orphan", false),
		)
		return err

	case "PATCH":
		_, err := h.db.Exec(ctx, `
			UPDATE resource_links SET
				target_uri = COALESCE(NULLIF($2, ''), target_uri),
				icon_uri   = COALESCE(NULLIF($3, ''), icon_uri),
				info       = COALESCE(NULLIF($4, ''), info),
				label      = COALESCE(NULLIF($5, ''), label),
				is_orphan  = COALESCE($6, is_orphan)
			WHERE id = $1
		`,
			op.ID,
			strField(d, "target_uri"),
			strField(d, "icon_uri"),
			strField(d, "info"),
			strField(d, "label"),
			boolField(d, "is_orphan"),
		)
		return err

	case "DELETE":
		_, err := h.db.Exec(ctx, `DELETE FROM resource_links WHERE id = $1`, op.ID)
		return err

	default:
		return nil
	}
}

// =========================================================================
// invitations
// =========================================================================

func (h *Handler) applyInvitation(r *http.Request, op models.UploadOperation, claims *auth.Claims) error {
	ctx := r.Context()
	d := op.Data

	switch op.Op {
	case "PATCH":
		// Only the invited user can update their own invitation status (accept/reject).
		// Admins cancel via the gRPC CancelInvitation RPC, not PowerSync upload.
		userID := strField(d, "user_id")
		if userID != claims.UserID {
			h.logger.Warn("user attempted to mutate another user's invitation",
				"claimed_user", claims.UserID, "target_user", userID)
			return nil
		}

		newStatus := strField(d, "status")
		// Only ACCEPTED and REJECTED are allowed from the client side.
		if newStatus != "INVITATION_STATUS_ACCEPTED" && newStatus != "INVITATION_STATUS_REJECTED" {
			h.logger.Warn("invalid invitation status from client", "status", newStatus)
			return nil
		}

		_, err := h.db.Exec(ctx, `
            UPDATE invitations SET
                status       = $2,
                responded_at = NOW()
            WHERE id = $1
              AND user_id = $3
              AND status = 'INVITATION_STATUS_PENDING'  -- guard: only transition from PENDING
        `,
			op.ID,
			newStatus,
			claims.UserID,
		)
		return err

	default:
		// INSERT and DELETE of invitations are server-only (gRPC).
		// Clients cannot create or hard-delete invitation records.
		h.logger.Warn("client attempted disallowed op on invitations", "op", op.Op)
		return nil
	}
}

// =========================================================================
// store_members
// =========================================================================

func (h *Handler) applyStoreMember(r *http.Request, op models.UploadOperation, _ *auth.Claims) error {
	ctx := r.Context()
	d := op.Data

	switch op.Op {
	case "PUT":
		_, err := h.db.Exec(ctx, `
	        INSERT INTO store_members
	            (id, store_id, user_id, status, permissions, onboarding_type, invitation_id)
	        VALUES ($1,$2,$3,$4,$5::jsonb,$6,$7)
	        ON CONFLICT (store_id, user_id) DO UPDATE SET
	            status          = EXCLUDED.status,
	            permissions     = EXCLUDED.permissions,
	            onboarding_type = EXCLUDED.onboarding_type,
	            invitation_id   = EXCLUDED.invitation_id
	    `,
			op.ID,
			strField(d, "store_id"),
			strField(d, "user_id"),
			strFieldOr(d, "status", "STORE_MEMBER_STATUS_ACTIVE"),
			strFieldOr(d, "permissions", `{}`),
			strFieldOr(d, "onboarding_type", "ONBOARDING_TYPE_DIRECT"),
			strField(d, "invitation_id"), // empty string → NULL via NULLIF below
		)
		return err

	case "PATCH":
		// Typically used to update status or permissions.
		_, err := h.db.Exec(ctx, `
        UPDATE store_members SET
            status          = COALESCE(NULLIF($2,''), status),
            permissions     = CASE WHEN $3 <> '' THEN $3::jsonb ELSE permissions END,
            onboarding_type = COALESCE(NULLIF($4,''), onboarding_type)
        WHERE id = $1
	    `,
			op.ID,
			strField(d, "status"),
			strField(d, "permissions"),
			strField(d, "onboarding_type"),
		)
		return err

	case "DELETE":
		_, err := h.db.Exec(ctx, `DELETE FROM store_members WHERE id = $1`, op.ID)
		return err

	default:
		return nil
	}
}

// =========================================================================
// business_members
// =========================================================================

func (h *Handler) applyBusinessMember(r *http.Request, op models.UploadOperation, _ *auth.Claims) error {
	ctx := r.Context()
	d := op.Data

	switch op.Op {
	case "PUT":
		_, err := h.db.Exec(ctx, `
			INSERT INTO business_members
				(id, business_id, user_id, status)
			VALUES ($1,$2,$3,$4)
			ON CONFLICT (business_id, user_id) DO UPDATE SET
				status = EXCLUDED.status
		`,
			op.ID,
			strField(d, "business_id"),
			strField(d, "user_id"),
			strFieldOr(d, "status", "BUSINESS_MEMBER_STATUS_ACTIVE"),
		)
		return err

	case "PATCH":
		_, err := h.db.Exec(ctx, `
			UPDATE business_members SET
				status = COALESCE(NULLIF($2,''), status)
			WHERE id = $1
		`,
			op.ID,
			strField(d, "status"),
		)
		return err

	case "DELETE":
		_, err := h.db.Exec(ctx, `DELETE FROM business_members WHERE id = $1`, op.ID)
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

// boolField extracts a boolean value from the data map.
// Returns nil if the key is absent or not a boolean.
func boolField(d map[string]interface{}, key string) *bool {
	if v, ok := d[key]; ok {
		switch b := v.(type) {
		case bool:
			return &b
		case string:
			if b == "true" {
				result := true
				return &result
			} else if b == "false" {
				result := false
				return &result
			}
		}
	}
	return nil
}

// boolFieldOr extracts a boolean value with a fallback default.
func boolFieldOr(d map[string]interface{}, key string, fallback bool) bool {
	if v := boolField(d, key); v != nil {
		return *v
	}
	return fallback
}

func strFieldOr(d map[string]interface{}, key, fallback string) string {
	if v := strField(d, key); v != "" {
		return v
	}
	return fallback
}

func intField(d map[string]interface{}, key string) *int64 {
	if v, ok := d[key]; ok {
		switch n := v.(type) {
		case float64:
			i := int64(n)
			return &i
		case int64:
			return &n
		case int:
			i := int64(n)
			return &i
		}
	}
	return nil
}

// numericField returns the raw float64 value for NUMERIC/DECIMAL columns
// (prices, amounts, quantities). JSON numbers are always decoded as float64.
// Returns nil if the key is absent to distinguish from zero values.
func numericField(d map[string]interface{}, key string) *float64 {
	if v, ok := d[key]; ok {
		switch n := v.(type) {
		case float64:
			return &n
		case int64:
			f := float64(n)
			return &f
		case int:
			f := float64(n)
			return &f
		}
	}
	return nil
}
