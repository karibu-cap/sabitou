import 'dart:convert';
import 'dart:typed_data';

/// Status of a pending upload task.
enum UploadStatus { pending, uploading, failed, done }

/// A single item in the persistent upload queue.
class UploadItem {
  /// Unique ID.
  final String id;

  /// Absolute path to the (already compressed) local file.
  final String localPath;

  /// The compressed file bytes (stored for web compatibility).
  final Uint8List bytes;

  /// The remote object key that will be used in MinIO (e.g. `product/uuid_ts.jpg`).
  final String objectKey;

  /// The `ResourceLink.ref_id` pre-created in the local DB.
  final String resourceLinkId;

  /// The name of the category the file belongs to.
  final String categoryName;

  /// The status of the upload task.
  final UploadStatus status;

  /// The number of times the upload task has been retried.
  final int retryCount;

  /// The date and time when the upload task was created.
  final DateTime createdAt;

  /// Creates a new [UploadItem].
  const UploadItem({
    required this.id,
    required this.localPath,
    required this.bytes,
    required this.objectKey,
    required this.resourceLinkId,
    required this.categoryName,
    this.status = UploadStatus.pending,
    this.retryCount = 0,
    required this.createdAt,
  });

  /// Creates a copy of this [UploadItem] with the given fields replaced with the new values.
  UploadItem copyWith({UploadStatus? status, int? retryCount}) => UploadItem(
    id: id,
    localPath: localPath,
    bytes: bytes,
    objectKey: objectKey,
    resourceLinkId: resourceLinkId,
    categoryName: categoryName,
    status: status ?? this.status,
    retryCount: retryCount ?? this.retryCount,
    createdAt: createdAt,
  );

  /// Converts this [UploadItem] to a JSON object.
  Map<String, dynamic> toJson() => {
    'id': id,
    'localPath': localPath,
    'bytes': base64Encode(bytes),
    'objectKey': objectKey,
    'resourceLinkId': resourceLinkId,
    'categoryName': categoryName,
    'status': status.name,
    'retryCount': retryCount,
    'createdAt': createdAt.toIso8601String(),
  };

  /// Converts this [UploadItem] to a JSON string.
  factory UploadItem.fromJson(Map<String, dynamic> json) => UploadItem(
    id: json['id'] as String,
    localPath: json['localPath'] as String,
    bytes: base64Decode(json['bytes'] as String),
    objectKey: json['objectKey'] as String,
    resourceLinkId: json['resourceLinkId'] as String,
    categoryName: json['categoryName'] as String,
    status: UploadStatus.values.firstWhere(
      (e) => e.name == json['status'],
      orElse: () => UploadStatus.pending,
    ),
    retryCount: json['retryCount'] as int? ?? 0,
    createdAt: DateTime.parse(json['createdAt'] as String),
  );

  /// Converts this [UploadItem] to a JSON string.
  String toJsonString() => jsonEncode(toJson());

  /// Converts a JSON string to a [UploadItem].
  factory UploadItem.fromJsonString(String s) =>
      UploadItem.fromJson(jsonDecode(s) as Map<String, dynamic>);
}
