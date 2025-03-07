//
//  Generated code. Do not modify.
//  source: link/v1/link.proto
//

import "package:connectrpc/connect.dart" as connect;
import "link.pb.dart" as linkv1link;

abstract final class ResourceLinkService {
  /// Fully-qualified name of the ResourceLinkService service.
  static const name = 'link.v1.ResourceLinkService';

  /// Gets a resource link by id.
  /// Returns the resources in the same order as the ids.
  static const getResourceLinks = connect.Spec(
    '/$name/GetResourceLinks',
    connect.StreamType.unary,
    linkv1link.GetResourceLinksRequest.new,
    linkv1link.GetResourceLinksResponse.new,
  );
}
