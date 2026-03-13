import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../services/network_status_provider/network_status_provider.dart';
import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';

/// The ResourceLink repository.
class ResourceLinkRepository {
  final _logger = LoggerApp('ResourceLinkRepository');

  /// The instance of [ResourceLinkRepository].
  static final instance = GetIt.I.get<ResourceLinkRepository>();

  /// The ResourceLink service client.
  final ResourceLinkServiceClient resourceLinkServiceClient;

  /// Constructs a new [ResourceLinkRepository].
  ResourceLinkRepository({
    connect.Transport? transport,
    NetworkStatusProvider? networkStatusProvider,
  }) : resourceLinkServiceClient = ResourceLinkServiceClient(
         ConnectRPCService.to.clientChannel,
       );

  /// Gets resource links by their IDs.
  Future<Map<String, ResourceLink>> getResourceLinks(List<String> ids) async {
    try {
      final request = GetResourceLinksRequest(ids: ids);
      final response = await resourceLinkServiceClient.getResourceLinks(
        request,
      );

      return response.link;
    } on Exception catch (e) {
      _logger.severe('getResourceLinks Error: $e');

      return {};
    }
  }

  /// Gets a single resource link by ID.
  Future<ResourceLink?> getResourceLink(String id) async {
    try {
      final request = GetResourceLinksRequest(ids: [id]);
      final response = await resourceLinkServiceClient.getResourceLinks(
        request,
      );

      return response.link[id];
    } on Exception catch (e) {
      _logger.severe('getResourceLink Error: $e');

      return null;
    }
  }

  /// Gets multiple resource links by their IDs.
  Future<List<ResourceLink>> getResourceLinksByIds(List<String> ids) async {
    try {
      final request = GetResourceLinksRequest(ids: ids);
      final response = await resourceLinkServiceClient.getResourceLinks(
        request,
      );

      return response.link.values.toList();
    } on Exception catch (e) {
      _logger.severe('getResourceLinksByIds Error: $e');

      return [];
    }
  }

  /// Gets image URLs for a list of resource link IDs.
  Future<List<String>> getImageUrls(List<String> imageLinkIds) async {
    try {
      final links = await getResourceLinks(imageLinkIds);

      return links.values
          .where((link) => link.hasTargetUri())
          .map((link) => link.targetUri)
          .toList();
    } on Exception catch (e) {
      _logger.severe('getImageUrls Error: $e');

      return [];
    }
  }

  /// Gets the primary image URL for a product.
  Future<String?> getPrimaryImageUrl(String imageLinkId) async {
    try {
      final link = await getResourceLink(imageLinkId);

      return link?.hasTargetUri() == true ? link?.targetUri : null;
    } on Exception catch (e) {
      _logger.severe('getPrimaryImageUrl Error: $e');

      return null;
    }
  }
}
