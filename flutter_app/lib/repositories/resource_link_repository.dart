import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../core/database/base_repository.dart';
import '../core/database/local_data_source.dart';
import '../core/database/query/sql_condition.dart';
import '../core/database/row_mapper.dart';
import '../services/powersync/schema.dart';
import '../services/rpc/connect_rpc.dart';
import '../utils/app_constants.dart';
import '../utils/logger.dart';

/// The media repository.
class ResourceLinkRepository extends BaseRepository<ResourceLink> {
  final _logger = LoggerApp('ResourceLinkRepository');

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
  ResourceLinkRepository({required this.dataSource});

  /// Gets a single resource link by ID.
  Future<ResourceLink?> getResourceLink(String id) async {
    try {
      return await findById(id);
    } on Exception catch (e) {
      _logger.severe('getResourceLink Error: $e');

      return null;
    }
  }

  /// Deletes a resource link.
  Future<void> deleteRessource(String id) async {
    try {
      await dataSource.updateWhere(
        table: CollectionName.resourceLinks,
        fields: {ResourceLinksFields.isOrphan: 'true'},
        filters: [SqlQuery.equals(ResourceLinksFields.refId, id)],
      );
    } on Exception catch (e) {
      _logger.severe('delete Error: $e');
    }
  }

  /// Updates the target URI of a resource link.
  Future<bool> updateTargetUri(String linkId, String url) async {
    try {
      /// Gets the resource link by ID.
      final resourceLink = await getResourceLink(linkId);

      if (resourceLink == null) {
        _logger.warning('updateTargetUri: resourceLink is null');
        // create the resource link
        await dataSource.createRecord(
          table: CollectionName.resourceLinks,
          record: fromResourceLinkToRaw(
            ResourceLink(
              refId: linkId,
              targetUri: url,
              iconUri: url,
              isOrphan: true,
            ),
          ),
        );
        _logger.info(
          'updateTargetUri: resourceLink created successfully $url $linkId',
        );

        return true;
      }

      await dataSource.updateWhere(
        table: CollectionName.resourceLinks,
        fields: {ResourceLinksFields.targetUri: url},
        filters: [SqlQuery.equals(ResourceLinksFields.refId, linkId)],
      );

      _logger.info(
        'updateTargetUri: resourceLink updated successfully $url $linkId',
      );

      return true;
    } on Exception catch (e) {
      _logger.severe('updateTargetUri Error: $e');

      return false;
    }
  }
}
