// Defines the local SQLite schema that PowerSync maintains.
// Columns must match exactly what sync_rules.yml SELECTs from PostgreSQL.
// The `id` column (TEXT PK) is implicit — PowerSync manages it automatically.
// ---------------------------------------------------------------------------

import 'package:powersync/powersync.dart';

/// The full PowerSync schema for the Sabitou inventory app.
const schema = Schema([
  // -------------------------------------------------------------------------
  // Users — synced from server, read-only on client.
  // password_hash is intentionally excluded (never synced).
  // -------------------------------------------------------------------------
  Table('users', [
    Column.text('ref_id'),
    Column.text('user_name'),
    Column.text('email'),
    Column.text('phone_number'),
    Column.text('first_name'),
    Column.text('last_name'),
    Column.text('connected_accounts'), // JSON
    Column.text('account_status'), // TEXT enum name
    Column.text('profile_link_id'),
    Column.text('required_actions'), // JSON
  ]),

  // -------------------------------------------------------------------------
  // Businesses
  // -------------------------------------------------------------------------
  Table('businesses', [
    Column.text('ref_id'),
    Column.text('name'),
    Column.text('description'),
    Column.text('status'), // TEXT enum name
    Column.text('owner_id'),
    Column.text('logo_link_id'),
    Column.text('country_code'),
    Column.text('currency_code'),
    Column.text('external_links_ids'), // JSON
    Column.text('contact_info'),
    Column.text('address'), // JSON
    Column.text('email'),
  ]),

  // -------------------------------------------------------------------------
  // Stores
  // -------------------------------------------------------------------------
  Table('stores', [
    Column.text('ref_id'),
    Column.text('name'),
    Column.text('description'),
    Column.text('logo_link_id'),
    Column.text('external_links_ids'), // JSON
    Column.text('business_id'),
    Column.text('created_at'), // ISO
    Column.text('updated_at'), // ISO
    Column.text('phone'),
    Column.text('address'), // JSON
    Column.text('email'),
    Column.text('costing_method'), // TEXT enum name
    Column.real('tax'),
    Column.text('postal_box'),
    Column.text('nui'),
    Column.text('tax_payer_number'),
  ]),

  // -------------------------------------------------------------------------
  // Store members (users belonging to a store)
  // -------------------------------------------------------------------------
  Table('store_members', [
    Column.text('store_id'),
    Column.text('user_id'),
    Column.text('permissions'), // ← JSON string
    Column.text('status'),
    Column.text('member_since'),
  ]),

  // -------------------------------------------------------------------------
  // Global products (catalog shared across all stores)
  // -------------------------------------------------------------------------
  Table('global_products', [
    Column.text('ref_id'),
    Column.text('name'),
    Column.text('description'),
    Column.text('bar_code_value'),
    Column.text('images_links_ids'),
    Column.text('categories'), // JSON array of ids
    Column.text('status'),
  ]),

  // -------------------------------------------------------------------------
  // Categories
  // -------------------------------------------------------------------------
  Table('categories', [
    Column.text('ref_id'),
    Column.text('name'),
    Column.text('business_id'),
    Column.text('parent_category_id'),
    Column.text('status'),
    Column.text('type'),
  ]),

  // -------------------------------------------------------------------------
  // Store products (items listed in a specific store)
  // -------------------------------------------------------------------------
  Table('store_products', [
    Column.text('ref_id'),
    Column.text('store_id'),
    Column.text('global_product_id'),
    Column.integer('sale_price'),
    Column.text('images_links_ids'),
    Column.text('status'),
    Column.text('expiration_type'),
    Column.text('sku'),
    Column.integer('reorder_point'),
    Column.text('expiration_type'),
    Column.text('created_at'),
  ]),

  // -------------------------------------------------------------------------
  // Inventory levels (current stock per store product per store)
  // -------------------------------------------------------------------------
  Table('inventory_levels', [
    Column.text('store_product_id'),
    Column.text('store_id'),
    Column.integer('quantity_available'),
    Column.integer('quantity_committed'),
    Column.integer('quantity_on_hand'),
    Column.integer('min_threshold'),
    Column.text('last_updated'),
    Column.text('last_updated_by_user_id'),
    Column.text('batches'),
  ]),

  // -------------------------------------------------------------------------
  // Missing Tables
  // -------------------------------------------------------------------------
  Table('business_members', [
    Column.text('business_id'),
    Column.text('user_id'),
    Column.text('status'),
    Column.text('member_since'),
  ]),

  Table('batches', [
    Column.text('ref_id'),
    Column.text('product_id'),
    Column.text('warehouse_id'),
    Column.integer('quantity'),
    Column.text('expiration_date'),
    Column.text('received_at'),
    Column.text('supplier_batch_number'),
    Column.text('supplier_id'),
    Column.integer('purchase_price'),
    Column.text('status'),
    Column.text('notes'),
  ]),

  Table('inventory_transactions', [
    Column.text('ref_id'),
    Column.text('store_id'),
    Column.text('product_id'),
    Column.text('transaction_type'),
    Column.integer('quantity_change'),
    Column.integer('quantity_before'),
    Column.integer('quantity_after'),
    Column.text('related_document_type'),
    Column.text('related_document_id'),
    Column.text('performed_by_user_id'),
    Column.text('transaction_time'),
    Column.text('notes'),
    Column.text('batch_id'),
    Column.real('unit_price'),
    Column.real('total_amount'),
    Column.text('currency'),
  ]),

  Table('suppliers', [
    Column.text('ref_id'),
    Column.text('name'),
    Column.text('description'),
    Column.text('logo_link_id'),
    Column.text('external_links_ids'),
    Column.text('contact_phone'),
    Column.text('contact_email'),
    Column.text('contact_address'),
    Column.text('status'),
    Column.text('business_id'),
    Column.text('store_ids'),
  ]),

  Table('payments', [
    Column.text('ref_id'),
    Column.text('payer_id'),
    Column.text('receiver'),
    Column.real('amount'),
    Column.text('currency'),
    Column.text('warehouse_id'),
    Column.text('payment_method'),
    Column.text('status'),
    Column.text('payment_date'),
    Column.text('reference_number'),
    Column.text('created_by_user_id'),
    Column.text('notes'),
  ]),

  Table('gift_vouchers', [
    Column.text('ref_id'),
    Column.text('voucher_code'),
    Column.real('initial_value'),
    Column.real('remaining_value'),
    Column.text('currency'),
    Column.text('issued_to_customer_id'),
    Column.text('issued_by_user_id'),
    Column.text('warehouse_id'),
    Column.text('status'),
    Column.text('issued_at'),
    Column.text('valid_until'),
    Column.text('notes'),
  ]),

  Table('voucher_transactions', [
    Column.text('ref_id'),
    Column.text('voucher_id'),
    Column.text('store_id'),
    Column.text('related_invoice_id'),
    Column.text('related_receipt_id'),
    Column.real('amount_used'),
    Column.real('remaining_after'),
    Column.text('used_at'),
    Column.text('used_by_user_id'),
  ]),

  Table('cash_receipts', [
    Column.text('ref_id'),
    Column.text('cashier_user_id'),
    Column.text('customer_id'),
    Column.text('store_id'),
    Column.text('items'),
    Column.real('subtotal'),
    Column.real('tax_amount'),
    Column.real('total_amount'),
    Column.real('amount_paid'),
    Column.real('change_given'),
    Column.text('currency'),
    Column.text('payment_ids'),
    Column.text('transaction_time'),
    Column.text('notes'),
    Column.text('voucher_issued_code'),
    Column.real('owed_to_customer'),
  ]),

  Table('sales_orders', [
    Column.text('ref_id'),
    Column.text('customer_id'),
    Column.text('seller_id'),
    Column.text('source_warehouse_address'),
    Column.text('status'), // TEXT enum name
    Column.real('total_amount'),
    Column.text('currency'),
    Column.text('created_by_user_id'),
    Column.text('created_at'), // ISO
    Column.text('delivery_date'), // ISO
    Column.text('notes'),
  ]),

  Table('sales_order_line_items', [
    Column.text('sales_order_id'), // FK
    Column.text('store_id'),
    Column.integer('line_index'), // 0,1,2,...
    Column.text('product_id'),
    Column.text('product_name'), // JSON {en,fr}
    Column.real('unit_price'),
    Column.integer('quantity'),
    Column.real('total'),
    Column.text('batch_id'),
  ]),

  Table(
    'purchase_order_items',
    [
      Column.text('purchase_order_id'),
      Column.text('store_id'),
      Column.text('product_id'),
      Column.integer('quantity'),
      Column.text('product_name'),
      Column.real('unit_price'),
      Column.real('total'),
      Column.text('batch_id'),
    ],
    indexes: [
      Index('idx_poi_order', [IndexedColumn('purchase_order_id')]),
    ],
  ),

  Table('purchase_orders', [
    Column.text('ref_id'),
    Column.text('supplier_id'),
    Column.text('buyer_id'),
    Column.text('status'),
    Column.real('total_amount'),
    Column.text('currency'),
    Column.text('created_by_user_id'),
    Column.text('created_at'),
    Column.text('expected_delivery_date'),
    Column.text('notes'),
  ]),

  Table('delivery_notes', [
    Column.text('ref_id'),
    Column.text('related_sales_order_id'),
    Column.text('from_warehouse_id'),
    Column.text('to_company_id'),
    Column.text('to_address'),
    Column.text('status'), // TEXT enum name
    Column.text('carrier'),
    Column.text('tracking_number'),
    Column.text('created_by_user_id'),
    Column.text('created_at'),
    Column.text('shipped_at'),
    Column.text('delivered_at'),
    Column.text('notes'),
  ]),

  Table(
    'delivery_note_line_items',
    [
      Column.text('delivery_note_id'),
      Column.text('store_id'),
      Column.integer('line_index'),
      Column.text('product_id'),
      Column.real('quantity'),
      Column.text('batch_id'),
      Column.text('serial_numbers'),
    ],
    indexes: [
      Index('idx_dln_order', [IndexedColumn('delivery_note_id')]),
    ],
  ),

  Table('resource_links', [
    Column.text('ref_id'),
    Column.text('target_uri'),
    Column.text('icon_uri'),
    Column.text('info'),
    Column.text('label'),
  ]),

  Table('receiving_notes', [
    Column.text('ref_id'),
    Column.text('related_purchase_order_id'),
    Column.text('supplier_id'),
    Column.text('buyer_id'), // usually warehouse / store id
    Column.text('received_by_user_id'),
    Column.text('received_at'), // ISO 8601
    Column.text('notes'),
    Column.text('status'), // e.g. "RN_STATUS_COMPLETED"
  ]),

  Table(
    'receiving_note_line_items',
    [
      Column.integer('id'),
      Column.text('receiving_note_id'), // FK
      Column.text('store_id'),
      Column.integer('line_index'),
      Column.text('product_id'),
      Column.real('quantity_expected'),
      Column.real('quantity_received'),
      Column.real('quantity_rejected'),
      Column.text('rejection_reason'),
      Column.text('batch_id'), // newly created or referenced
      Column.text('expiration_date'), // ISO 8601
      Column.integer('purchase_price'),
    ],
    indexes: [
      Index('idx_rni_order', [IndexedColumn('receiving_note_id')]),
    ],
  ),

  Table('return_notes', [
    Column.text('ref_id'),
    Column.text('return_type'), // TEXT: "RETURN_TYPE_CUSTOMER_TO_SELLER" etc.
    Column.text('from_id'),
    Column.text('to_id'),
    Column.text('related_delivery_note_id'),
    Column.text('related_invoice_id'),
    Column.text('status'), // TEXT: "RETURN_STATUS_RECEIVED" etc.
    Column.text('reason'),
    Column.text('received_at'), // ISO
    Column.text('received_by_user_id'),
    Column.text('notes'),
  ]),

  Table(
    'return_note_line_items',
    [
      Column.integer('id'),
      Column.text('return_note_id'), // FK
      Column.integer('line_index'),
      Column.text('product_id'),
      Column.text('product_name'), // JSON {en, fr}
      Column.real('quantity'),
      Column.text('condition'), // TEXT: "RETURN_CONDITION_DAMAGED" etc.
      Column.text('condition_notes'),
      Column.text('batch_id'),
    ],
    indexes: [
      Index('idx_rni_order', [IndexedColumn('receiving_note_id')]),
    ],
  ),

  Table('invoices', [
    Column.text('ref_id'),
    Column.text('invoice_type'), // TEXT: "INVOICE_TYPE_SALES" etc.
    Column.text('issuer_id'),
    Column.text('recipient_id'),
    Column.text('related_sales_order_id'),
    Column.text('related_purchase_order_id'),
    Column.text('related_delivery_note_id'),
    Column.text('status'), // TEXT: "INVOICE_STATUS_PAID" etc.
    Column.real('subtotal'),
    Column.real('tax_amount'),
    Column.real('total_amount'),
    Column.text('currency'),
    Column.text('issue_date'), // ISO
    Column.text('due_date'), // ISO
    Column.text('created_by_user_id'),
    Column.text('created_at'), // ISO
    Column.text('payment_ids'), // JSON array or comma separated
    Column.text('notes'),
    Column.text('payment_terms'),
  ]),

  Table(
    'invoice_line_items',
    [
      Column.text('invoice_id'), // FK
      Column.text('store_id'),
      Column.integer('line_index'),
      Column.text('product_id'),
      Column.integer('quantity'),
      Column.real('unit_price'),
      Column.real('subtotal'),
      Column.real('tax_rate'),
      Column.real('tax_amount'),
      Column.real('total'),
      Column.text('batch_id'),
      Column.text('product_name'), // JSON {en, fr} — denormalized copy
    ],
    indexes: [
      Index('idx_ili_order', [IndexedColumn('invoice_id')]),
    ],
  ),

  // -------------------------------------------------------------------------
  // local_auth — LOCAL ONLY, never synced to the server.
  // Stores a bcrypt hash of the user's password for offline authentication.
  // One row per user who has logged in on this device.
  // -------------------------------------------------------------------------
  Table.localOnly('local_auth', [
    Column.text('user_id'), // matches users.ref_id
    Column.text('email'),
    Column.text('password_hash'),
    Column.integer('stored_at'), // unix timestamp (seconds)
  ]),
]);
