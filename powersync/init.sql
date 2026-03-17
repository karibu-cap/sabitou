-- docker/powersync/init.sql
-- ---------------------------------------------------------------------------
-- Database schema for the Sabitou inventory management platform.
-- Runs once on first container start.
-- ---------------------------------------------------------------------------

-- Enable pgcrypto for gen_random_uuid()
CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

SET timezone = 'Africa/Douala';

-- ==========================================================================
-- Core tables
-- ==========================================================================

-- Users (employee accounts). password_hash is server-only, never synced.
CREATE TABLE IF NOT EXISTS users (
    id TEXT PRIMARY KEY DEFAULT gen_random_uuid ()::text,
    -- ref_id is the canonical application-level PK.
    -- Auto-generated as a UUID when the caller does not supply one.
    -- Callers may override with a human-readable value (e.g. "USR-001").
    ref_id TEXT UNIQUE NOT NULL DEFAULT gen_random_uuid ()::text,
    user_name TEXT NOT NULL,
    email TEXT,
    password_hash TEXT NOT NULL,
    first_name TEXT,
    last_name TEXT,
    phone_number TEXT,
    account_status TEXT NOT NULL DEFAULT 'ACCOUNT_STATUS_TYPE_ACTIVE',
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Businesses
CREATE TABLE IF NOT EXISTS businesses (
    id TEXT PRIMARY KEY DEFAULT gen_random_uuid ()::text,
    -- ref_id is the canonical application-level PK (e.g. "BIZ-001").
    ref_id TEXT UNIQUE NOT NULL DEFAULT gen_random_uuid ()::text,
    name TEXT NOT NULL,
    description TEXT,
    status TEXT NOT NULL DEFAULT 'BUSINESS_STATUS_TYPE_ACTIVE',
    owner_id TEXT NOT NULL, -- users.ref_id
    country_code TEXT NOT NULL DEFAULT 'CM',
    logo_link_id TEXT,
    currency_code TEXT NOT NULL DEFAULT 'XAF',
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Stores (a business may have multiple stores)
CREATE TABLE IF NOT EXISTS stores (
    id TEXT PRIMARY KEY DEFAULT gen_random_uuid ()::text,
    -- ref_id is the canonical application-level PK (e.g. "STO-001").
    ref_id TEXT UNIQUE NOT NULL DEFAULT gen_random_uuid ()::text,
    name TEXT NOT NULL,
    business_id TEXT NOT NULL, -- businesses.ref_id
    address JSONB,
    phone TEXT,
    logo_link_id TEXT,
    email TEXT,
    costing_method TEXT DEFAULT 'STORE_COSTING_METHOD_FIFO',
    tax NUMERIC(5, 4) DEFAULT 0.1925, -- 19.25% example
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Global products (catalog shared across stores)
CREATE TABLE IF NOT EXISTS global_products (
    id TEXT PRIMARY KEY DEFAULT gen_random_uuid ()::text,
    -- ref_id is the canonical application-level PK (e.g. "PRD-001").
    ref_id TEXT UNIQUE NOT NULL DEFAULT gen_random_uuid ()::text,
    name JSONB NOT NULL, -- {"en":"...", "fr":"..."}
    description JSONB,
    bar_code_value TEXT,
    status TEXT NOT NULL DEFAULT 'GLOBAL_PRODUCT_STATUS_ACTIVE',
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Categories
CREATE TABLE IF NOT EXISTS categories (
    id TEXT PRIMARY KEY DEFAULT gen_random_uuid ()::text,
    -- ref_id is the canonical application-level PK (e.g. "CAT-001").
    ref_id TEXT UNIQUE NOT NULL DEFAULT gen_random_uuid ()::text,
    name JSONB NOT NULL, -- {"en":"...", "fr":"..."}
    parent_category_id TEXT,
    status TEXT NOT NULL DEFAULT 'CATEGORY_STATUS_ACTIVE',
    type TEXT NOT NULL DEFAULT 'CATEGORY_TYPE_PRODUCT',
    business_id TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Store products (a global product listed in a specific store)
CREATE TABLE IF NOT EXISTS store_products (
    id TEXT PRIMARY KEY DEFAULT gen_random_uuid ()::text,
    -- ref_id is the canonical application-level PK (e.g. "SP-001").
    ref_id TEXT UNIQUE NOT NULL DEFAULT gen_random_uuid ()::text,
    store_id TEXT NOT NULL,
    global_product_id TEXT NOT NULL,
    sale_price INTEGER NOT NULL, -- in smallest unit (centimes)
    status TEXT NOT NULL DEFAULT 'PRODUCT_STATUS_ACTIVE',
    sku TEXT,
    images_links_ids TEXT [] NOT NULL DEFAULT '{}',
    reorder_point INTEGER NOT NULL DEFAULT 10,
    expiration_type TEXT DEFAULT 'EXPIRATION_TYPE_NONE',
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Inventory levels (current stock per store product per store)
CREATE TABLE IF NOT EXISTS inventory_levels (
    id TEXT PRIMARY KEY DEFAULT gen_random_uuid ()::text,
    store_product_id TEXT NOT NULL,
    store_id TEXT NOT NULL,
    quantity_available INTEGER NOT NULL DEFAULT 0,
    quantity_committed INTEGER NOT NULL DEFAULT 0,
    quantity_on_hand INTEGER NOT NULL DEFAULT 0,
    min_threshold INTEGER NOT NULL DEFAULT 10,
    last_updated TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    last_updated_by_user_id TEXT,
    UNIQUE (store_product_id, store_id)
);

-- Store members — which users belong to which store.
-- store_id and user_id are both ref_id values (the canonical app-level PKs).
CREATE TABLE IF NOT EXISTS store_members (
    id TEXT PRIMARY KEY DEFAULT gen_random_uuid ()::text,
    store_id TEXT NOT NULL REFERENCES stores (ref_id) ON DELETE CASCADE,
    user_id TEXT NOT NULL REFERENCES users (ref_id) ON DELETE CASCADE,
    status TEXT NOT NULL DEFAULT 'STORE_MEMBER_STATUS_ACTIVE',
    member_since TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    permissions JSONB NOT NULL DEFAULT '{}'::jsonb,
    UNIQUE (store_id, user_id)
);

-- Business members
CREATE TABLE IF NOT EXISTS business_members (
    id TEXT PRIMARY KEY DEFAULT gen_random_uuid ()::text,
    business_id TEXT NOT NULL REFERENCES businesses (ref_id) ON DELETE CASCADE,
    user_id TEXT NOT NULL REFERENCES users (ref_id) ON DELETE CASCADE,
    status TEXT NOT NULL DEFAULT 'BUSINESS_MEMBER_STATUS_ACTIVE',
    member_since TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE (business_id, user_id)
);

-- Batches
CREATE TABLE IF NOT EXISTS batches (
    id TEXT PRIMARY KEY DEFAULT gen_random_uuid ()::text,
    ref_id TEXT UNIQUE NOT NULL DEFAULT gen_random_uuid ()::text,
    product_id TEXT NOT NULL, -- store_products.ref_id
    warehouse_id TEXT NOT NULL, -- stores.ref_id
    quantity INTEGER NOT NULL,
    expiration_date TIMESTAMPTZ,
    received_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    supplier_id TEXT,
    images_links_ids TEXT [] NOT NULL DEFAULT '{}',
    purchase_price INTEGER,
    status TEXT NOT NULL DEFAULT 'BATCH_STATUS_ACTIVE',
    notes TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Inventory Transactions
CREATE TABLE IF NOT EXISTS inventory_transactions (
    id TEXT PRIMARY KEY DEFAULT gen_random_uuid ()::text,
    ref_id TEXT UNIQUE NOT NULL DEFAULT gen_random_uuid ()::text,
    store_id TEXT NOT NULL,
    product_id TEXT NOT NULL,
    transaction_type TEXT NOT NULL,
    quantity_change INTEGER NOT NULL,
    quantity_before INTEGER,
    quantity_after INTEGER,
    related_document_type TEXT,
    related_document_id TEXT,
    performed_by_user_id TEXT NOT NULL,
    transaction_time TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    batch_id TEXT,
    notes TEXT,
    unit_price NUMERIC,
    total_amount NUMERIC,
    currency TEXT DEFAULT 'XAF'
);

CREATE TABLE IF NOT EXISTS sales_orders (
    id TEXT PRIMARY KEY DEFAULT gen_random_uuid ()::text,
    ref_id TEXT UNIQUE NOT NULL DEFAULT gen_random_uuid ()::text,
    customer_id TEXT,
    seller_id TEXT NOT NULL, -- store ref_id
    status TEXT NOT NULL DEFAULT 'SO_STATUS_DRAFT',
    total_amount NUMERIC NOT NULL,
    currency TEXT DEFAULT 'XAF',
    created_by_user_id TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    delivery_date DATE,
    notes TEXT
);

-- Suppliers
CREATE TABLE IF NOT EXISTS suppliers (
    id TEXT PRIMARY KEY DEFAULT gen_random_uuid ()::text,
    ref_id TEXT UNIQUE NOT NULL DEFAULT gen_random_uuid ()::text,
    name TEXT NOT NULL,
    description TEXT,
    logo_link_id TEXT,
    external_links_ids TEXT,
    contact_phone TEXT,
    contact_email TEXT,
    contact_address TEXT,
    status TEXT NOT NULL DEFAULT 'SUPPLIER_STATUS_ACTIVE',
    business_id TEXT NOT NULL,
    store_ids TEXT [] NOT NULL DEFAULT '{}'
);

-- Payments
CREATE TABLE IF NOT EXISTS payments (
    id TEXT PRIMARY KEY DEFAULT gen_random_uuid ()::text,
    ref_id TEXT UNIQUE NOT NULL DEFAULT gen_random_uuid ()::text,
    payer_id TEXT,
    receiver TEXT,
    amount NUMERIC NOT NULL,
    currency TEXT,
    warehouse_id TEXT,
    payment_method TEXT,
    status TEXT NOT NULL DEFAULT 'PAYMENT_STATUS_COMPLETED',
    payment_date TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    reference_number TEXT,
    created_by_user_id TEXT,
    notes TEXT
);

-- Gift Vouchers
CREATE TABLE IF NOT EXISTS gift_vouchers (
    id TEXT PRIMARY KEY DEFAULT gen_random_uuid ()::text,
    ref_id TEXT UNIQUE NOT NULL DEFAULT gen_random_uuid ()::text,
    voucher_code TEXT UNIQUE NOT NULL,
    initial_value NUMERIC NOT NULL,
    remaining_value NUMERIC NOT NULL,
    currency TEXT,
    issued_to_customer_id TEXT,
    issued_by_user_id TEXT,
    warehouse_id TEXT,
    status TEXT NOT NULL DEFAULT 'VOUCHER_STATUS_ACTIVE',
    issued_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    valid_until TIMESTAMPTZ,
    notes TEXT
);

-- Voucher Transactions
CREATE TABLE IF NOT EXISTS voucher_transactions (
    id TEXT PRIMARY KEY DEFAULT gen_random_uuid ()::text,
    ref_id TEXT UNIQUE NOT NULL DEFAULT gen_random_uuid ()::text,
    voucher_id TEXT NOT NULL,
    store_id TEXT NOT NULL,
    related_invoice_id TEXT,
    related_receipt_id TEXT,
    amount_used NUMERIC NOT NULL,
    remaining_after NUMERIC NOT NULL,
    used_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    used_by_user_id TEXT
);

-- Cash Receipts
CREATE TABLE IF NOT EXISTS cash_receipts (
    id TEXT PRIMARY KEY DEFAULT gen_random_uuid ()::text,
    ref_id TEXT UNIQUE NOT NULL DEFAULT gen_random_uuid ()::text,
    cashier_user_id TEXT,
    customer_id TEXT,
    store_id TEXT,
    items TEXT,
    subtotal NUMERIC,
    tax_amount NUMERIC,
    total_amount NUMERIC,
    amount_paid NUMERIC,
    change_given NUMERIC,
    currency TEXT,
    payment_ids TEXT,
    transaction_time TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    notes TEXT,
    voucher_issued_code TEXT,
    owed_to_customer NUMERIC
);

-- Purchase Orders
CREATE TABLE IF NOT EXISTS purchase_orders (
    id TEXT PRIMARY KEY DEFAULT gen_random_uuid ()::text,
    ref_id TEXT UNIQUE NOT NULL DEFAULT gen_random_uuid ()::text,
    supplier_id TEXT NOT NULL,
    buyer_id TEXT NOT NULL, -- store ref_id
    status TEXT NOT NULL DEFAULT 'PO_STATUS_DRAFT',
    total_amount NUMERIC NOT NULL,
    currency TEXT DEFAULT 'XAF',
    created_by_user_id TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    expected_delivery_date DATE,
    notes TEXT
);

CREATE TABLE IF NOT EXISTS sales_order_line_items (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
    sales_order_id TEXT NOT NULL,
    store_id TEXT NOT NULL,
    line_index INTEGER NOT NULL,
    product_id TEXT NOT NULL,
    quantity INTEGER NOT NULL,
    unit_price NUMERIC(12, 2) NOT NULL,
    total NUMERIC(14, 2) NOT NULL,
    batch_id TEXT,
    UNIQUE (sales_order_id, line_index)
);

CREATE TABLE IF NOT EXISTS purchase_order_line_items (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
    purchase_order_id TEXT NOT NULL,
    store_id TEXT NOT NULL,
    line_index INTEGER NOT NULL,
    product_id TEXT NOT NULL,
    quantity INTEGER NOT NULL,
    unit_price NUMERIC(12, 2) NOT NULL,
    total NUMERIC(14, 2) NOT NULL,
    batch_id TEXT,
    UNIQUE (purchase_order_id, line_index)
);

CREATE TABLE IF NOT EXISTS invoice_line_items (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
    invoice_id TEXT NOT NULL,
    store_id TEXT NOT NULL,
    line_index INTEGER NOT NULL,
    product_id TEXT NOT NULL,
    quantity INTEGER NOT NULL,
    unit_price NUMERIC(12, 2) NOT NULL,
    subtotal NUMERIC(14, 2) NOT NULL,
    tax_rate NUMERIC(5, 4),
    tax_amount NUMERIC(12, 2),
    total NUMERIC(14, 2) NOT NULL,
    batch_id TEXT,
    UNIQUE (invoice_id, line_index)
);

CREATE TABLE IF NOT EXISTS delivery_note_line_items (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
    delivery_note_id TEXT NOT NULL,
    store_id TEXT NOT NULL,
    line_index INTEGER NOT NULL,
    product_id TEXT NOT NULL,
    quantity NUMERIC(10, 3) NOT NULL,
    batch_id TEXT,
    UNIQUE (delivery_note_id, line_index)
);

CREATE TABLE IF NOT EXISTS receiving_note_line_items (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
    receiving_note_id TEXT NOT NULL,
    store_id TEXT NOT NULL,
    line_index INTEGER NOT NULL,
    product_id TEXT NOT NULL,
    quantity_expected NUMERIC(10, 3) NOT NULL,
    quantity_received NUMERIC(10, 3) NOT NULL,
    quantity_rejected NUMERIC(10, 3) DEFAULT 0,
    batch_id TEXT,
    UNIQUE (receiving_note_id, line_index)
);

CREATE TABLE IF NOT EXISTS invoices (
    id TEXT PRIMARY KEY DEFAULT gen_random_uuid ()::text,
    ref_id TEXT UNIQUE NOT NULL DEFAULT gen_random_uuid ()::text,
    invoice_type TEXT NOT NULL,
    issuer_id TEXT NOT NULL,
    recipient_id TEXT NOT NULL,
    status TEXT NOT NULL DEFAULT 'INVOICE_STATUS_DRAFT',
    subtotal NUMERIC NOT NULL,
    tax_amount NUMERIC NOT NULL,
    total_amount NUMERIC NOT NULL,
    currency TEXT DEFAULT 'XAF',
    issue_date DATE NOT NULL DEFAULT CURRENT_DATE,
    due_date DATE,
    created_by_user_id TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    notes TEXT
);

-- Resource Links
CREATE TABLE IF NOT EXISTS resource_links (
    id TEXT PRIMARY KEY DEFAULT gen_random_uuid ()::text,
    ref_id TEXT UNIQUE NOT NULL DEFAULT gen_random_uuid ()::text,
    target_uri TEXT NOT NULL,
    icon_uri TEXT,
    info TEXT,
    label TEXT
);

-- Refresh tokens (server-side, never synced)
CREATE TABLE IF NOT EXISTS refresh_tokens (
    id TEXT PRIMARY KEY DEFAULT gen_random_uuid ()::text,
    user_id TEXT NOT NULL REFERENCES users (ref_id) ON DELETE CASCADE,
    token_hash TEXT NOT NULL UNIQUE,
    expires_at TIMESTAMPTZ NOT NULL,
    revoked BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ==========================================================================
-- Indexes
-- ==========================================================================

CREATE INDEX IF NOT EXISTS idx_store_products_store_id ON store_products (store_id);

CREATE INDEX IF NOT EXISTS idx_inventory_levels_store_id ON inventory_levels (store_id);

CREATE INDEX IF NOT EXISTS idx_stores_business_id ON stores (business_id);

CREATE INDEX IF NOT EXISTS idx_users_email ON users (email);

-- Allows PowerSync sync_rules to resolve a user's stores quickly.
CREATE INDEX IF NOT EXISTS idx_store_members_user_id ON store_members (user_id);

CREATE INDEX IF NOT EXISTS idx_refresh_tokens_user_id ON refresh_tokens (user_id);

-- DROP TABLE IF EXISTS users,
-- businesses,
-- stores,
-- store_members,
-- global_products,
-- categories,
-- store_products,
-- inventory_levels,
-- business_members,
-- batches,
-- inventory_transactions,
-- suppliers,
-- payments,
-- gift_vouchers,
-- voucher_transactions,
-- cash_receipts,
-- purchase_orders,
-- sales_orders,
-- invoices,
-- delivery_notes,
-- receiving_notes,
-- sales_order_line_items,
-- purchase_order_line_items,
-- invoice_line_items,
-- delivery_note_line_items,
-- receiving_note_line_items,
-- resource_links CASCADE;
-- ==========================================================================
-- Logical replication publication (required by PowerSync)
-- ==========================================================================

-- Create publication for all synced tables (excludes refresh_tokens for security)
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_publication WHERE pubname = 'powersync'
  ) THEN
    CREATE PUBLICATION powersync FOR TABLE
users,
      businesses,
      stores,
      store_members,
      global_products,
      categories,
      store_products,
      inventory_levels,
      business_members,
      batches,
      inventory_transactions,
      suppliers,
      payments,
      gift_vouchers,
      voucher_transactions,
      cash_receipts,
      purchase_orders,
      sales_orders,
      invoices,
      sales_order_line_items,
      purchase_order_line_items,
      invoice_line_items,
      delivery_note_line_items,
      receiving_note_line_items,
      resource_links;

END IF;

END $$;

-- ==========================================================================
-- Seed data for development
-- ==========================================================================
-- Default business
INSERT INTO
    businesses (
        ref_id,
        name,
        owner_id,
        logo_link_id
    )
VALUES (
        'BIZ-001',
        'Sabitu Distribution SARL',
        'USR-001',
        'MDI-008'
    );

INSERT INTO
    stores (
        ref_id,
        name,
        business_id,
        address,
        phone,
        logo_link_id
    )
VALUES (
        'STR-001',
        'Sabitu Yaoundé Central',
        'BIZ-001',
        '{"city":"Yaoundé","quarter":"Mvan","street":"Carrefour EMANA"}'::jsonb,
        '+237 699 00 11 22',
        'MDI-001'
    ),
    (
        'STR-002',
        'Sabitu Douala Akwa',
        'BIZ-001',
        '{"city":"Douala","quarter":"Akwa","street":"Rue Joss"}'::jsonb,
        '+237 677 88 99 00',
        'MDI-001'
    );

INSERT INTO
    users (
        ref_id,
        user_name,
        email,
        password_hash,
        first_name,
        last_name,
        account_status
    )
VALUES (
        'USR-001',
        'admin_user',
        'admin@example.com',
        -- bcrypt hash for "Admin@1234"
        '$2a$12$ovAfhfr3fvev0OB61Vysvu.0Yw4XvMTNAPcyD.bAUZeCjFpNOFBrO',
        'Admin',
        'User',
        'ACCOUNT_STATUS_TYPE_ACTIVE'
    );

INSERT INTO
    users (
        ref_id,
        user_name,
        email,
        password_hash,
        first_name,
        last_name,
        account_status
    )
VALUES (
        'USR-002',
        'cashier01',
        'cashier@sabitou.cm',
        -- bcrypt hash for "Cashier@123"
        '$2a$12$AvPmQEfJq7s.IzT9VfaVZuN8YcqFuF0YzxMPaKHKSulMqFqP3sAH2',
        'Jean',
        'Kamga',
        'ACCOUNT_STATUS_TYPE_ACTIVE'
    );
-- Store memberships for seed users.
-- Both the admin and cashier are members of store_1.
-- The admin is also covered by the owner_id fallback in getUserStoreAndBusiness.

INSERT INTO
    store_members (
        store_id,
        user_id,
        status,
        permissions
    )
VALUES (
        'STR-001',
        'USR-001',
        'STORE_MEMBER_STATUS_ACTIVE',
        '{
       "product":   {"read_product_in_inventory": true, "create_product_in_inventory": true, "update_product_in_inventory": true, "delete_product_in_inventory": false},
       "member":    {"read_information": true, "invite_member": true, "update_member": true, "delete_member": true},
       "report":    {"read_report": true},
       "order":     {"read_order": true, "create_order": true},
       "invoice":   {"read_invoice": true, "create_invoice": true},
       "supplier":  {"read_supplier": true, "create_supplier": true, "update_supplier": true, "delete_supplier": false},
       "transaction":{"read_transaction": true, "create_transaction": true, "update_transaction": false}
     }'::jsonb
    ),
    (
        'STR-001',
        'USR-002',
        'STORE_MEMBER_STATUS_ACTIVE',
        '{
       "product":   {"read_product_in_inventory": true, "create_product_in_inventory": false},
       "member":    {"read_information": true, "invite_member": false}
     }'::jsonb
    )
ON CONFLICT (store_id, user_id) DO NOTHING;

-- Sample global products
INSERT INTO
    global_products (ref_id, name, bar_code_value)
VALUES (
        'GPROD-001',
        '{"en":"Riz Uncle Ben''s 25kg","fr":"Riz Uncle Ben''s 25 kg"}'::jsonb,
        '6193001001234'
    ),
    (
        'GPROD-002',
        '{"en":"Huile de palme 5L","fr":"Huile de palme 5 litres"}'::jsonb,
        '6198765432109'
    ),
    (
        'GPROD-003',
        '{"en":"Sucre en poudre 1kg","fr":"Sucre semoule 1 kg"}'::jsonb,
        '6191122334455'
    ),
    (
        'GPROD-004',
        '{"en":"Tomate concentrée 800g","fr":"Concentré de tomate 800 g"}'::jsonb,
        '6199988776655'
    );
-- Sample store products

INSERT INTO
    store_products (
        ref_id,
        store_id,
        global_product_id,
        sale_price,
        sku,
        reorder_point,
        images_links_ids
    )
VALUES (
        'SP-YDE-001',
        'STR-001',
        'GPROD-001',
        28500,
        'RIZ-25KG-YDE',
        10,
        ARRAY['MDI-001']
    ),
    (
        'SP-YDE-002',
        'STR-001',
        'GPROD-002',
        12500,
        'HUILE-5L-YDE',
        20,
        ARRAY['MDI-002']
    ),
    (
        'SP-DLA-001',
        'STR-002',
        'GPROD-003',
        1350,
        'SUCRE-1KG-DLA',
        5,
        ARRAY['MDI-005']
    ),
    (
        'SP-DLA-002',
        'STR-002',
        'GPROD-004',
        950,
        'TOMATE-800G-DLA',
        5,
        ARRAY['MDI-003']
    );
-- Sample inventory

INSERT INTO
    inventory_levels (
        store_product_id,
        store_id,
        quantity_available,
        quantity_committed,
        min_threshold
    )
VALUES (
        'SP-YDE-001',
        'STR-001',
        185,
        30,
        50
    ),
    (
        'SP-YDE-002',
        'STR-001',
        132,
        48,
        40
    ),
    (
        'SP-DLA-001',
        'STR-002',
        520,
        0,
        80
    ),
    (
        'SP-DLA-002',
        'STR-002',
        355,
        60,
        50
    )
ON CONFLICT (store_product_id, store_id) DO NOTHING;

-- Additional fake_data.dart tables
INSERT INTO
    resource_links (
        ref_id,
        target_uri,
        icon_uri,
        info,
        label
    )
VALUES (
        'MDI-001',
        'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=400&h=300&fit=crop',
        'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=400&h=300&fit=crop',
        'Smartphone product image',
        'Product Image'
    ),
    (
        'MDI-002',
        'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=400&h=300&fit=crop',
        'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=400&h=300&fit=crop',
        'Laptop product image',
        'Product Image'
    ),
    (
        'MDI-003',
        'https://images.unsplash.com/photo-1560472354-b33ff0c44a43?w=400&h=300&fit=crop',
        'https://images.unsplash.com/photo-1560472354-b33ff0c44a43?w=400&h=300&fit=crop',
        'Tablet product image',
        'Product Image'
    ),
    (
        'MDI-004',
        'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400&h=300&fit=crop',
        'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400&h=300&fit=crop',
        'TV product image',
        'Product Image'
    ),
    (
        'MDI-005',
        'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400&h=300&fit=crop',
        'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400&h=300&fit=crop',
        'Store logo',
        'Store Logo'
    ),
    (
        'MDI-006',
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=300&fit=crop',
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=300&fit=crop',
        'Business logo',
        'Business Logo'
    ),
    (
        'MDI-013',
        'https://images.unsplash.com/photo-1583394838336-acd977736f90?w=400&h=300&fit=crop',
        'https://images.unsplash.com/photo-1583394838336-acd977736f90?w=400&h=300&fit=crop',
        'Supplier logo',
        'Supplier Logo'
    );

INSERT INTO
    categories (ref_id, name, business_id)
VALUES (
        'CTG-001',
        '{"en":"Electronics", "fr":"Electronics"}'::jsonb,
        'BIZ-001'
    ),
    (
        'CTG-002',
        '{"en":"Clothes", "fr":"Habit"}'::jsonb,
        'BIZ-001'
    ),
    (
        'CTG-003',
        '{"en":"Car", "fr":"Voiture"}'::jsonb,
        'BIZ-001'
    );

INSERT INTO
    business_members (business_id, user_id, status)
VALUES (
        'BIZ-001',
        'USR-001',
        'BUSINESS_MEMBER_STATUS_ACTIVE'
    )
ON CONFLICT (business_id, user_id) DO NOTHING;

INSERT INTO
    suppliers (
        ref_id,
        name,
        contact_phone,
        business_id,
        store_ids,
        logo_link_id
    )
VALUES (
        'SUP-001',
        'Cerealis Cameroun',
        '+237 222 30 40 50',
        'BIZ-001',
        ARRAY['STR-001', 'STR-002'],
        'MDI-001'
    ),
    (
        'SUP-002',
        'Huilerie du Wouri',
        '+237 233 41 25 78',
        'BIZ-001',
        ARRAY['STR-002'],
        'MDI-001'
    ),
    (
        'SUP-003',
        'Sucreries du Cameroun',
        '+237 699 55 66 77',
        'BIZ-001',
        ARRAY['STR-001'],
        NULL
    );

INSERT INTO
    batches (
        ref_id,
        product_id,
        warehouse_id,
        quantity,
        purchase_price,
        expiration_date,
        supplier_id,
        status
    )
VALUES (
        'BATCH-2503-01',
        'SP-YDE-001',
        'STR-001',
        240,
        23800,
        '2027-01-15',
        'SUP-001',
        'BATCH_STATUS_ACTIVE'
    ),
    (
        'BATCH-2503-02',
        'SP-YDE-002',
        'STR-001',
        180,
        10500,
        '2026-11-30',
        'SUP-001',
        'BATCH_STATUS_ACTIVE'
    ),
    (
        'BATCH-2502-03',
        'SP-DLA-001',
        'STR-002',
        650,
        980,
        NULL,
        'SUP-001',
        'BATCH_STATUS_ACTIVE'
    ),
    (
        'BATCH-2501-04',
        'SP-DLA-002',
        'STR-002',
        420,
        720,
        '2026-08-20',
        'SUP-002',
        'BATCH_STATUS_ACTIVE'
    );

INSERT INTO
    inventory_transactions (
        ref_id,
        store_id,
        product_id,
        transaction_type,
        quantity_change,
        quantity_before,
        quantity_after,
        related_document_type,
        related_document_id,
        performed_by_user_id,
        notes
    )
VALUES (
        'INTRS-2025-001',
        'STR-001',
        'PRD-001',
        'INTRS_TYPE_PURCHASE',
        10,
        0,
        10,
        'PurchaseOrder',
        'PO-2025-001',
        'USR-001',
        'Initial stock from purchase order'
    ),
    (
        'INTRS-2025-002',
        'STR-001',
        'PRD-002',
        'INTRS_TYPE_PURCHASE',
        5,
        0,
        5,
        'PurchaseOrder',
        'PO-2025-002',
        'USR-001',
        'Received laptop stock'
    ),
    (
        'INTRS-2025-003',
        'STR-001',
        'PRD-001',
        'INTRS_TYPE_SALE',
        -2,
        10,
        8,
        'CashReceipt',
        'CASH-2025-001',
        'USR-001',
        'Sale of 2 smartphones'
    ),
    (
        'INTRS-2025-004',
        'STR-001',
        'PRD-003',
        'INTRS_TYPE_ADJUSTMENT',
        -1,
        1,
        0,
        NULL,
        NULL,
        'USR-001',
        'Tablet damaged during handling'
    );

INSERT INTO
    payments (
        ref_id,
        payer_id,
        receiver,
        amount,
        currency,
        warehouse_id,
        payment_method,
        status,
        reference_number,
        created_by_user_id,
        notes
    )
VALUES (
        'PAY-2025-001',
        'USR-001',
        'BIZ-001',
        10000,
        'XAF',
        NULL,
        'PAYMENT_METHOD_CASH',
        'PAYMENT_STATUS_COMPLETED',
        'REF-001',
        'USR-001',
        'Test payment'
    );

INSERT INTO
    gift_vouchers (
        ref_id,
        voucher_code,
        initial_value,
        remaining_value,
        currency,
        issued_to_customer_id,
        issued_by_user_id,
        status,
        notes
    )
VALUES (
        'GV-2025-001',
        'GIFT-001',
        5000,
        5000,
        'USD',
        'USR-001',
        'USR-001',
        'VOUCHER_STATUS_ACTIVE',
        'Test voucher'
    );

INSERT INTO
    voucher_transactions (
        ref_id,
        voucher_id,
        store_id,
        related_invoice_id,
        amount_used,
        remaining_after,
        used_by_user_id
    )
VALUES (
        'VT-001',
        'GV-2025-001',
        'STR-001',
        'INV-001',
        5000,
        5000,
        'USR-001'
    );

INSERT INTO
    sales_orders (
        ref_id,
        customer_id,
        seller_id,
        status,
        total_amount,
        created_by_user_id
    )
VALUES (
        'SO-202503-001',
        'CLI-987654',
        'STR-001',
        'SO_STATUS_DELIVERED',
        78500,
        'USR-002'
    )
ON CONFLICT DO NOTHING;

INSERT INTO
    sales_order_line_items (
        sales_order_id,
        store_id,
        line_index,
        product_id,
        quantity,
        unit_price,
        total
    )
VALUES (
        'SO-202503-001',
        'STR-001',
        1,
        'SP-YDE-001',
        2,
        28500,
        57000
    ),
    (
        'SO-202503-001',
        'STR-001',
        2,
        'SP-YDE-002',
        1,
        12500,
        12500
    ),
    (
        'SO-202503-001',
        'STR-001',
        3,
        'SP-YDE-002',
        1,
        9000,
        9000
    )
ON CONFLICT DO NOTHING;

-- Purchase Orders + lines
INSERT INTO
    purchase_orders (
        ref_id,
        supplier_id,
        buyer_id,
        status,
        total_amount,
        created_by_user_id
    )
VALUES (
        'PO-202503-015',
        'SUP-001',
        'STR-001',
        'PO_STATUS_RECEIVED',
        5712000,
        'USR-001'
    )
ON CONFLICT DO NOTHING;

INSERT INTO
    purchase_order_line_items (
        purchase_order_id,
        store_id,
        line_index,
        product_id,
        quantity,
        unit_price,
        total
    )
VALUES (
        'PO-202503-015',
        'STR-001',
        1,
        'SP-YDE-001',
        200,
        23800,
        4760000
    ),
    (
        'PO-202503-015',
        'STR-001',
        2,
        'SP-YDE-002',
        80,
        10500,
        840000
    )
ON CONFLICT DO NOTHING;

-- Invoices + lines
INSERT INTO
    invoices (
        ref_id,
        invoice_type,
        issuer_id,
        recipient_id,
        status,
        subtotal,
        tax_amount,
        total_amount,
        created_by_user_id
    )
VALUES (
        'INV-202503-042',
        'INVOICE_TYPE_SALES',
        'STR-001',
        'CLI-987654',
        'INVOICE_STATUS_PAID',
        65000,
        12497.5,
        77497.5,
        'USR-002'
    )
ON CONFLICT DO NOTHING;

INSERT INTO
    invoice_line_items (
        invoice_id,
        store_id,
        line_index,
        product_id,
        quantity,
        unit_price,
        subtotal,
        tax_rate,
        tax_amount,
        total
    )
VALUES (
        'INV-202503-042',
        'STR-001',
        1,
        'SP-YDE-001',
        2,
        28500,
        57000,
        0.1925,
        10972.5,
        67972.5
    ),
    (
        'INV-202503-042',
        'STR-001',
        2,
        'SP-YDE-002',
        1,
        8000,
        8000,
        0.1925,
        1540,
        9540
    )
ON CONFLICT DO NOTHING;