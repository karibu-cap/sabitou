import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../utils/app_constants.dart';

final fakeUsers = <User>[
  User()
    ..refId = 'user-001'
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

final fakeCategories = <Category>[
  Category()
    ..refId = 'category-001'
    ..name = Internationalized(fr: 'Electronics', en: 'Electronics')
    ..businessId = 'business-001'
    ..createdAt = Timestamp.fromDateTime(DateTime.parse('2025-09-01T10:00:00Z'))
    ..updatedAt = Timestamp.fromDateTime(
      DateTime.parse('2025-09-01T10:00:00Z'),
    ),
];

/// Fake data for testing
final fakeData = <String, List<dynamic>>{
  CollectionName.stores: <Store>[
    Store()
      ..refId = 'store-001'
      ..name = 'Main Store'
      ..description = 'Primary retail location for electronics and home goods'
      ..logoLinkId = 'media-logo-001'
      ..externalLinksIds = 'link-001,link-002'
      ..businessId = 'business-001',
  ],
  CollectionName.businesses: <Business>[
    Business()
      ..refId = 'business-001'
      ..name = 'Tech Corp'
      ..description = 'Technology solutions provider'
      ..status = BusinessStatusType.BUSINESS_STATUS_TYPE_ACTIVE
      ..ownerId = 'user-001'
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
      ..user = fakeUsers.first
      ..businessId = 'business-001'
      ..memberSince = Timestamp.fromDateTime(
        DateTime.parse('2023-01-01T00:00:00Z'),
      ),
  ],
  CollectionName.storeMembers: <StoreMember>[
    StoreMember()
      ..user = fakeUsers.first
      ..storeId = 'store-001'
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
      ..refId = 'supplier-001'
      ..name = 'Supply Co'
      ..description = 'Wholesale supplier for electronics'
      ..logoLinkId = 'media-logo-013'
      ..externalLinksIds.addAll(['link-021'])
      ..storeIds.addAll(['store-001']),
  ],
  CollectionName.users: fakeUsers,
  CollectionName.globalProducts: <GlobalProduct>[
    GlobalProduct()
      ..refId = 'global-product-001'
      ..name = Internationalized(fr: 'Telephone', en: 'Smartphone')
      ..description = Internationalized(
        en: 'Latest model smartphone',
        fr: 'Dernier modèle de smartphone',
      )
      ..barCodeValue = '1234567890123'
      ..categories.addAll(<Category>[fakeCategories.first])
      ..imagesLinksIds.addAll(['media-image-001']),
    GlobalProduct()
      ..refId = 'global-product-002'
      ..name = Internationalized(fr: 'Laptop', en: 'Laptop')
      ..description = Internationalized(
        en: 'Latest model laptop',
        fr: 'Dernier modèle de laptop',
      )
      ..barCodeValue = '1234567890123'
      ..categories.addAll(<Category>[fakeCategories.first])
      ..imagesLinksIds.addAll(['media-image-001']),
    GlobalProduct()
      ..refId = 'global-product-003'
      ..name = Internationalized(fr: 'Tablette', en: 'Tablet')
      ..description = Internationalized(
        en: 'Latest model tablet',
        fr: 'Dernier modèle de tablet',
      )
      ..barCodeValue = '1234567890123'
      ..categories.addAll(<Category>[fakeCategories.first])
      ..imagesLinksIds.addAll(['media-image-001']),
    GlobalProduct()
      ..refId = 'global-product-004'
      ..name = Internationalized(fr: 'TV', en: 'TV')
      ..description = Internationalized(
        en: 'Latest model TV',
        fr: 'Dernier modèle de TV',
      )
      ..barCodeValue = '1234567890123'
      ..categories.addAll(<Category>[fakeCategories.first])
      ..imagesLinksIds.addAll(['media-image-001']),
  ],
  CollectionName.storeProducts: <StoreProduct>[
    StoreProduct()
      ..refId = 'product-001'
      ..storeId = 'store-001'
      ..globalProductId = 'global-product-001'
      ..salePrice = 10000
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2024-09-01T08:00:00Z'),
      ),
    StoreProduct()
      ..refId = 'product-002'
      ..storeId = 'store-001'
      ..globalProductId = 'global-product-002'
      ..salePrice = 7500
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2024-09-01T08:00:00Z'),
      ),
    StoreProduct()
      ..refId = 'product-002'
      ..storeId = 'store-001'
      ..globalProductId = 'global-product-003'
      ..salePrice = 1500
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2024-09-01T08:00:00Z'),
      ),
    StoreProduct()
      ..refId = 'product-003'
      ..storeId = 'store-001'
      ..globalProductId = 'global-product-004'
      ..salePrice = 12500
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2024-09-01T08:00:00Z'),
      ),
  ],
  CollectionName.categories: fakeCategories,
  CollectionName.payments: <Payment>[
    Payment()
      ..documentId = 'PAY-2025-001'
      ..payerId = 'user-001'
      ..payeeId = 'business-001'
      ..amount = 10000
      ..currency = 'USD'
      ..paymentMethod = PaymentMethod.PAYMENT_METHOD_CASH
      ..status = PaymentStatus.PAYMENT_STATUS_COMPLETED
      ..relatedInvoiceId = 'INV-001'
      ..paymentDate = Timestamp.fromDateTime(DateTime.now())
      ..referenceNumber = 'REF-001'
      ..createdByUserId = 'user-001'
      ..notes = 'Test payment',
  ],
  CollectionName.giftVouchers: <GiftVoucher>[
    GiftVoucher()
      ..documentId = 'GV-2025-001'
      ..voucherCode = 'GIFT-001'
      ..initialValue = 5000
      ..remainingValue = 5000
      ..currency = 'USD'
      ..issuedToCustomerId = 'user-001'
      ..issuedByUserId = 'user-001'
      ..status = VoucherStatus.VOUCHER_STATUS_ACTIVE
      ..issuedAt = Timestamp.fromDateTime(DateTime.now())
      ..validUntil = Timestamp.fromDateTime(
        DateTime.now().add(const Duration(days: 365)),
      )
      ..notes = 'Test voucher',
  ],
  CollectionName.voucherTransactions: <VoucherTransaction>[
    VoucherTransaction()
      ..documentId = 'VT-001'
      ..voucherId = 'GV-2025-001'
      ..relatedInvoiceId = 'INV-001'
      ..relatedReceiptId = ''
      ..amountUsed = 5000
      ..remainingAfter = 5000
      ..usedAt = Timestamp.fromDateTime(DateTime.now())
      ..usedByUserId = 'user-001',
  ],
  CollectionName.cashReceipts: <CashReceipt>[
    CashReceipt()
      ..documentId = 'CASH-2025-001'
      ..cashierUserId = 'user-001'
      ..customerId = 'user-002'
      ..storeId = 'store-001'
      ..items.addAll(<InvoiceLineItem>[
        InvoiceLineItem()
          ..productId = 'product-001'
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
};
