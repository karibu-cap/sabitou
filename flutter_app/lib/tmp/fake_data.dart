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
      ConnectedAccount()
        ..provider = ProviderType.PROVIDER_TYPE_FIREBASE_EMAIL
        ..rawData = '{}',
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

  User()
    ..refId = 'user-002'
    ..userName = 'inactive_user'
    ..connectedAccounts.addAll([
      ConnectedAccount()
        ..provider = ProviderType.PROVIDER_TYPE_INTERNAL_BUSINESS_AUTH
        ..rawData = '{"business": "business-002"}',
    ])
    ..email = 'inactive@example.com'
    ..firstName = 'Inactive'
    ..lastName = 'User'
    ..profileLink = ResourceLink(
      refId: 'link-029',
      targetUri: 'https://profile.example.com/inactive',
      iconUri: 'https://icon.example.com/inactive',
      info: 'Inactive Profile',
      label: 'Profile',
    )
    ..accountStatus = AccountStatusType.ACCOUNT_STATUS_TYPE_DELETED
    ..requiredActions.addAll([AuthActionType.AUTH_ACTION_TYPE_RESET_PASSWORD]),
  User()
    ..refId = 'user-003'
    ..userName = 'regular_user'
    ..connectedAccounts.addAll([
      ConnectedAccount()
        ..provider = ProviderType.PROVIDER_TYPE_GOOGLE
        ..rawData = '{"sub": "67890"}',
    ])
    ..phoneNumber = '+9876543210'
    ..firstName = 'Regular'
    ..lastName = 'User'
    ..accountStatus = AccountStatusType.ACCOUNT_STATUS_TYPE_ACTIVE
    ..requiredActions.addAll([
      AuthActionType.AUTH_ACTION_TYPE_VERIFY_PHONE_NUMBER,
    ]),
  User()
    ..refId = 'user-004'
    ..userName = 'test_user'
    ..connectedAccounts.addAll([
      ConnectedAccount()
        ..provider = ProviderType.PROVIDER_TYPE_UNSPECIFIED
        ..rawData = '{}',
      ConnectedAccount()
        ..provider = ProviderType.PROVIDER_TYPE_FIREBASE_EMAIL
        ..rawData = '{}',
    ])
    ..email = 'test@example.com'
    ..phoneNumber = '+1122334455'
    ..firstName = 'Test'
    ..lastName = 'User'
    ..profileLink = ResourceLink(
      refId: 'link-029',
      targetUri: 'https://profile.example.com/test',
      iconUri: 'https://icon.example.com/test',
      info: 'Test Profile',
      label: 'Profile',
    )
    ..accountStatus = AccountStatusType.ACCOUNT_STATUS_TYPE_ACTIVE
    ..requiredActions.addAll([
      AuthActionType.AUTH_ACTION_TYPE_INITIALIZE_PASSWORD,
      AuthActionType.AUTH_ACTION_TYPE_VERIFY_EMAIL,
    ]),
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
  Category()
    ..refId = 'category-002'
    ..name = Internationalized(fr: 'TVs', en: 'TVs')
    ..businessId = 'business-001'
    ..parentCategoryId = 'category-001'
    ..createdAt = Timestamp.fromDateTime(DateTime.parse('2025-09-01T10:15:00Z'))
    ..updatedAt = Timestamp.fromDateTime(
      DateTime.parse('2025-09-01T10:15:00Z'),
    ),
  Category()
    ..refId = 'category-003'
    ..name = Internationalized(fr: 'Smart TVs', en: 'Smart TVs')
    ..businessId = 'business-001'
    ..parentCategoryId = 'category-002'
    ..createdAt = Timestamp.fromDateTime(DateTime.parse('2025-09-01T10:30:00Z'))
    ..updatedAt = Timestamp.fromDateTime(
      DateTime.parse('2025-09-01T10:30:00Z'),
    ),
  Category()
    ..refId = 'category-004'
    ..name = Internationalized(fr: 'Laptops', en: 'Laptops')
    ..businessId = 'business-001'
    ..parentCategoryId = 'category-001'
    ..createdAt = Timestamp.fromDateTime(DateTime.parse('2025-09-01T11:00:00Z'))
    ..updatedAt = Timestamp.fromDateTime(
      DateTime.parse('2025-09-01T11:00:00Z'),
    ),
  Category()
    ..refId = 'category-005'
    ..name = Internationalized(fr: 'Clothing', en: 'Clothing')
    ..businessId = 'business-002'
    ..createdAt = Timestamp.fromDateTime(DateTime.parse('2025-09-02T09:00:00Z'))
    ..updatedAt = Timestamp.fromDateTime(
      DateTime.parse('2025-09-02T09:00:00Z'),
    ),
  Category()
    ..refId = 'category-006'
    ..name = Internationalized(fr: 'Men’s Clothing', en: 'Men’s Clothing')
    ..businessId = 'business-002'
    ..parentCategoryId = 'category-005'
    ..createdAt = Timestamp.fromDateTime(DateTime.parse('2025-09-02T09:15:00Z'))
    ..updatedAt = Timestamp.fromDateTime(
      DateTime.parse('2025-09-02T09:15:00Z'),
    ),
  Category()
    ..refId = 'category-007'
    ..name = Internationalized(fr: 'Suits', en: 'Suits')
    ..businessId = 'business-002'
    ..parentCategoryId = 'category-006'
    ..createdAt = Timestamp.fromDateTime(DateTime.parse('2025-09-02T09:30:00Z'))
    ..updatedAt = Timestamp.fromDateTime(
      DateTime.parse('2025-09-02T09:30:00Z'),
    ),
  Category()
    ..refId = 'category-008'
    ..name = Internationalized(fr: 'Women’s Clothing', en: 'Women’s Clothing')
    ..businessId = 'business-002'
    ..parentCategoryId = 'category-005'
    ..createdAt = Timestamp.fromDateTime(DateTime.parse('2025-09-02T10:00:00Z'))
    ..updatedAt = Timestamp.fromDateTime(
      DateTime.parse('2025-09-02T10:00:00Z'),
    ),
  Category()
    ..refId = 'category-009'
    ..name = Internationalized(fr: 'Dresses', en: 'Dresses')
    ..businessId = 'business-002'
    ..parentCategoryId = 'category-008'
    ..createdAt = Timestamp.fromDateTime(DateTime.parse('2025-09-02T10:15:00Z'))
    ..updatedAt = Timestamp.fromDateTime(
      DateTime.parse('2025-09-02T10:15:00Z'),
    ),
  Category()
    ..refId = 'category-010'
    ..name = Internationalized(fr: 'Entertainment', en: 'Entertainment')
    ..businessId = 'business-002'
    ..createdAt = Timestamp.fromDateTime(DateTime.parse('2025-09-02T10:30:00Z'))
    ..updatedAt = Timestamp.fromDateTime(
      DateTime.parse('2025-09-02T10:30:00Z'),
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
    Store()
      ..refId = 'store-002'
      ..name = 'Warehouse'
      ..description = 'Storage and distribution center'
      ..logoLinkId = 'media-logo-002'
      ..externalLinksIds = 'link-003'
      ..businessId = 'business-002',
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
      ..externalLinksIds.addAll(['link-010', 'link-011'])
      ..address = '123 Tech Street, Tech City'
      ..email = 'techcorp@example.com'
      ..contactInfo = '123-456-7890',
    Business()
      ..refId = 'business-002'
      ..name = 'Food Inc'
      ..description = 'Food and beverage distributor'
      ..status = BusinessStatusType.BUSINESS_STATUS_TYPE_INACTIVE
      ..ownerId = 'user-002'
      ..logoLinkId = 'media-logo-007'
      ..countryCode = 'GB'
      ..currencyCode = 'GBP'
      ..externalLinksIds.addAll(['link-012'])
      ..address = '456 Food Street, Food City'
      ..email = 'foodinc@example.com'
      ..contactInfo = '987-654-3210',
  ],
  CollectionName.businessMembers: <BusinessMember>[
    BusinessMember()
      ..user = fakeUsers.first
      ..businessId = 'business-001'
      ..permissions.addAll([
        BusinessPermission()
          ..resourceType = BusinessResourceType.BUSINESS_RESOURCE_TYPE_BUSINESS
          ..actionType = ResourceActionType.RESOURCE_ACTION_TYPE_REMOVE,
      ])
      ..memberSince = Timestamp.fromDateTime(
        DateTime.parse('2023-01-01T00:00:00Z'),
      ),
  ],
  CollectionName.storeMembers: <StoreMember>[
    StoreMember()
      ..user = fakeUsers.first
      ..storeId = 'store-001'
      ..permissions.addAll([
        StorePermission()
          ..resourceType = StoreResourceType.STORE_RESOURCE_TYPE_STORE
          ..actionType = ResourceActionType.RESOURCE_ACTION_TYPE_REMOVE,
      ])
      ..memberSince = Timestamp.fromDateTime(
        DateTime.parse('2023-01-01T00:00:00Z'),
      ),
  ],
  CollectionName.suppliers: <Supplier>[
    Supplier()
      ..refId = 'supplier-001'
      ..name = 'Supply Co'
      ..description = 'Wholesale supplier for electronics'
      ..logoLinkId = 'media-logo-013'
      ..externalLinksIds.addAll(['link-021'])
      ..storeIds.addAll(['store-001', 'store-002']),
    Supplier()
      ..refId = 'supplier-002'
      ..name = 'Parts Inc'
      ..description = 'Component parts provider'
      ..externalLinksIds.addAll(['link-022', 'link-023'])
      ..storeIds.addAll(['store-001', 'store-002']),
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
      ..imagesLinksIds.addAll(['media-image-001', 'media-image-002']),
    GlobalProduct()
      ..refId = 'global-product-002'
      ..name = Internationalized(en: 'Apple', fr: 'Pomme')
      ..description = Internationalized(
        en: 'Fresh red apple',
        fr: 'Pomme rouge fraîche',
      )
      ..barCodeValue = '9876543210987'
      ..categories.addAll(<Category>[fakeCategories[1]])
      ..imagesLinksIds.addAll(['media-image-003']),
    GlobalProduct()
      ..refId = 'global-product-003'
      ..name = Internationalized(en: 'T-Shirt', fr: 'T-Shirt')
      ..description = Internationalized(
        en: 'Cotton t-shirt',
        fr: 'Chemise en coton',
      )
      ..categories.addAll(<Category>[fakeCategories[2]])
      ..imagesLinksIds.addAll([]),
    GlobalProduct()
      ..refId = 'global-product-004'
      ..name = Internationalized(en: 'TV', fr: 'TV')
      ..description = Internationalized(en: '4K Smart TV', fr: 'TV 4K Smart')
      ..barCodeValue = '1112223334445'
      ..categories.addAll(<Category>[fakeCategories[3], fakeCategories[5]])
      ..imagesLinksIds.addAll(['media-image-004', 'media-image-005']),
    GlobalProduct()
      ..refId = 'global-product-005'
      ..name = Internationalized(en: 'Sofa', fr: 'Canapé')
      ..description = Internationalized(
        en: 'Comfortable leather sofa',
        fr: 'Canapé en cuir confortable',
      )
      ..barCodeValue = '5556667778889'
      ..categories.addAll(<Category>[fakeCategories[4]])
      ..imagesLinksIds.addAll(['media-image-006']),
    GlobalProduct()
      ..refId = 'global-product-006'
      ..name = Internationalized(en: 'Home Cinema', fr: 'Cinéma à la maison')
      ..description = Internationalized(
        en: 'Surround sound home cinema system',
        fr: 'Système de cinéma à la maison avec son surround',
      )
      ..barCodeValue = '9990001112223'
      ..categories.addAll(<Category>[fakeCategories.first, fakeCategories[1]])
      ..imagesLinksIds.addAll(['media-image-007']),
    GlobalProduct()
      ..refId = 'global-product-007'
      ..name = Internationalized(en: 'Milk', fr: 'Lait')
      ..description = Internationalized(
        en: 'Fresh whole milk',
        fr: 'Lait entier frais',
      )
      ..categories.addAll(<Category>[fakeCategories[3], fakeCategories[2]])
      ..imagesLinksIds.addAll(['media-image-008']),
    GlobalProduct()
      ..refId = 'global-product-008'
      ..name = Internationalized(en: 'Chips', fr: 'Chips')
      ..description = Internationalized(
        en: 'Potato chips snack',
        fr: 'Snack de chips de patate',
      )
      ..barCodeValue = '7778889990001'
      ..categories.addAll(<Category>[fakeCategories[2]])
      ..imagesLinksIds.addAll(['media-image-009', 'media-image-010']),
    GlobalProduct()
      ..refId = 'global-product-009'
      ..name = Internationalized(en: 'Laptop', fr: 'Ordinateur portable')
      ..description = Internationalized(
        en: 'High-performance laptop',
        fr: 'Ordinateur portable de haute performance',
      )
      ..categories.addAll(<Category>[fakeCategories.first])
      ..imagesLinksIds.addAll(['media-image-011']),
    GlobalProduct()
      ..refId = 'global-product-010'
      ..name = Internationalized(en: 'Refrigerator', fr: 'Réfrigérateur')
      ..description = Internationalized(
        en: 'Energy-efficient fridge',
        fr: 'Réfrigérateur à efficacité énergétique',
      )
      ..barCodeValue = '2223334445556'
      ..categories.addAll(<Category>[fakeCategories[5]])
      ..imagesLinksIds.addAll(['media-image-011']),
    GlobalProduct()
      ..refId = 'global-product-011'
      ..name = Internationalized(en: 'Coffee Table', fr: 'Table de café')
      ..description = Internationalized(
        en: 'Wooden coffee table',
        fr: 'Table de café en bois',
      )
      ..categories.addAll(<Category>[fakeCategories[4]])
      ..imagesLinksIds.addAll(['media-image-011']),
  ],
  CollectionName.storeProducts: <StoreProduct>[
    StoreProduct()
      ..refId = 'product-001'
      ..storeId = 'store-001'
      ..globalProductId = 'global-product-001'
      ..salePrice = 10000
      ..stockQuantity = 100
      ..minStockThreshold = 10
      ..expirationDate = Timestamp.fromDateTime(
        DateTime.parse('2024-09-01T08:00:00Z'),
      )
      ..supplierId = 'supplier-001'
      ..imagesLinksIds.addAll(['media-image-012'])
      ..supplierId = 'supplier-001'
      ..costPrice = 5000
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2024-09-01T08:00:00Z'),
      ),
    StoreProduct()
      ..refId = 'product-002'
      ..storeId = 'store-002'
      ..globalProductId = 'global-product-002'
      ..salePrice = 100
      ..stockQuantity = 4
      ..minStockThreshold = 8
      ..expirationDate = Timestamp.fromDateTime(
        DateTime.parse('2024-09-01T08:00:00Z'),
      )
      ..supplierId = 'supplier-002'
      ..imagesLinksIds.addAll(['media-image-013'])
      ..supplierId = 'supplier-002'
      ..costPrice = 25
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2024-09-01T08:00:00Z'),
      ),
    StoreProduct()
      ..refId = 'product-003'
      ..storeId = 'store-001'
      ..globalProductId = 'global-product-003'
      ..salePrice = 1500
      ..stockQuantity = 8
      ..minStockThreshold = 10
      ..expirationDate = Timestamp.fromDateTime(
        DateTime.parse('2024-09-01T08:00:00Z'),
      )
      ..supplierId = 'supplier-003'
      ..imagesLinksIds.addAll([])
      ..supplierId = 'supplier-003'
      ..costPrice = 1000
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2024-09-01T08:00:00Z'),
      ),
    StoreProduct()
      ..refId = 'product-004'
      ..storeId = 'store-001'
      ..globalProductId = 'global-product-004'
      ..salePrice = 49999
      ..stockQuantity = 20
      ..minStockThreshold = 30
      ..expirationDate = Timestamp.fromDateTime(
        DateTime.parse('2024-09-01T08:00:00Z'),
      )
      ..supplierId = 'supplier-004'
      ..imagesLinksIds.addAll(['media-image-014', 'media-image-015'])
      ..supplierId = 'supplier-004'
      ..costPrice = 25000
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2024-09-01T08:00:00Z'),
      ),
    StoreProduct()
      ..refId = 'product-005'
      ..storeId = 'store-004'
      ..globalProductId = 'global-product-005'
      ..salePrice = 29999
      ..stockQuantity = 15
      ..minStockThreshold = 10
      ..expirationDate = Timestamp.fromDateTime(
        DateTime.parse('2024-09-01T08:00:00Z'),
      )
      ..supplierId = 'supplier-005'
      ..imagesLinksIds.addAll(['media-image-016'])
      ..supplierId = 'supplier-005'
      ..costPrice = 15000
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2024-09-01T08:00:00Z'),
      ),
    StoreProduct()
      ..refId = 'product-006'
      ..storeId = 'store-001'
      ..globalProductId = 'global-product-006'
      ..salePrice = 19999
      ..stockQuantity = 40
      ..minStockThreshold = 10
      ..expirationDate = Timestamp.fromDateTime(
        DateTime.parse('2024-09-01T08:00:00Z'),
      )
      ..supplierId = 'supplier-004'
      ..imagesLinksIds.addAll(['media-image-017'])
      ..supplierId = 'supplier-004'
      ..costPrice = 15000
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2024-09-01T08:00:00Z'),
      ),
    StoreProduct()
      ..refId = 'product-007'
      ..storeId = 'store-002'
      ..globalProductId = 'global-product-007'
      ..salePrice = 299
      ..stockQuantity = 10
      ..minStockThreshold = 8
      ..expirationDate = Timestamp.fromDateTime(
        DateTime.parse('2026-09-01T08:00:00Z'),
      )
      ..supplierId = 'supplier-007'
      ..imagesLinksIds.addAll([])
      ..supplierId = 'supplier-007'
      ..costPrice = 200
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2024-09-01T08:00:00Z'),
      ),
    StoreProduct()
      ..refId = 'product-008'
      ..storeId = 'store-003'
      ..globalProductId = 'global-product-008'
      ..salePrice = 199
      ..stockQuantity = 10
      ..minStockThreshold = 8
      ..expirationDate = Timestamp.fromDateTime(
        DateTime.parse('2026-09-01T08:00:00Z'),
      )
      ..supplierId = 'supplier-008'
      ..imagesLinksIds.addAll(['media-image-018'])
      ..supplierId = 'supplier-008'
      ..costPrice = 100
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2024-09-01T08:00:00Z'),
      ),
    StoreProduct()
      ..refId = 'product-009'
      ..storeId = 'store-005'
      ..globalProductId = 'global-product-009'
      ..salePrice = 129999
      ..stockQuantity = 100
      ..minStockThreshold = 10
      ..expirationDate = Timestamp.fromDateTime(
        DateTime.parse('2024-09-01T08:00:00Z'),
      )
      ..supplierId = 'supplier-009'
      ..imagesLinksIds.addAll(['media-image-019'])
      ..supplierId = 'supplier-009'
      ..costPrice = 100
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2024-09-01T08:00:00Z'),
      ),
    StoreProduct()
      ..refId = 'product-010'
      ..storeId = 'store-004'
      ..globalProductId = 'global-product-010'
      ..salePrice = 39999
      ..stockQuantity = 100
      ..minStockThreshold = 10
      ..expirationDate = Timestamp.fromDateTime(
        DateTime.parse('2027-09-01T08:00:00Z'),
      )
      ..supplierId = 'supplier-0010'
      ..imagesLinksIds.addAll(['media-image-020'])
      ..supplierId = 'supplier-0010'
      ..costPrice = 100
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2024-09-01T08:00:00Z'),
      ),
    StoreProduct()
      ..refId = 'product-011'
      ..storeId = 'store-004'
      ..globalProductId = 'global-product-011'
      ..salePrice = 9999
      ..stockQuantity = 100
      ..minStockThreshold = 10
      ..expirationDate = Timestamp.fromDateTime(
        DateTime.parse('2025-09-30T08:00:00Z'),
      )
      ..supplierId = 'supplier-0011'
      ..imagesLinksIds.addAll(['media-image-020'])
      ..supplierId = 'supplier-0011'
      ..costPrice = 100
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2024-09-01T08:00:00Z'),
      ),
    StoreProduct()
      ..refId = 'product-012'
      ..storeId = 'store-002'
      ..globalProductId = 'global-product-011'
      ..salePrice = 399
      ..stockQuantity = 10
      ..minStockThreshold = 8
      ..expirationDate = Timestamp.fromDateTime(
        DateTime.parse('2026-09-01T08:00:00Z'),
      )
      ..supplierId = 'supplier-0012'
      ..imagesLinksIds.addAll(['media-image-020'])
      ..supplierId = 'supplier-0012'
      ..costPrice = 100
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2024-09-01T08:00:00Z'),
      ),
    StoreProduct()
      ..refId = 'product-013'
      ..storeId = 'store-003'
      ..globalProductId = 'global-product-012'
      ..salePrice = 150
      ..stockQuantity = 10
      ..minStockThreshold = 8
      ..expirationDate = Timestamp.fromDateTime(
        DateTime.parse('2026-09-01T08:00:00Z'),
      )
      ..supplierId = 'supplier-0013'
      ..imagesLinksIds.addAll(['media-image-020'])
      ..supplierId = 'supplier-0013'
      ..costPrice = 100
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2024-09-01T08:00:00Z'),
      ),
  ],
  CollectionName.orders: <Order>[
    Order()
      ..refId = 'order-001'
      ..orderItems.addAll(<OrderItem>[
        OrderItem()
          ..storeProductId = 'product-001'
          ..quantity = 2
          ..unitPrice = 99999
          ..itemName = 'Smartphone',
        OrderItem()
          ..storeProductId = 'product-004'
          ..quantity = 1
          ..unitPrice = 49999
          ..itemName = '4K TV',
      ])
      ..orderPrices = OrderPrices(grandTotal: 249997)
      ..initiatedBy = 'user-001'
      ..statusHistory.addAll(<StatusHistory>[
        StatusHistory()
          ..status = OrderStatus.ORDER_STATUS_PENDING
          ..updatedAt = Timestamp.fromDateTime(
            DateTime.parse('2025-09-01T08:00:00Z'),
          ),
      ])
      ..storeId = 'store-001'
      ..initiatedBy = 'user-001'
      ..status = OrderStatus.ORDER_STATUS_PENDING
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2025-09-01T08:00:00Z'),
      )
      ..saleOrder = SaleOrder(
        commitmentDate: Timestamp.fromDateTime(
          DateTime.parse('2025-09-01T08:00:00Z'),
        ),
      )
      ..updatedAt = Timestamp.fromDateTime(
        DateTime.parse('2025-09-01T08:00:00Z'),
      ),

    Order()
      ..refId = 'order-002'
      ..orderItems.addAll(<OrderItem>[
        OrderItem()
          ..storeProductId = 'product-002'
          ..quantity = 10
          ..unitPrice = 100
          ..itemName = 'Apple',
        OrderItem()
          ..storeProductId = 'product-007'
          ..quantity = 5
          ..unitPrice = 299
          ..itemName = 'Milk',
      ])
      ..orderPrices = OrderPrices(grandTotal: 2495)
      ..initiatedBy = 'user-002'
      ..storeId = 'store-001'
      ..initiatedBy = 'user-002'
      ..statusHistory.addAll(<StatusHistory>[
        StatusHistory()
          ..status = OrderStatus.ORDER_STATUS_PENDING
          ..updatedAt = Timestamp.fromDateTime(
            DateTime.parse('2025-09-01T08:00:00Z'),
          ),
      ])
      ..status = OrderStatus.ORDER_STATUS_PROCESSING
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2025-09-01T08:00:00Z'),
      )
      ..saleOrder = SaleOrder(
        commitmentDate: Timestamp.fromDateTime(
          DateTime.parse('2025-09-01T08:00:00Z'),
        ),
        clientId: 'client-002',
      )
      ..updatedAt = Timestamp.fromDateTime(
        DateTime.parse('2025-09-01T08:00:00Z'),
      ),
    Order()
      ..refId = 'order-003'
      ..orderItems.addAll(<OrderItem>[
        OrderItem()
          ..storeProductId = 'product-005'
          ..quantity = 1
          ..unitPrice = 29999
          ..itemName = 'Sofa',
      ])
      ..orderPrices = OrderPrices(grandTotal: 29999)
      ..storeId = 'store-001'
      ..initiatedBy = 'user-003'
      ..statusHistory.addAll(<StatusHistory>[
        StatusHistory()
          ..status = OrderStatus.ORDER_STATUS_PENDING
          ..updatedAt = Timestamp.fromDateTime(
            DateTime.parse('2026-09-01T08:00:00Z'),
          ),
        StatusHistory()
          ..status = OrderStatus.ORDER_STATUS_COMPLETED
          ..updatedAt = Timestamp.fromDateTime(
            DateTime.parse('2026-09-01T08:00:00Z'),
          ),
      ])
      ..status = OrderStatus.ORDER_STATUS_COMPLETED
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2026-09-01T08:00:00Z'),
      )
      ..updatedAt = Timestamp.fromDateTime(
        DateTime.parse('2026-09-01T08:00:00Z'),
      ),
  ],
  CollectionName.invoices: <Invoice>[
    Invoice()
      ..refId = 'invoice-001'
      ..orderId = 'order-001'
      ..status = InvoiceStatus.INVOICE_STATUS_PAID
      ..orderItems.addAll([
        OrderItem()
          ..storeProductId = 'product-001'
          ..itemName = 'Smartphone'
          ..unitPrice = 99999
          ..quantity = 2,
        OrderItem()
          ..storeProductId = 'product-004'
          ..itemName = 'TV'
          ..unitPrice = 49999
          ..quantity = 1,
      ])
      ..payments.addAll([
        Payment(
          amount: 250997.0,
          method: PaymentMethod.PAYMENT_METHOD_CASH,
          timestamp: Timestamp.fromDateTime(
            DateTime.parse('2025-08-01T10:30:00Z'),
          ),
        ),
      ])
      ..totalDiscount = 0.0
      ..totalVat =
          1000.0 // 0.5% VAT on subtotal
      ..subtotal =
          249997.0 // (99999 * 2) + (49999 * 1)
      ..total =
          250997.0 // subtotal + totalVat - totalDiscount
      ..customerTenderedAmount = 260000.0
      ..changeGiven =
          9003.0 // customerTenderedAmount - total
      ..balanceDue =
          0.0 // Fully paid
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2025-08-01T10:00:00Z'),
      )
      ..deliveryDate = Timestamp.fromDateTime(
        DateTime.parse('2025-08-05T12:00:00Z'),
      ),

    // Invoice 2: Paid with card and voucher, pending refund
    Invoice()
      ..refId = 'invoice-002'
      ..orderId = 'order-002'
      ..status = InvoiceStatus.INVOICE_STATUS_PENDING_REFUND
      ..orderItems.addAll([
        OrderItem()
          ..storeProductId = 'product-002'
          ..itemName = 'Laptop'
          ..unitPrice = 150000
          ..quantity = 1,
        OrderItem()
          ..storeProductId = 'product-005'
          ..itemName = 'Headphones'
          ..unitPrice = 25000
          ..quantity = 2,
      ])
      ..payments.addAll([
        Payment(
          amount: 150000.0,
          method: PaymentMethod.PAYMENT_METHOD_CARD,
          referenceId: 'card-txn-12345',
          timestamp: Timestamp.fromDateTime(
            DateTime.parse('2025-08-02T14:00:00Z'),
          ),
        ),
        Payment(
          amount: 50000.0,
          method: PaymentMethod.PAYMENT_METHOD_VOUCHER,
          referenceId: 'voucher-789',
          timestamp: Timestamp.fromDateTime(
            DateTime.parse('2025-08-02T14:05:00Z'),
          ),
        ),
      ])
      ..totalDiscount =
          10000.0 // Promotional discount
      ..totalVat =
          9500.0 // 5% VAT on subtotal
      ..subtotal =
          200000.0 // (150000 * 1) + (25000 * 2)
      ..total =
          199500.0 // subtotal - totalDiscount + totalVat
      ..customerTenderedAmount =
          200000.0 // Sum of payments
      ..changeGiven =
          0.0 // Pending refund
      ..balanceDue =
          -500.0 // Overpaid, refund pending
      ..voucherId = 'voucher-789'
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2025-08-02T13:00:00Z'),
      )
      ..deliveryDate = Timestamp.fromDateTime(
        DateTime.parse('2025-08-07T15:00:00Z'),
      ),

    // Invoice 3: Partially paid with mobile money, balance due
    Invoice()
      ..refId = 'invoice-003'
      ..orderId = 'order-003'
      ..status = InvoiceStatus.INVOICE_STATUS_UNSPECIFIED
      ..orderItems.addAll([
        OrderItem()
          ..storeProductId = 'product-003'
          ..itemName = 'Tablet'
          ..unitPrice = 75000
          ..quantity = 3,
      ])
      ..payments.addAll([
        Payment(
          amount: 100000.0,
          method: PaymentMethod.PAYMENT_METHOD_ORANGE_MONEY,
          referenceId: 'om-txn-67890',
          timestamp: Timestamp.fromDateTime(
            DateTime.parse('2025-08-03T09:00:00Z'),
          ),
        ),
      ])
      ..totalDiscount = 5000.0
      ..totalVat =
          11250.0 // 5% VAT on subtotal
      ..subtotal =
          225000.0 // (75000 * 3)
      ..total =
          231250.0 // subtotal - totalDiscount + totalVat
      ..customerTenderedAmount = 100000.0
      ..changeGiven = 0.0
      ..balanceDue =
          131250.0 // total - customerTenderedAmount
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2025-08-03T08:00:00Z'),
      )
      ..deliveryDate = Timestamp.fromDateTime(
        DateTime.parse('2025-08-10T10:00:00Z'),
      ),
  ],
  CollectionName.vouchers: <Voucher>[
    Voucher()
      ..refId = 'voucher-789'
      ..orderId = 'order-001'
      ..invoiceId = 'invoice-001'
      ..storeId = 'store-001'
      ..amount = 50000.0
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2025-08-01T09:00:00Z'),
      )
      ..expiryDate = Timestamp.fromDateTime(
        DateTime.parse('2025-12-31T23:59:59Z'),
      )
      ..status = VoucherStatus.VOUCHER_STATUS_ISSUED
      ..additionalInfo = 'Promotional voucher for electronics purchase',

    Voucher()
      ..refId = 'voucher-790'
      ..orderId = 'order-002'
      ..invoiceId = 'invoice-002'
      ..storeId = 'store-002'
      ..amount = 50000.0
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2025-08-02T12:00:00Z'),
      )
      ..expiryDate = Timestamp.fromDateTime(
        DateTime.parse('2025-11-30T23:59:59Z'),
      )
      ..status = VoucherStatus.VOUCHER_STATUS_REDEEMED
      ..redeemedByReferenceId = 'invoice-002'
      ..redeemedAt = Timestamp.fromDateTime(
        DateTime.parse('2025-08-02T14:05:00Z'),
      )
      ..additionalInfo = 'Redeemed for laptop and headphones purchase',

    Voucher()
      ..refId = 'voucher-791'
      ..orderId = 'order-003'
      ..invoiceId = 'invoice-003'
      ..storeId = 'store-003'
      ..amount = 25000.0
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2025-07-01T08:00:00Z'),
      )
      ..expiryDate = Timestamp.fromDateTime(
        DateTime.parse('2025-08-01T23:59:59Z'),
      )
      ..status = VoucherStatus.VOUCHER_STATUS_EXPIRED
      ..additionalInfo = 'Expired promotional voucher for tablet purchase',
  ],
  CollectionName.stockInBounds: <StockInbound>[
    StockInbound()
      ..refId = 'inbound-001'
      ..inboundType = InboundType.INBOUND_TYPE_STOCK_IN
      ..quantity = 100
      ..quantityBefore = 50
      ..quantityAfter = 150
      ..unitCost = 5000
      ..supplierId = 'supplier-001'
      ..referenceNumber = 'PO-2025-001'
      ..batchNumber = 'BATCH-2025-001'
      ..batchExpiryDate = Timestamp.fromDateTime(
        DateTime.parse('2026-06-30T23:59:59Z'),
      )
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2025-09-01T08:00:00Z'),
      )
      ..performedBy = 'user-001',

    StockInbound()
      ..refId = 'inbound-002'
      ..inboundType = InboundType.INBOUND_TYPE_CUSTOMER_RETURN
      ..quantity = 5
      ..quantityBefore = 150
      ..quantityAfter = 155
      ..unitCost = 4500
      ..referenceNumber = 'RETURN-2025-001'
      ..reason = 'Defective product returned by customer'
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2025-09-05T14:00:00Z'),
      )
      ..performedBy = 'user-002',

    StockInbound()
      ..refId = 'inbound-003'
      ..inboundType = InboundType.INBOUND_TYPE_ADJUSTMENT
      ..quantity = -10
      ..quantityBefore = 155
      ..quantityAfter = 145
      ..unitCost = 5000
      ..reason = 'Stock count correction due to miscount'
      ..batchNumber = 'BATCH-2025-001'
      ..batchExpiryDate = Timestamp.fromDateTime(
        DateTime.parse('2026-06-30T23:59:59Z'),
      )
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2025-09-10T10:00:00Z'),
      )
      ..performedBy = 'user-003',

    StockInbound()
      ..refId = 'inbound-004'
      ..inboundType = InboundType.INBOUND_TYPE_STOCK_IN
      ..quantity = 200
      ..quantityBefore = 145
      ..quantityAfter = 345
      ..unitCost = 3000
      ..supplierId = 'supplier-002'
      ..referenceNumber = 'PO-2025-002'
      ..batchNumber = 'BATCH-2025-002'
      ..batchExpiryDate = Timestamp.fromDateTime(
        DateTime.parse('2026-12-31T23:59:59Z'),
      )
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2025-09-15T09:30:00Z'),
      )
      ..performedBy = 'user-004',

    StockInbound()
      ..refId = 'inbound-005'
      ..inboundType = InboundType.INBOUND_TYPE_CUSTOMER_RETURN
      ..quantity = 8
      ..quantityBefore = 345
      ..quantityAfter = 353
      ..unitCost = 4000
      ..referenceNumber = 'RETURN-2025-002'
      ..reason = 'Customer returned damaged headphones'
      ..batchNumber = 'BATCH-2025-003'
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2025-09-20T16:00:00Z'),
      )
      ..performedBy = 'user-005',

    StockInbound()
      ..refId = 'inbound-006'
      ..inboundType = InboundType.INBOUND_TYPE_ADJUSTMENT
      ..quantity = -15
      ..quantityBefore = 353
      ..quantityAfter = 338
      ..unitCost = 3500
      ..reason = 'Adjustment due to reported theft during inventory audit'
      ..batchNumber = 'BATCH-2025-002'
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2025-09-25T11:00:00Z'),
      )
      ..performedBy = 'user-006',

    StockInbound()
      ..refId = 'inbound-007'
      ..inboundType = InboundType.INBOUND_TYPE_STOCK_IN
      ..quantity = 500
      ..quantityBefore = 338
      ..quantityAfter = 838
      ..unitCost = 2000
      ..supplierId = 'supplier-003'
      ..referenceNumber = 'PO-2025-003'
      ..batchNumber = 'BATCH-2025-004'
      ..batchExpiryDate = Timestamp.fromDateTime(
        DateTime.parse('2027-03-31T23:59:59Z'),
      )
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2025-09-26T08:00:00Z'),
      )
      ..performedBy = 'user-001',

    StockInbound()
      ..refId = 'inbound-008'
      ..inboundType = InboundType.INBOUND_TYPE_CUSTOMER_RETURN
      ..quantity = 3
      ..quantityBefore = 838
      ..quantityAfter = 841
      ..unitCost = 6000
      ..referenceNumber = 'RETURN-2025-003'
      ..reason = 'Customer received wrong item'
      ..batchNumber = 'BATCH-2025-004'
      ..createdAt = Timestamp.fromDateTime(
        DateTime.parse('2025-09-26T12:00:00Z'),
      )
      ..performedBy = 'user-002',
  ],
  CollectionName.transactions: [
    {
      'ref_id': 'txn-001',
      'type': 'TRANSACTION_TYPE_PURCHASE',
      'status': 'TRANSACTION_STATUS_COMPLETED',
      'store_id': 'store-001',
      'order_id': 'order-001',
      'from_id': 'supplier-001',
      'amount': 15000000,
      'currency_code': 'XAF',
      'created_at': '2025-09-01T08:00:00Z',
      'updated_at': '2025-09-01T08:30:00Z',
      'description': 'Achat de 10 téléviseurs 4K auprès du fournisseur',
      'store_product_id': 'product-001',
      'quantity': 10,
      'initiated_by': 'user-001',
    },
    {
      'ref_id': 'txn-002',
      'type': 'TRANSACTION_TYPE_SALE',
      'status': 'TRANSACTION_STATUS_COMPLETED',
      'store_id': 'store-001',
      'order_id': 'order-002',
      'from_id': 'client-001',
      'amount': 250000,
      'currency_code': 'XAF',
      'created_at': '2025-09-01T09:00:00Z',
      'updated_at': '2025-09-01T09:30:00Z',
      'description': 'Vente de 2 téléviseurs 4K à un client',
      'store_product_id': 'product-001',
      'quantity': 2,
      'initiated_by': 'user-001',
    },
    {
      'ref_id': 'txn-003',
      'type': 'TRANSACTION_TYPE_ADJUSTMENT',
      'status': 'TRANSACTION_STATUS_COMPLETED',
      'store_id': 'store-001',
      'amount': 0,
      'currency_code': 'XAF',
      'created_at': '2025-09-01T10:00:00Z',
      'description': 'Ajustement pour 5 unités de lait endommagées',
      'store_product_id': 'product-002',
      'quantity': -5,
      'initiated_by': 'user-001',
    },
    {
      'ref_id': 'txn-004',
      'type': 'TRANSACTION_TYPE_REFUND',
      'status': 'TRANSACTION_STATUS_COMPLETED',
      'store_id': 'store-001',
      'amount': 50000,
      'currency_code': 'XAF',
      'created_at': '2025-09-01T11:00:00Z',
      'description': 'Remboursement partiel pour retour d’un téléviseur',
      'store_product_id': 'product-001',
      'quantity': 1,
      'initiated_by': 'user-001',
    },
    {
      'ref_id': 'txn-005',
      'type': 'TRANSACTION_TYPE_TRANSFER',
      'status': 'TRANSACTION_STATUS_COMPLETED',
      'store_id': 'store-001',
      'amount': 0,
      'currency_code': 'XAF',
      'created_at': '2025-09-01T12:00:00Z',
      'description': 'Transfert de 20 unités de lait vers store-002',
      'store_product_id': 'product-002',
      'quantity': -20,
      'initiated_by': 'user-001',
    },
  ],
  CollectionName.categories: fakeCategories,
};
