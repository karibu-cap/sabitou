import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../core/database/base_repository.dart';
import '../core/database/local_data_source.dart';
import '../core/database/row_mapper.dart';
import '../services/rpc/connect_rpc.dart';
import '../utils/app_constants.dart';
import '../utils/logger.dart';

/// The media repository.
class ResourceLinkRepository extends BaseRepository<ResourceLink> {
  final _logger = LoggerApp('ResourceLinkRepository');

  /// The media service client.
  final ResourceLinkServiceClient mediaServiceClient;

  /// The instance of [ResourceLinkRepository].
  static final instance = GetIt.I.get<ResourceLinkRepository>();

  @override
  final LocalDataSource dataSource;

  @override
  String get tableName => CollectionName.resourceLinks;

  @override
  ResourceLink fromRow(RawRow row) => fromRowToResourceLink(row);

  @override
  RawRow toRow(ResourceLink entity) => fromResourceLinkToRaw(entity);

  /// Constructs a new [ResourceLinkRepository].
  ResourceLinkRepository({required this.dataSource})
    : mediaServiceClient = ResourceLinkServiceClient(
        ConnectRPCService.to.clientChannel,
      );

  /// Gets a single resource link by ID.
  Future<ResourceLink?> getResourceLink(String id) async {
    try {
      return await findById(id);
    } on Exception catch (e) {
      _logger.severe('getResourceLink Error: $e');

      return null;
    }
  }
}
