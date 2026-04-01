import 'package:clock/clock.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../utils/app_constants.dart';

const unsplashImages = [
  'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=400&h=300&fit=crop',
  'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=400&h=300&fit=crop',
  'https://images.unsplash.com/photo-1560472354-b33ff0c44a43?w=400&h=300&fit=crop',
  'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400&h=300&fit=crop',
  'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400&h=300&fit=crop',
  'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=300&fit=crop',
  'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=400&h=300&fit=crop',
  'https://images.unsplash.com/photo-1583394838336-acd977736f90?w=400&h=300&fit=crop',
  'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400&h=300&fit=crop',
  'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=300&fit=crop',
  'https://images.unsplash.com/photo-1547036967-23d11aacaee0?w=400&h=300&fit=crop',
  'https://images.unsplash.com/photo-1576091160550-2173dba999ef?w=400&h=300&fit=crop',
  'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400&h=300&fit=crop',
  'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=400&h=300&fit=crop',
  'https://images.unsplash.com/photo-1583394838336-acd977736f90?w=400&h=300&fit=crop',
  'https://images.unsplash.com/photo-1560472354-b33ff0c44a43?w=400&h=300&fit=crop',
  'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400&h=300&fit=crop',
  'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400&h=300&fit=crop',
  'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=300&fit=crop',
  'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=400&h=300&fit=crop',
];

final fakeUsers = <User>[
  User()
    ..refId = 'USR-001'
    ..userName = 'admin_user'
    ..connectedAccounts.addAll([
      ConnectedAccount()
        ..provider = ProviderType.PROVIDER_TYPE_GOOGLE
        ..rawData = '{"sub": "12345"}',
    ])
    ..email = 'admin@example.com'
    ..phoneNumber = '+1234567890'
    ..firstName = 'Admin'
    ..lastName = 'User'
    ..profileLink = ResourceLink(
      refId: 'link-028',
      targetUri: 'https://profile.example.com/admin',
      iconUri: 'https://icon.example.com/admin',
      info: 'Admin Profile',
      label: 'Profile',
    )
    ..accountStatus = AccountStatusType.ACCOUNT_STATUS_TYPE_ACTIVE
    ..requiredActions.addAll([AuthActionType.AUTH_ACTION_TYPE_VERIFY_EMAIL]),
];

/// Fake ResourceLink data for images and other resources
final fakeResourceLinks = <ResourceLink>[
  ResourceLink()
    ..refId = 'MDI-001'
    ..targetUri = unsplashImages.first
    ..iconUri = unsplashImages.first
    ..info = 'Smartphone product image'
    ..label = 'Product Image',
  ResourceLink()
    ..refId = 'MDI-002'
    ..targetUri = unsplashImages[1]
    ..iconUri = unsplashImages[1]
    ..info = 'Laptop product image'
    ..label = 'Product Image',
  ResourceLink()
    ..refId = 'MDI-003'
    ..targetUri = unsplashImages[2]
    ..iconUri = unsplashImages[2]
    ..info = 'Tablet product image'
    ..label = 'Product Image',
  ResourceLink()
    ..refId = 'MDI-004'
    ..targetUri = unsplashImages[3]
    ..iconUri = unsplashImages[3]
    ..info = 'TV product image'
    ..label = 'Product Image',
  ResourceLink()
    ..refId = 'MDI-005'
    ..targetUri = unsplashImages[4]
    ..iconUri = unsplashImages[4]
    ..info = 'Store logo'
    ..label = 'Store Logo',
  ResourceLink()
    ..refId = 'MDI-006'
    ..targetUri = unsplashImages[5]
    ..iconUri = unsplashImages[5]
    ..info = 'Business logo'
    ..label = 'Business Logo',
  ResourceLink()
    ..refId = 'MDI-013'
    ..targetUri = unsplashImages[7]
    ..iconUri = unsplashImages[7]
    ..info = 'Supplier logo'
    ..label = 'Supplier Logo',
];

final fakeCategories = <Category>[
  Category()
    ..refId = 'CTG-001'
    ..name = Internationalized(fr: 'Electronics', en: 'Electronics')
    ..businessId = 'BSN-001'
    ..createdAt = Timestamp.fromDateTime(DateTime.parse('2025-09-01T10:00:00Z'))
    ..updatedAt = Timestamp.fromDateTime(
      DateTime.parse('2025-09-01T10:00:00Z'),
    ),

  Category()
    ..refId = 'CTG-002'
    ..name = Internationalized(fr: 'Habit', en: 'Clothes')
    ..businessId = 'BSN-001'
    ..createdAt = Timestamp.fromDateTime(DateTime.parse('2025-09-01T10:00:00Z'))
    ..updatedAt = Timestamp.fromDateTime(
      DateTime.parse('2025-09-01T10:00:00Z'),
    ),
  Category()
    ..refId = 'CTG-003'
    ..name = Internationalized(fr: 'Voiture', en: 'Car')
    ..businessId = 'BSN-001'
    ..createdAt = Timestamp.fromDateTime(DateTime.parse('2025-09-01T10:00:00Z'))
    ..updatedAt = Timestamp.fromDateTime(
      DateTime.parse('2025-09-01T10:00:00Z'),
    ),
];

/// Fake data for testing
final fakeData = <String, List<dynamic>>{
  CollectionName.stores: <Store>[
    Store()
      ..refId = 'STR-001'
      ..name = 'Main Store'
      ..description = 'Primary retail location for electronics and home goods'
      ..logoLinkId = 'media-logo-001'
      ..externalLinksIds = 'link-001,link-002'
      ..businessId = 'BSN-001',
  ],
  CollectionName.businesses: <Business>[
    Business()
      ..refId = 'BSN-001'
      ..name = 'Tech Corp'
      ..description = 'Technology solutions provider'
      ..status = BusinessStatusType.BUSINESS_STATUS_TYPE_ACTIVE
      ..ownerId = 'USR-001'
      ..logoLinkId = 'media-logo-006'
      ..countryCode = 'US'
      ..currencyCode = 'USD'
      ..externalLinksIds.addAll(['link-010'])
      ..address = '123 Tech Street, Tech City'
      ..email = 'techcorp@example.com'
      ..contactInfo = '123-456-7890',
  ],
  CollectionName.businessMembers: <BusinessMember>[
    BusinessMember()
      ..userId = fakeUsers.first.refId
      ..businessId = 'BSN-001'
      ..memberSince = Timestamp.fromDateTime(
        DateTime.parse('2023-01-01T00:00:00Z'),
      ),
  ],
  CollectionName.batches: <Batch>[],
  CollectionName.inventoryLevels: <InventoryLevel>[
    InventoryLevel()
      ..storeProductId = 'PRD-001'
      ..storeId = 'STR-001'
      ..quantityAvailable = 189
      ..quantityCommitted = 17
      ..quantityOnHand = 206
      ..minThreshold = 10
      ..lastUpdated = Timestamp.fromDateTime(clock.now())
      ..batches.addAll([
        Batch()
          ..refId = 'batch_sp1_1'
          ..productId = 'PRD-001'
          ..warehouseId = 'STR-001'
          ..quantity = 161
          ..purchasePrice = 29400
          ..supplierId = 'SUP-001'
          ..expirationDate = Timestamp.fromDateTime(
            clock.now().add(const Duration(days: 180)),
          )
          ..receivedAt = Timestamp.fromDateTime(
            clock.now().subtract(const Duration(days: 45)),
          )
          ..status = BatchStatus.BATCH_STATUS_ACTIVE,
        Batch()
          ..refId = 'batch_sp1_2'
          ..productId = 'PRD-001'
          ..warehouseId = 'STR-001'
          ..quantity = 45
          ..purchasePrice = 29000
          ..supplierId = 'supplier_2'
          ..expirationDate = Timestamp.fromDateTime(
            clock.now().add(const Duration(days: 90)),
          )
          ..receivedAt = Timestamp.fromDateTime(
            clock.now().subtract(const Duration(days: 15)),
          )
          ..status = BatchStatus.BATCH_STATUS_ACTIVE,
      ]),
    InventoryLevel()
      ..storeProductId = 'PRD-002'
      ..storeId = 'STR-001'
      ..quantityAvailable = 8
      ..quantityCommitted = 2
      ..quantityOnHand = 10
      ..minThreshold = 15
      ..lastUpdated = Timestamp.fromDateTime(clock.now())
      ..batches.add(
        Batch()
          ..refId = 'batch_sp2_1'
          ..productId = 'PRD-002'
          ..warehouseId = 'STR-001'
          ..quantity = 10
          ..purchasePrice = 15000
          ..supplierId = 'SUP-001'
          ..expirationDate = Timestamp.fromDateTime(
            clock.now().add(const Duration(days: 120)),
          )
          ..receivedAt = Timestamp.fromDateTime(
            clock.now().subtract(const Duration(days: 20)),
          )
          ..status = BatchStatus.BATCH_STATUS_ACTIVE,
      ),
    InventoryLevel()
      ..storeProductId = 'product-003'
      ..storeId = 'STR-001'
      ..quantityAvailable = 20
      ..quantityCommitted = 0
      ..quantityOnHand = 20
      ..lastUpdated = Timestamp.fromDateTime(clock.now())
      ..batches.addAll([
        Batch()
          ..refId = 'batch_sp3_1'
          ..productId = 'product-003'
          ..warehouseId = 'STR-001'
          ..quantity = 20
          ..purchasePrice = 8000
          ..supplierId = 'supplier_2'
          ..expirationDate = Timestamp.fromDateTime(
            clock.now().add(const Duration(days: 45)),
          )
          ..receivedAt = Timestamp.fromDateTime(
            clock.now().subtract(const Duration(days: 30)),
          )
          ..status = BatchStatus.BATCH_STATUS_ACTIVE,
        Batch()
          ..refId = 'batch_sp3_2'
          ..productId = 'product-003'
          ..warehouseId = 'STR-001'
          ..quantity = 0
          ..purchasePrice = 7500
          ..supplierId = 'SUP-001'
          ..expirationDate = Timestamp.fromDateTime(
            clock.now().subtract(const Duration(days: 1)),
          )
          ..status = BatchStatus.BATCH_STATUS_EXPIRED,
      ]),
  ],
  CollectionName.inventoryTransactions: <InventoryTransaction>[
    InventoryTransaction()
      ..refId = 'TXN-2025-001'
      ..storeId = 'STR-001'
      ..productId = 'PRD-001'
      ..transactionType = TransactionType.TXN_TYPE_PURCHASE
      ..quantityChange = 10
      ..quantityBefore = 0
      ..quantityAfter = 10
      ..relatedDocumentType = 'PurchaseOrder'
      ..relatedDocumentId = 'PO-2025-001'
      ..performedByUserId = 'USR-001'
      ..transactionTime = Timestamp.fromDateTime(DateTime.now())
      ..notes = 'Initial stock from purchase order',
    InventoryTransaction()
      ..refId = 'TXN-2025-002'
      ..storeId = 'STR-001'
      ..productId = 'PRD-002'
      ..transactionType = TransactionType.TXN_TYPE_PURCHASE
      ..quantityChange = 5
      ..quantityBefore = 0
      ..quantityAfter = 5
      ..relatedDocumentType = 'PurchaseOrder'
      ..relatedDocumentId = 'PO-2025-002'
      ..performedByUserId = 'USR-001'
      ..transactionTime = Timestamp.fromDateTime(DateTime.now())
      ..notes = 'Received laptop stock',
    InventoryTransaction()
      ..refId = 'TXN-2025-003'
      ..storeId = 'STR-001'
      ..productId = 'PRD-001'
      ..transactionType = TransactionType.TXN_TYPE_SALE
      ..quantityChange = -2
      ..quantityBefore = 10
      ..quantityAfter = 8
      ..relatedDocumentType = 'CashReceipt'
      ..relatedDocumentId = 'CASH-2025-001'
      ..performedByUserId = 'USR-001'
      ..transactionTime = Timestamp.fromDateTime(DateTime.now())
      ..notes = 'Sale of 2 smartphones',
    InventoryTransaction()
      ..refId = 'TXN-2025-004'
      ..storeId = 'STR-001'
      ..productId = 'product-003'
      ..transactionType = TransactionType.TXN_TYPE_ADJUSTMENT
      ..quantityChange = -1
      ..quantityBefore = 1
      ..quantityAfter = 0
      ..performedByUserId = 'USR-001'
      ..transactionTime = Timestamp.fromDateTime(DateTime.now())
      ..notes = 'Tablet damaged during handling',
  ],
  CollectionName.storeMembers: <StoreMember>[
    StoreMember()
      ..userId = fakeUsers.first.refId
      ..storeId = 'STR-001'
      ..memberSince = Timestamp.fromDateTime(
        DateTime.parse('2023-01-01T00:00:00Z'),
      )
      ..permissions = StorePermissions()
      ..permissions.member = StoreMemberPermission()
      ..permissions.member.deleteMember = true
      ..permissions.member.updateMember = true
      ..permissions.member.readInformation = true
      ..permissions.member.inviteMember = true
      ..permissions.product = StoreProductPermission()
      ..permissions.product.createProductInInventory = true
      ..permissions.product.updateProductInInventory = true
      ..permissions.product.deleteProductInInventory = true
      ..permissions.product.readProductInInventory = true
      ..permissions.invoice = StoreInvoicePermission()
      ..permissions.invoice.readInvoice = true
      ..permissions.invoice.createInvoice = true
      ..permissions.transaction = StoreTransactionPermission()
      ..permissions.transaction.readTransaction = true
      ..permissions.transaction.createTransaction = true
      ..permissions.transaction.updateTransaction = true
      ..permissions.supplier = StoreSupplierPermission()
      ..permissions.supplier.readSupplier = true
      ..permissions.supplier.createSupplier = true
      ..permissions.supplier.updateSupplier = true
      ..permissions.supplier.deleteSupplier = true
      ..permissions.report = StoreReportPermission()
      ..permissions.report.readReport = true,
  ],
  CollectionName.suppliers: <Supplier>[
    Supplier()
      ..refId = 'SUP-001'
      ..name = 'Supply Co'
      ..description = 'Wholesale supplier for electronics'
      ..logoLinkId = 'media-logo-013'
      ..externalLinksIds.addAll(['link-021'])
      ..storeIds.addAll(['STR-001']),
  ],
  CollectionName.users: fakeUsers,
  CollectionName.globalProducts: <GlobalProduct>[
    GlobalProduct()
      ..refId = 'global-PRD-001'
      ..name = Internationalized(fr: 'Telephone', en: 'Smartphone')
      ..description = Internationalized(
        en: 'Latest model smartphone',
        fr: 'Dernier modèle de smartphone',
      )
      ..barCodeValue = '1234567890123'
      ..categories.addAll(<Category>[fakeCategories.first])
      ..imagesLinksIds.addAll(['media-image-001']),
    GlobalProduct()
      ..refId = 'global-PRD-002'
      ..name = Internationalized(fr: 'Laptop', en: 'Laptop')
      ..description = Internationalized(
        en: 'Latest model laptop',
        fr: 'Dernier modèle de laptop',
      )
      ..barCodeValue = '1234567890123'
      ..categories.addAll(<Category>[fakeCategories.first])
      ..imagesLinksIds.addAll(['media-image-002']),
    GlobalProduct()
      ..refId = 'global-product-003'
      ..name = Internationalized(fr: 'Tablette', en: 'Tablet')
      ..description = Internationalized(
        en: 'Latest model tablet',
        fr: 'Dernier modèle de tablet',
      )
      ..barCodeValue = '1234567890123'
      ..categories.addAll(<Category>[fakeCategories.first])
      ..imagesLinksIds.addAll(['media-image-003']),
    GlobalProduct()
      ..refId = 'global-product-004'
      ..name = Internationalized(fr: 'TV', en: 'TV')
      ..description = Internationalized(
        en: 'Latest model TV',
        fr: 'Dernier modèle de TV',
      )
      ..barCodeValue = '1234567890123'
      ..categories.addAll(<Category>[fakeCategories.first])
      ..imagesLinksIds.addAll(['media-image-004']),
  ],
  CollectionName.storeProducts: <StoreProduct>[
    StoreProduct()
      ..refId = 'PRD-001'
      ..storeId = 'STR-001'
      ..globalProductId = 'global-PRD-001'
      ..status = ProductStatus.PRODUCT_STATUS_ACTIVE
      ..salePrice = 10000
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2024-09-01T08:00:00Z'),
      ),
    StoreProduct()
      ..refId = 'PRD-002'
      ..storeId = 'STR-001'
      ..globalProductId = 'global-PRD-002'
      ..status = ProductStatus.PRODUCT_STATUS_INACTIVE
      ..salePrice = 7500
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2024-09-01T08:00:00Z'),
      ),
    StoreProduct()
      ..refId = 'product-004'
      ..storeId = 'STR-001'
      ..globalProductId = 'global-product-003'
      ..status = ProductStatus.PRODUCT_STATUS_ACTIVE
      ..salePrice = 1500
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2024-09-01T08:00:00Z'),
      ),
    StoreProduct()
      ..refId = 'product-003'
      ..storeId = 'STR-001'
      ..globalProductId = 'global-product-004'
      ..status = ProductStatus.PRODUCT_STATUS_ACTIVE
      ..salePrice = 12500
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2024-09-01T08:00:00Z'),
      ),
  ],
  CollectionName.categories: fakeCategories,
  CollectionName.payments: <Payment>[
    Payment()
      ..refId = 'PAY-2025-001'
      ..payerId = 'USR-001'
      ..warehouseId = 'BSN-001'
      ..amount = 10000
      ..currency = 'USD'
      ..paymentMethod = PaymentMethod.PAYMENT_METHOD_CASH
      ..status = PaymentStatus.PAYMENT_STATUS_COMPLETED
      ..paymentDate = Timestamp.fromDateTime(DateTime.now())
      ..referenceNumber = 'REF-001'
      ..createdByUserId = 'USR-001'
      ..notes = 'Test payment',
  ],
  CollectionName.giftVouchers: <GiftVoucher>[
    GiftVoucher()
      ..refId = 'GV-2025-001'
      ..voucherCode = 'GIFT-001'
      ..initialValue = 5000
      ..remainingValue = 5000
      ..currency = 'USD'
      ..issuedToCustomer = 'USR-001'
      ..issuedByUserId = 'USR-001'
      ..status = VoucherStatus.VOUCHER_STATUS_ACTIVE
      ..issuedAt = Timestamp.fromDateTime(DateTime.now())
      ..validUntil = Timestamp.fromDateTime(
        DateTime.now().add(const Duration(days: 365)),
      )
      ..notes = 'Test voucher',
  ],
  CollectionName.voucherTransactions: <VoucherTransaction>[
    VoucherTransaction()
      ..refId = 'VT-001'
      ..voucherId = 'GV-2025-001'
      ..relatedInvoiceId = 'INV-001'
      ..relatedReceiptId = ''
      ..amountUsed = 5000
      ..remainingAfter = 5000
      ..usedAt = Timestamp.fromDateTime(DateTime.now())
      ..usedByUserId = 'USR-001',
  ],
  CollectionName.cashReceipts: <CashReceipt>[
    CashReceipt()
      ..refId = 'CASH-2025-001'
      ..cashierUserId = 'USR-001'
      ..customer = 'user-002'
      ..storeId = 'STR-001'
      ..items.addAll(<InvoiceLineItem>[
        InvoiceLineItem()
          ..productId = 'PRD-001'
          ..quantity = 1
          ..unitPrice = 10000
          ..productName = Internationalized(en: 'Test Item', fr: 'Test Item'),
      ])
      ..subtotal = 10000
      ..taxAmount = 0
      ..totalAmount = 10000
      ..amountPaid = 10000
      ..changeGiven = 0
      ..currency = 'USD'
      ..paymentIds.addAll(['PAY-2025-001'])
      ..transactionTime = Timestamp.fromDateTime(DateTime.now())
      ..notes = 'Test receipt',
  ],
  CollectionName.purchaseOrders: <PurchaseOrder>[
    PurchaseOrder()
      ..refId = 'PO-2025-001'
      ..supplierId = 'SUP-001'
      ..storeId = 'STR-001'
      ..status = PurchaseOrderStatus.PO_STATUS_PENDING
      ..totalAmount = 25000
      ..items.addAll([
        PurchaseOrderLineItems()
          ..productId = 'PRD-001'
          ..quantityOrdered = 1
          ..unitPrice = 10000
          ..total = 10000,
        PurchaseOrderLineItems()
          ..productId = 'PRD-002'
          ..quantityOrdered = 1
          ..unitPrice = 15000
          ..total = 15000,
      ])
      ..createdAt = Timestamp.fromDateTime(DateTime.now())
      ..createdByUserId = 'USR-001'
      ..notes = 'Initial purchase order',
    PurchaseOrder()
      ..refId = 'PO-2025-002'
      ..supplierId = 'SUP-001'
      ..storeId = 'STR-001'
      ..status = PurchaseOrderStatus.PO_STATUS_CLOSED
      ..totalAmount = 5000
      ..items.addAll([
        PurchaseOrderLineItems()
          ..productId = 'product-003'
          ..quantityOrdered = 1
          ..unitPrice = 5000
          ..total = 5000,
      ])
      ..createdAt = Timestamp.fromDateTime(
        DateTime.now().subtract(const Duration(days: 5)),
      )
      ..createdByUserId = 'USR-001'
      ..notes = 'Received order',
  ],
  CollectionName.resourceLinks: fakeResourceLinks,
};
