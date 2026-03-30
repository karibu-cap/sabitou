// Defines the local SQLite schema that PowerSync maintains.
// Columns must match exactly what sync_rules.yml SELECTs from PostgreSQL.
// The `id` column (TEXT PK) is implicit — PowerSync manages it automatically.
// ---------------------------------------------------------------------------

import 'package:powersync/powersync.dart';

import '../../utils/app_constants.dart';

final class UsersFields {
  static const String refId = 'ref_id';
  static const String userName = 'user_name';
  static const String email = 'email';
  static const String phoneNumber = 'phone_number';
  static const String firstName = 'first_name';
  static const String lastName = 'last_name';
  static const String connectedAccounts = 'connected_accounts';
  static const String accountStatus = 'account_status';
  static const String profileLinkId = 'profile_link_id';
  static const String requiredActions = 'required_actions';
  static const String activeBusinessId = 'active_business_id';
  static const String activeStoreId = 'active_store_id';
}

final class BusinessesFields {
  static const String refId = 'ref_id';
  static const String name = 'name';
  static const String description = 'description';
  static const String status = 'status';
  static const String ownerId = 'owner_id';
  static const String logoLinkId = 'logo_link_id';
  static const String countryCode = 'country_code';
  static const String currencyCode = 'currency_code';
  static const String externalLinksIds = 'external_links_ids';
  static const String contactInfo = 'contact_info';
  static const String address = 'address';
  static const String email = 'email';
}

final class StoresFields {
  static const String refId = 'ref_id';
  static const String name = 'name';
  static const String description = 'description';
  static const String logoLinkId = 'logo_link_id';
  static const String externalLinksIds = 'external_links_ids';
  static const String businessId = 'business_id';
  static const String createdAt = 'created_at';
  static const String updatedAt = 'updated_at';
  static const String phone = 'phone';
  static const String address = 'address';
  static const String email = 'email';
  static const String costingMethod = 'costing_method';
  static const String tax = 'tax';
  static const String postalBox = 'postal_box';
  static const String nui = 'nui';
  static const String taxPayerNumber = 'tax_payer_number';
}

final class StoreMembersFields {
  static const String storeId = 'store_id';
  static const String userId = 'user_id';
  static const String permissions = 'permissions';
  static const String status = 'status';
  static const String memberSince = 'member_since';
}

final class BusinessMembersFields {
  static const String businessId = 'business_id';
  static const String userId = 'user_id';
  static const String status = 'status';
  static const String memberSince = 'member_since';
}

final class GlobalProductsFields {
  static const String refId = 'ref_id';
  static const String name = 'name';
  static const String description = 'description';
  static const String barCodeValue = 'bar_code_value';
  static const String imagesLinksIds = 'images_links_ids';
  static const String categories = 'categories';
  static const String status = 'status';
}

final class CategoriesFields {
  static const String refId = 'ref_id';
  static const String name = 'name';
  static const String businessId = 'business_id';
  static const String parentCategoryId = 'parent_category_id';
  static const String status = 'status';
  static const String type = 'type';
}

final class StoreProductsFields {
  static const String refId = 'ref_id';
  static const String storeId = 'store_id';
  static const String globalProductId = 'global_product_id';
  static const String salePrice = 'sale_price';
  static const String imagesLinksIds = 'images_links_ids';
  static const String status = 'status';
  static const String expirationType = 'expiration_type';
  static const String sku = 'sku';
  static const String reorderPoint = 'reorder_point';
  static const String createdAt = 'created_at';
  static const String openingStock = 'opening_stock';
  static const String openingStockPerUnit = 'opening_stock_per_unit';
  static const String defaultPurchasePrice = 'default_purchase_price';
}

final class InventoryLevelsFields {
  static const String storeProductId = 'store_product_id';
  static const String storeId = 'store_id';
  static const String quantityAvailable = 'quantity_available';
  static const String quantityCommitted = 'quantity_committed';
  static const String quantityOnHand = 'quantity_on_hand';
  static const String minThreshold = 'min_threshold';
  static const String lastUpdated = 'last_updated';
  static const String lastUpdatedByUserId = 'last_updated_by_user_id';
  static const String batches = 'batches';
}

final class BatchesFields {
  static const String refId = 'ref_id';
  static const String productId = 'product_id';
  static const String warehouseId = 'warehouse_id';
  static const String quantity = 'quantity';
  static const String expirationDate = 'expiration_date';
  static const String receivedAt = 'received_at';
  static const String supplierBatchNumber = 'supplier_batch_number';
  static const String supplierId = 'supplier_id';
  static const String purchasePrice = 'purchase_price';
  static const String status = 'status';
  static const String notes = 'notes';
}

final class InventoryTransactionsFields {
  static const String refId = 'ref_id';
  static const String storeId = 'store_id';
  static const String productId = 'product_id';
  static const String transactionType = 'transaction_type';
  static const String quantityChange = 'quantity_change';
  static const String quantityBefore = 'quantity_before';
  static const String quantityAfter = 'quantity_after';
  static const String relatedDocumentType = 'related_document_type';
  static const String relatedDocumentId = 'related_document_id';
  static const String performedByUserId = 'performed_by_user_id';
  static const String transactionTime = 'transaction_time';
  static const String notes = 'notes';
  static const String batchId = 'batch_id';
  static const String unitPrice = 'unit_price';
  static const String totalAmount = 'total_amount';
  static const String currency = 'currency';
}

final class SuppliersFields {
  static const String refId = 'ref_id';
  static const String name = 'name';
  static const String description = 'description';
  static const String logoLinkId = 'logo_link_id';
  static const String externalLinksIds = 'external_links_ids';
  static const String contactPhone = 'contact_phone';
  static const String contactEmail = 'contact_email';
  static const String contactAddress = 'contact_address';
  static const String status = 'status';
  static const String storeIds = 'store_ids';
}

final class PaymentsFields {
  static const String refId = 'ref_id';
  static const String payerId = 'payer_id';
  static const String receiverRef = 'receiver_ref';
  static const String amount = 'amount';
  static const String currency = 'currency';
  static const String warehouseId = 'warehouse_id';
  static const String paymentMethod = 'payment_method';
  static const String status = 'status';
  static const String paymentDate = 'payment_date';
  static const String referenceNumber = 'reference_number';
  static const String createdByUserId = 'created_by_user_id';
  static const String notes = 'notes';
  static const String relatedDocs = 'related_docs';
  static const String supplierName = 'supplier_name';
}

final class GiftVouchersFields {
  static const String refId = 'ref_id';
  static const String voucherCode = 'voucher_code';
  static const String initialValue = 'initial_value';
  static const String remainingValue = 'remaining_value';
  static const String currency = 'currency';
  static const String issuedToCustomerId = 'issued_to_customer_id';
  static const String issuedByUserId = 'issued_by_user_id';
  static const String warehouseId = 'warehouse_id';
  static const String status = 'status';
  static const String issuedAt = 'issued_at';
  static const String validUntil = 'valid_until';
  static const String notes = 'notes';
}

final class VoucherTransactionsFields {
  static const String refId = 'ref_id';
  static const String voucherId = 'voucher_id';
  static const String storeId = 'store_id';
  static const String relatedInvoiceId = 'related_invoice_id';
  static const String relatedReceiptId = 'related_receipt_id';
  static const String amountUsed = 'amount_used';
  static const String remainingAfter = 'remaining_after';
  static const String usedAt = 'used_at';
  static const String usedByUserId = 'used_by_user_id';
}

final class CashReceiptsFields {
  static const String refId = 'ref_id';
  static const String cashierUserId = 'cashier_user_id';
  static const String customerId = 'customer_id';
  static const String storeId = 'store_id';
  static const String subtotal = 'subtotal';
  static const String taxAmount = 'tax_amount';
  static const String totalAmount = 'total_amount';
  static const String amountPaid = 'amount_paid';
  static const String changeGiven = 'change_given';
  static const String currency = 'currency';
  static const String paymentIds = 'payment_ids';
  static const String transactionTime = 'transaction_time';
  static const String notes = 'notes';
  static const String voucherIssuedCode = 'voucher_issued_code';
  static const String owedToCustomer = 'owed_to_customer';
  static const String status = 'status';
}

final class CashReceiptItemsFields {
  static const String receiptId = 'receipt_id';
  static const String storeId = 'store_id';
  static const String productId = 'product_id';
  static const String quantity = 'quantity';
  static const String unitPrice = 'unit_price';
  static const String subtotal = 'subtotal';
  static const String taxRate = 'tax_rate';
  static const String taxAmount = 'tax_amount';
  static const String total = 'total';
  static const String batchId = 'batch_id';
}

final class SalesOrders {
  static const String refId = 'ref_id';
  static const String customerId = 'customer_id';
  static const String sellerId = 'seller_id';
  static const String sourceWarehouseAddress = 'source_warehouse_address';
  static const String status = 'status';
  static const String totalAmount = 'total_amount';
  static const String currency = 'currency';
  static const String createdByUserId = 'created_by_user_id';
  static const String createdAt = 'created_at';
  static const String deliveryDate = 'delivery_date';
  static const String notes = 'notes';
}

final class SalesOrdersItems {
  static const String salesOrderId = 'sales_order_id';
  static const String storeId = 'store_id';
  static const String productId = 'product_id';
  static const String productName = 'product_name';
  static const String unitPrice = 'unit_price';
  static const String quantity = 'quantity';
  static const String total = 'total';
  static const String batchId = 'batch_id';
}

final class PurchaseOrdersFields {
  static const String refId = 'ref_id';
  static const String supplierId = 'supplier_id';
  static const String storeId = 'store_id';
  static const String status = 'status';
  static const String totalAmount = 'total_amount';
  static const String currency = 'currency';
  static const String createdByUserId = 'created_by_user_id';
  static const String createdAt = 'created_at';
  static const String expectedDeliveryDate = 'expected_delivery_date';
  static const String notes = 'notes';
  static const String orderDate = 'order_date';
  static const String supplierName = 'supplier_name';
  static const String storeName = 'store_name';
  static const String destinationAddress = 'destination_address';
  static const String paymentId = 'payment_id';
  static const String subTotal = 'sub_total';
  static const String taxTotal = 'tax_total';
}

final class PurchaseOrderItemsFields {
  static const String purchaseOrderId = 'purchase_order_id';
  static const String storeId = 'store_id';
  static const String productId = 'product_id';
  static const String quantityOrdered = 'quantity_ordered';
  static const String productName = 'product_name';
  static const String unitPrice = 'unit_price';
  static const String total = 'total';
  static const String batchId = 'batch_id';
  static const String quantityReceived = 'quantity_received';
  static const String taxAmount = 'tax_amount';
}

final class DeliveryNotesFields {
  static const String refId = 'ref_id';
  static const String relatedSalesOrderId = 'related_sales_order_id';
  static const String fromWarehouseId = 'from_warehouse_id';
  static const String toCompanyId = 'to_company_id';
  static const String toAddress = 'to_address';
  static const String status = 'status';
  static const String carrier = 'carrier';
  static const String trackingNumber = 'tracking_number';
  static const String createdByUserId = 'created_by_user_id';
  static const String createdAt = 'created_at';
  static const String shippedAt = 'shipped_at';
  static const String deliveredAt = 'delivered_at';
  static const String notes = 'notes';
}

final class DeliveryNotesItemsFields {
  static const String deliveryNoteId = 'delivery_note_id';
  static const String storeId = 'store_id';
  static const String productId = 'product_id';
  static const String quantity = 'quantity';
  static const String batchId = 'batch_id';
  static const String serialNumbers = 'serial_numbers';
}

final class ResourceLinksFields {
  static const String refId = 'ref_id';
  static const String targetUri = 'target_uri';
  static const String iconUri = 'icon_uri';
  static const String info = 'info';
  static const String label = 'label';
}

final class ReceivingNotesFields {
  static const String refId = 'ref_id';
  static const String relatedPurchaseOrderId = 'related_purchase_order_id';
  static const String supplierId = 'supplier_id';
  static const String buyerId = 'buyer_id';
  static const String receivedByUserId = 'received_by_user_id';
  static const String receivedAt = 'received_at';
  static const String notes = 'notes';
  static const String storeId = 'store_id';
  static const String createdAt = 'created_at';
}

final class ReceivingNoteLineItemsFields {
  static const String id = 'id';
  static const String receivingNoteId = 'receiving_note_id';
  static const String storeId = 'store_id';
  static const String productId = 'product_id';
  static const String quantityExpected = 'quantity_expected';
  static const String quantityReceived = 'quantity_received';
  static const String quantityRejected = 'quantity_rejected';
  static const String rejectionReason = 'rejection_reason';
  static const String batchId = 'batch_id';
  static const String expirationDate = 'expiration_date';
  static const String purchasePrice = 'purchase_price';
}

final class ReturnNotesFields {
  static const String refId = 'ref_id';
  static const String returnType = 'return_type';
  static const String fromId = 'from_id';
  static const String toId = 'to_id';
  static const String relatedDeliveryNoteId = 'related_delivery_note_id';
  static const String relatedInvoiceId = 'related_invoice_id';
  static const String status = 'status';
  static const String reason = 'reason';
  static const String receivedAt = 'received_at';
  static const String receivedByUserId = 'received_by_user_id';
  static const String notes = 'notes';
}

final class ReturnNoteLineItemsFields {
  static const String id = 'id';
  static const String returnNoteId = 'return_note_id';
  static const String productId = 'product_id';
  static const String productName = 'product_name';
  static const String quantity = 'quantity';
  static const String condition = 'condition';
  static const String conditionNotes = 'condition_notes';
  static const String batchId = 'batch_id';
}

final class InvoicesFields {
  static const String refId = 'ref_id';
  static const String invoiceType = 'invoice_type';
  static const String issuerId = 'issuer_id';
  static const String recipientId = 'recipient_id';
  static const String relatedSalesOrderId = 'related_sales_order_id';
  static const String relatedPurchaseOrderId = 'related_purchase_order_id';
  static const String relatedDeliveryNoteId = 'related_delivery_note_id';
  static const String status = 'status';
  static const String subtotal = 'subtotal';
  static const String taxAmount = 'tax_amount';
  static const String totalAmount = 'total_amount';
  static const String currency = 'currency';
  static const String issueDate = 'issue_date';
  static const String dueDate = 'due_date';
  static const String createdByUserId = 'created_by_user_id';
  static const String createdAt = 'created_at';
  static const String paymentIds = 'payment_ids';
  static const String notes = 'notes';
  static const String paymentTerms = 'payment_terms';
}

final class InvoiceLineItemsFields {
  static const String invoiceId = 'invoice_id';
  static const String storeId = 'store_id';
  static const String productId = 'product_id';
  static const String quantity = 'quantity';
  static const String unitPrice = 'unit_price';
  static const String subtotal = 'subtotal';
  static const String taxRate = 'tax_rate';
  static const String taxAmount = 'tax_amount';
  static const String total = 'total';
  static const String batchId = 'batch_id';
  static const String productName = 'product_name';
}

final class BillsFields {
  static const String refId = 'ref_id';
  static const String relatedPurchaseOrderId = 'related_purchase_order_id';
  static const String supplierId = 'supplier_id';
  static const String storeId = 'store_id';
  static const String status = 'status';
  static const String paymentIds = 'payment_ids';
  static const String billDate = 'bill_date';
  static const String dueDate = 'due_date';
  static const String subTotal = 'sub_total';
  static const String taxTotal = 'tax_total';
  static const String totalAmount = 'total_amount';
  static const String balanceDue = 'balance_due';
  static const String currency = 'currency';
  static const String notes = 'notes';
  static const String createdAt = 'created_at';
}

final class BillLineItemsFields {
  static const String billId = 'bill_id';
  static const String storeId = 'store_id';
  static const String productId = 'product_id';
  static const String description = 'description';
  static const String quantity = 'quantity';
  static const String unitPrice = 'unit_price';
  static const String taxAmount = 'tax_amount';
  static const String total = 'total';
}

final class LocalAuthFields {
  static const String id = 'id';
  static const String userId = 'user_id';
  static const String email = 'email';
  static const String passwordHash = 'password_hash';
  static const String storedAt = 'stored_at';
}

/// The full PowerSync schema for the Sabitou inventory app using static keys.
final schema = const Schema([
  Table(CollectionName.users, [
    Column.text(UsersFields.refId),
    Column.text(UsersFields.userName),
    Column.text(UsersFields.email),
    Column.text(UsersFields.phoneNumber),
    Column.text(UsersFields.firstName),
    Column.text(UsersFields.lastName),
    Column.text(UsersFields.connectedAccounts), // JSON
    Column.text(UsersFields.accountStatus),
    Column.text(UsersFields.profileLinkId),
    Column.text(UsersFields.requiredActions), // JSON
    Column.text(UsersFields.activeBusinessId),
    Column.text(UsersFields.activeStoreId),
  ]),

  Table(CollectionName.businesses, [
    Column.text(BusinessesFields.refId),
    Column.text(BusinessesFields.name),
    Column.text(BusinessesFields.description),
    Column.text(BusinessesFields.status),
    Column.text(BusinessesFields.ownerId),
    Column.text(BusinessesFields.logoLinkId),
    Column.text(BusinessesFields.countryCode),
    Column.text(BusinessesFields.currencyCode),
    Column.text(BusinessesFields.externalLinksIds), // JSON
    Column.text(BusinessesFields.contactInfo),
    Column.text(BusinessesFields.address),
    Column.text(BusinessesFields.email),
  ]),

  Table(CollectionName.stores, [
    Column.text(StoresFields.refId),
    Column.text(StoresFields.name),
    Column.text(StoresFields.description),
    Column.text(StoresFields.logoLinkId),
    Column.text(StoresFields.externalLinksIds), // JSON
    Column.text(StoresFields.businessId),
    Column.text(StoresFields.createdAt),
    Column.text(StoresFields.updatedAt),
    Column.text(StoresFields.phone),
    Column.text(StoresFields.address), // JSON
    Column.text(StoresFields.email),
    Column.text(StoresFields.costingMethod),
    Column.real(StoresFields.tax),
    Column.text(StoresFields.postalBox),
    Column.text(StoresFields.nui),
    Column.text(StoresFields.taxPayerNumber),
  ]),

  Table(CollectionName.storeMembers, [
    Column.text(StoreMembersFields.storeId),
    Column.text(StoreMembersFields.userId),
    Column.text(StoreMembersFields.permissions), // ← JSON string
    Column.text(StoreMembersFields.status),
    Column.text(StoreMembersFields.memberSince),
  ]),

  Table(CollectionName.globalProducts, [
    Column.text(GlobalProductsFields.refId),
    Column.text(GlobalProductsFields.name),
    Column.text(GlobalProductsFields.description),
    Column.text(GlobalProductsFields.barCodeValue),
    Column.text(GlobalProductsFields.imagesLinksIds),
    Column.text(GlobalProductsFields.categories), // JSON array of ids
    Column.text(GlobalProductsFields.status),
  ]),

  Table(CollectionName.categories, [
    Column.text(CategoriesFields.refId),
    Column.text(CategoriesFields.name),
    Column.text(CategoriesFields.businessId),
    Column.text(CategoriesFields.parentCategoryId),
    Column.text(CategoriesFields.status),
    Column.text(CategoriesFields.type),
  ]),

  Table(
    CollectionName.storeProducts,
    [
      Column.text(StoreProductsFields.refId),
      Column.text(StoreProductsFields.storeId),
      Column.text(StoreProductsFields.globalProductId),
      Column.integer(StoreProductsFields.salePrice),
      Column.text(StoreProductsFields.imagesLinksIds),
      Column.text(StoreProductsFields.status),
      Column.text(StoreProductsFields.expirationType),
      Column.text(StoreProductsFields.sku),
      Column.integer(StoreProductsFields.reorderPoint),
      Column.text(StoreProductsFields.createdAt),
      Column.integer(StoreProductsFields.openingStock),
      Column.real(StoreProductsFields.openingStockPerUnit),
      Column.real(StoreProductsFields.defaultPurchasePrice),
    ],
    indexes: [
      Index('idx_sp_store', [IndexedColumn(StoreProductsFields.storeId)]),
      Index('idx_sp_global', [
        IndexedColumn(StoreProductsFields.globalProductId),
      ]),
      Index('idx_sp_sku', [IndexedColumn(StoreProductsFields.sku)]),
    ],
  ),

  Table(CollectionName.inventoryLevels, [
    Column.text(InventoryLevelsFields.storeProductId),
    Column.text(InventoryLevelsFields.storeId),
    Column.integer(InventoryLevelsFields.quantityAvailable),
    Column.integer(InventoryLevelsFields.quantityCommitted),
    Column.integer(InventoryLevelsFields.quantityOnHand),
    Column.integer(InventoryLevelsFields.minThreshold),
    Column.text(InventoryLevelsFields.lastUpdated),
    Column.text(InventoryLevelsFields.lastUpdatedByUserId),
    Column.text(InventoryLevelsFields.batches),
  ]),

  Table(CollectionName.businessMembers, [
    Column.text(BusinessMembersFields.businessId),
    Column.text(BusinessMembersFields.userId),
    Column.text(BusinessMembersFields.status),
    Column.text(BusinessMembersFields.memberSince),
  ]),

  Table(CollectionName.batches, [
    Column.text(BatchesFields.refId),
    Column.text(BatchesFields.productId),
    Column.text(BatchesFields.warehouseId),
    Column.integer(BatchesFields.quantity),
    Column.text(BatchesFields.expirationDate),
    Column.text(BatchesFields.receivedAt),
    Column.text(BatchesFields.supplierBatchNumber),
    Column.text(BatchesFields.supplierId),
    Column.integer(BatchesFields.purchasePrice),
    Column.text(BatchesFields.status),
    Column.text(BatchesFields.notes),
  ]),

  Table(
    CollectionName.inventoryTransactions,
    [
      Column.text(InventoryTransactionsFields.refId),
      Column.text(InventoryTransactionsFields.storeId),
      Column.text(InventoryTransactionsFields.productId),
      Column.text(InventoryTransactionsFields.transactionType),
      Column.integer(InventoryTransactionsFields.quantityChange),
      Column.integer(InventoryTransactionsFields.quantityBefore),
      Column.integer(InventoryTransactionsFields.quantityAfter),
      Column.text(InventoryTransactionsFields.relatedDocumentType),
      Column.text(InventoryTransactionsFields.relatedDocumentId),
      Column.text(InventoryTransactionsFields.performedByUserId),
      Column.text(InventoryTransactionsFields.transactionTime),
      Column.text(InventoryTransactionsFields.notes),
      Column.text(InventoryTransactionsFields.batchId),
      Column.real(InventoryTransactionsFields.unitPrice),
      Column.real(InventoryTransactionsFields.totalAmount),
      Column.text(InventoryTransactionsFields.currency),
    ],
    indexes: [
      Index('idx_it_product', [
        IndexedColumn(InventoryTransactionsFields.productId),
      ]),
      Index('idx_it_store', [
        IndexedColumn(InventoryTransactionsFields.storeId),
      ]),
    ],
  ),

  Table(CollectionName.suppliers, [
    Column.text(SuppliersFields.refId),
    Column.text(SuppliersFields.name),
    Column.text(SuppliersFields.description),
    Column.text(SuppliersFields.logoLinkId),
    Column.text(SuppliersFields.externalLinksIds),
    Column.text(SuppliersFields.contactPhone),
    Column.text(SuppliersFields.contactEmail),
    Column.text(SuppliersFields.contactAddress),
    Column.text(SuppliersFields.status),
    Column.text(SuppliersFields.storeIds),
  ]),

  Table(CollectionName.payments, [
    Column.text(PaymentsFields.refId),
    Column.text(PaymentsFields.payerId),
    Column.text(PaymentsFields.receiverRef),
    Column.real(PaymentsFields.amount),
    Column.text(PaymentsFields.currency),
    Column.text(PaymentsFields.warehouseId),
    Column.text(PaymentsFields.paymentMethod),
    Column.text(PaymentsFields.status),
    Column.text(PaymentsFields.paymentDate),
    Column.text(PaymentsFields.referenceNumber),
    Column.text(PaymentsFields.createdByUserId),
    Column.text(PaymentsFields.notes),
    Column.text(PaymentsFields.relatedDocs),
  ]),

  Table(CollectionName.giftVouchers, [
    Column.text(GiftVouchersFields.refId),
    Column.text(GiftVouchersFields.voucherCode),
    Column.real(GiftVouchersFields.initialValue),
    Column.real(GiftVouchersFields.remainingValue),
    Column.text(GiftVouchersFields.currency),
    Column.text(GiftVouchersFields.issuedToCustomerId),
    Column.text(GiftVouchersFields.issuedByUserId),
    Column.text(GiftVouchersFields.warehouseId),
    Column.text(GiftVouchersFields.status),
    Column.text(GiftVouchersFields.issuedAt),
    Column.text(GiftVouchersFields.validUntil),
    Column.text(GiftVouchersFields.notes),
  ]),

  Table(CollectionName.voucherTransactions, [
    Column.text(VoucherTransactionsFields.refId),
    Column.text(VoucherTransactionsFields.voucherId),
    Column.text(VoucherTransactionsFields.storeId),
    Column.text(VoucherTransactionsFields.relatedInvoiceId),
    Column.text(VoucherTransactionsFields.relatedReceiptId),
    Column.real(VoucherTransactionsFields.amountUsed),
    Column.real(VoucherTransactionsFields.remainingAfter),
    Column.text(VoucherTransactionsFields.usedAt),
    Column.text(VoucherTransactionsFields.usedByUserId),
  ]),

  Table(CollectionName.cashReceipts, [
    Column.text(CashReceiptsFields.refId),
    Column.text(CashReceiptsFields.cashierUserId),
    Column.text(CashReceiptsFields.customerId),
    Column.text(CashReceiptsFields.storeId),
    Column.real(CashReceiptsFields.subtotal),
    Column.real(CashReceiptsFields.taxAmount),
    Column.real(CashReceiptsFields.totalAmount),
    Column.real(CashReceiptsFields.amountPaid),
    Column.real(CashReceiptsFields.changeGiven),
    Column.text(CashReceiptsFields.currency),
    Column.text(CashReceiptsFields.paymentIds),
    Column.text(CashReceiptsFields.transactionTime),
    Column.text(CashReceiptsFields.notes),
    Column.text(CashReceiptsFields.voucherIssuedCode),
    Column.real(CashReceiptsFields.owedToCustomer),
    Column.text(CashReceiptsFields.status),
  ]),

  Table(
    CollectionName.cashReceiptItems,
    [
      Column.text(CashReceiptItemsFields.receiptId),
      Column.text(CashReceiptItemsFields.storeId),
      Column.text(CashReceiptItemsFields.productId),
      Column.integer(CashReceiptItemsFields.quantity),
      Column.real(CashReceiptItemsFields.unitPrice),
      Column.real(CashReceiptItemsFields.subtotal),
      Column.real(CashReceiptItemsFields.taxRate),
      Column.real(CashReceiptItemsFields.taxAmount),
      Column.real(CashReceiptItemsFields.total),
      Column.text(CashReceiptItemsFields.batchId),
    ],
    indexes: [
      Index('idx_cri_receipt', [
        IndexedColumn(CashReceiptItemsFields.receiptId),
      ]),
    ],
  ),

  Table(CollectionName.salesOrders, [
    Column.text(SalesOrders.refId),
    Column.text(SalesOrders.customerId),
    Column.text(SalesOrders.sellerId),
    Column.text(SalesOrders.sourceWarehouseAddress),
    Column.text(SalesOrders.status),
    Column.real(SalesOrders.totalAmount),
    Column.text(SalesOrders.currency),
    Column.text(SalesOrders.createdByUserId),
    Column.text(SalesOrders.createdAt),
    Column.text(SalesOrders.deliveryDate),
    Column.text(SalesOrders.notes),
  ]),

  Table(CollectionName.salesOrdersItemss, [
    Column.text(SalesOrdersItems.salesOrderId),
    Column.text(SalesOrdersItems.storeId),
    Column.text(SalesOrdersItems.productId),
    Column.text(SalesOrdersItems.productName), // JSON {en,fr}
    Column.real(SalesOrdersItems.unitPrice),
    Column.integer(SalesOrdersItems.quantity),
    Column.real(SalesOrdersItems.total),
    Column.text(SalesOrdersItems.batchId),
  ]),

  Table(
    CollectionName.purchaseOrderItems,
    [
      Column.text(PurchaseOrderItemsFields.purchaseOrderId),
      Column.text(PurchaseOrderItemsFields.storeId),
      Column.text(PurchaseOrderItemsFields.productId),
      Column.integer(PurchaseOrderItemsFields.quantityOrdered),
      Column.text(PurchaseOrderItemsFields.productName),
      Column.real(PurchaseOrderItemsFields.unitPrice),
      Column.real(PurchaseOrderItemsFields.total),
      Column.text(PurchaseOrderItemsFields.batchId),
      Column.integer(PurchaseOrderItemsFields.quantityReceived),
      Column.real(PurchaseOrderItemsFields.taxAmount),
    ],
    indexes: [
      Index('idx_poi_order', [
        IndexedColumn(PurchaseOrderItemsFields.purchaseOrderId),
      ]),
    ],
  ),

  Table(CollectionName.purchaseOrders, [
    Column.text(PurchaseOrdersFields.refId),
    Column.text(PurchaseOrdersFields.supplierId),
    Column.text(PurchaseOrdersFields.storeId),
    Column.text(PurchaseOrdersFields.status),
    Column.real(PurchaseOrdersFields.totalAmount),
    Column.text(PurchaseOrdersFields.currency),
    Column.text(PurchaseOrdersFields.createdByUserId),
    Column.text(PurchaseOrdersFields.createdAt),
    Column.text(PurchaseOrdersFields.expectedDeliveryDate),
    Column.text(PurchaseOrdersFields.notes),
    Column.text(PurchaseOrdersFields.storeName),
    Column.text(PurchaseOrdersFields.supplierName),
    Column.text(PurchaseOrdersFields.orderDate),
    Column.text(PurchaseOrdersFields.destinationAddress),
    Column.text(PurchaseOrdersFields.paymentId),
    Column.real(PurchaseOrdersFields.subTotal),
    Column.real(PurchaseOrdersFields.taxTotal),
  ]),

  Table(CollectionName.deliveryNotes, [
    Column.text(DeliveryNotesFields.refId),
    Column.text(DeliveryNotesFields.relatedSalesOrderId),
    Column.text(DeliveryNotesFields.fromWarehouseId),
    Column.text(DeliveryNotesFields.toCompanyId),
    Column.text(DeliveryNotesFields.toAddress),
    Column.text(DeliveryNotesFields.status),
    Column.text(DeliveryNotesFields.carrier),
    Column.text(DeliveryNotesFields.trackingNumber),
    Column.text(DeliveryNotesFields.createdByUserId),
    Column.text(DeliveryNotesFields.createdAt),
    Column.text(DeliveryNotesFields.shippedAt),
    Column.text(DeliveryNotesFields.deliveredAt),
    Column.text(DeliveryNotesFields.notes),
  ]),

  Table(
    CollectionName.deliveryNotesItems,
    [
      Column.text(DeliveryNotesItemsFields.deliveryNoteId),
      Column.text(DeliveryNotesItemsFields.storeId),
      Column.text(DeliveryNotesItemsFields.productId),
      Column.real(DeliveryNotesItemsFields.quantity),
      Column.text(DeliveryNotesItemsFields.batchId),
      Column.text(DeliveryNotesItemsFields.serialNumbers),
    ],
    indexes: [
      Index('idx_dln_order', [
        IndexedColumn(DeliveryNotesItemsFields.deliveryNoteId),
      ]),
    ],
  ),

  Table(CollectionName.resourceLinks, [
    Column.text(ResourceLinksFields.refId),
    Column.text(ResourceLinksFields.targetUri),
    Column.text(ResourceLinksFields.iconUri),
    Column.text(ResourceLinksFields.info),
    Column.text(ResourceLinksFields.label),
  ]),

  Table(CollectionName.receivingNotes, [
    Column.text(ReceivingNotesFields.refId),
    Column.text(ReceivingNotesFields.relatedPurchaseOrderId),
    Column.text(ReceivingNotesFields.supplierId),
    Column.text(ReceivingNotesFields.buyerId),
    Column.text(ReceivingNotesFields.receivedByUserId),
    Column.text(ReceivingNotesFields.receivedAt),
    Column.text(ReceivingNotesFields.notes),
    Column.text(ReceivingNotesFields.storeId),
    Column.text(ReceivingNotesFields.createdAt),
  ]),

  Table(
    CollectionName.receivingNoteLineItems,
    [
      Column.text(ReceivingNoteLineItemsFields.receivingNoteId),
      Column.text(ReceivingNoteLineItemsFields.storeId),
      Column.text(ReceivingNoteLineItemsFields.productId),
      Column.real(ReceivingNoteLineItemsFields.quantityExpected),
      Column.real(ReceivingNoteLineItemsFields.quantityReceived),
      Column.real(ReceivingNoteLineItemsFields.quantityRejected),
      Column.text(ReceivingNoteLineItemsFields.rejectionReason),
      Column.text(ReceivingNoteLineItemsFields.batchId),
      Column.text(ReceivingNoteLineItemsFields.expirationDate),
      Column.real(ReceivingNoteLineItemsFields.purchasePrice),
    ],
    indexes: [
      Index('idx_rni_order', [
        IndexedColumn(ReceivingNoteLineItemsFields.receivingNoteId),
      ]),
    ],
  ),

  Table(CollectionName.returnNotes, [
    Column.text(ReturnNotesFields.refId),
    Column.text(ReturnNotesFields.returnType),
    Column.text(ReturnNotesFields.fromId),
    Column.text(ReturnNotesFields.toId),
    Column.text(ReturnNotesFields.relatedDeliveryNoteId),
    Column.text(ReturnNotesFields.relatedInvoiceId),
    Column.text(ReturnNotesFields.status),
    Column.text(ReturnNotesFields.reason),
    Column.text(ReturnNotesFields.receivedAt),
    Column.text(ReturnNotesFields.receivedByUserId),
    Column.text(ReturnNotesFields.notes),
  ]),

  Table(
    CollectionName.returnNoteLineItems,
    [
      Column.text(ReturnNoteLineItemsFields.returnNoteId),
      Column.text(ReturnNoteLineItemsFields.productId),
      Column.text(ReturnNoteLineItemsFields.productName), // JSON {en, fr}
      Column.real(ReturnNoteLineItemsFields.quantity),
      Column.text(ReturnNoteLineItemsFields.condition),
      Column.text(ReturnNoteLineItemsFields.conditionNotes),
      Column.text(ReturnNoteLineItemsFields.batchId),
    ],
    indexes: [
      Index('idx_ret_order', [
        IndexedColumn(ReturnNoteLineItemsFields.returnNoteId),
      ]),
    ],
  ),

  Table(CollectionName.invoices, [
    Column.text(InvoicesFields.refId),
    Column.text(InvoicesFields.invoiceType),
    Column.text(InvoicesFields.issuerId),
    Column.text(InvoicesFields.recipientId),
    Column.text(InvoicesFields.relatedSalesOrderId),
    Column.text(InvoicesFields.relatedPurchaseOrderId),
    Column.text(InvoicesFields.relatedDeliveryNoteId),
    Column.text(InvoicesFields.status),
    Column.real(InvoicesFields.subtotal),
    Column.real(InvoicesFields.taxAmount),
    Column.real(InvoicesFields.totalAmount),
    Column.text(InvoicesFields.currency),
    Column.text(InvoicesFields.issueDate),
    Column.text(InvoicesFields.dueDate),
    Column.text(InvoicesFields.createdByUserId),
    Column.text(InvoicesFields.createdAt),
    Column.text(InvoicesFields.paymentIds), // JSON array or comma separated
    Column.text(InvoicesFields.notes),
    Column.text(InvoicesFields.paymentTerms),
  ]),

  Table(
    CollectionName.bills,
    [
      Column.text(BillsFields.refId),
      Column.text(BillsFields.relatedPurchaseOrderId),
      Column.text(BillsFields.supplierId),
      Column.text(BillsFields.storeId),
      Column.text(BillsFields.status),
      Column.text(BillsFields.paymentIds),
      Column.text(BillsFields.billDate),
      Column.text(BillsFields.dueDate),
      Column.real(BillsFields.subTotal),
      Column.real(BillsFields.taxTotal),
      Column.real(BillsFields.totalAmount),
      Column.real(BillsFields.balanceDue),
      Column.text(BillsFields.currency),
      Column.text(BillsFields.notes),
      Column.text(BillsFields.createdAt),
    ],
    indexes: [
      Index('idx_bills_store', [IndexedColumn(BillsFields.storeId)]),
      Index('idx_bills_status', [IndexedColumn(BillsFields.status)]),
      Index('idx_bills_supplier', [IndexedColumn(BillsFields.supplierId)]),
    ],
  ),

  Table(
    CollectionName.invoiceLineItems,
    [
      Column.text(InvoiceLineItemsFields.invoiceId),
      Column.text(InvoiceLineItemsFields.storeId),
      Column.text(InvoiceLineItemsFields.productId),
      Column.integer(InvoiceLineItemsFields.quantity),
      Column.real(InvoiceLineItemsFields.unitPrice),
      Column.real(InvoiceLineItemsFields.subtotal),
      Column.real(InvoiceLineItemsFields.taxRate),
      Column.real(InvoiceLineItemsFields.taxAmount),
      Column.real(InvoiceLineItemsFields.total),
      Column.text(InvoiceLineItemsFields.batchId),
      Column.text(
        InvoiceLineItemsFields.productName,
      ), // JSON {en, fr} — denormalized copy
    ],
    indexes: [
      Index('idx_ili_order', [IndexedColumn(InvoiceLineItemsFields.invoiceId)]),
    ],
  ),

  Table(
    CollectionName.billLineItems,
    [
      Column.text(BillLineItemsFields.billId),
      Column.text(BillLineItemsFields.storeId),
      Column.text(BillLineItemsFields.productId),
      Column.text(BillLineItemsFields.description),
      Column.integer(BillLineItemsFields.quantity),
      Column.real(BillLineItemsFields.unitPrice),
      Column.real(BillLineItemsFields.taxAmount),
      Column.real(BillLineItemsFields.total),
    ],
    indexes: [
      Index('idx_bli_order', [IndexedColumn(BillLineItemsFields.billId)]),
    ],
  ),

  Table.localOnly(CollectionName.localAuth, [
    Column.text(LocalAuthFields.userId),
    Column.text(LocalAuthFields.email),
    Column.text(LocalAuthFields.passwordHash),
    Column.integer(LocalAuthFields.storedAt),
  ]),
]);
