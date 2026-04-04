/// Defines the domain a file belongs to.
/// Used to determine compression strategy, bucket routing, and allowed types.
enum FileCategory {
  product,
  bill,
  store,
  avatar,
  document;

  /// The MinIO bucket subfolder for this category.
  String get folder => name;

  /// The MinIO bucket name.
  String get bucket => 'sabitou-media';

  /// Object key prefix inside the bucket: `products/`, `bills/`, etc.
  String get objectPrefix => '$folder/';

  /// Extensions the picker will accept for this category.
  List<String> get allowedExtensions => switch (this) {
    FileCategory.product => ['jpg', 'jpeg', 'png', 'webp'],
    FileCategory.bill => ['pdf', 'jpg', 'jpeg', 'png'],
    FileCategory.store => ['jpg', 'jpeg', 'png', 'webp'],
    FileCategory.avatar => ['jpg', 'jpeg', 'png'],
    FileCategory.document => ['pdf', 'doc', 'docx', 'jpg', 'jpeg', 'png'],
  };

  /// Whether this category only accepts images (no PDF).
  bool get isImageOnly => switch (this) {
    FileCategory.product || FileCategory.store || FileCategory.avatar => true,
    _ => false,
  };

  /// Whether grayscale compression is preferred (saves bandwidth for docs).
  bool get preferGrayscale => switch (this) {
    FileCategory.bill || FileCategory.document => true,
    _ => false,
  };

  /// Human-readable label for UI.
  String get label => switch (this) {
    FileCategory.product => 'Product Image',
    FileCategory.bill => 'Bill / Invoice',
    FileCategory.store => 'Store Photo',
    FileCategory.avatar => 'Profile Photo',
    FileCategory.document => 'Document',
  };
}
