//
//  Generated code. Do not modify.
//  source: link/v1/link.proto
//

import "package:connectrpc/connect.dart" as connect;
import "link.pb.dart" as linkv1link;
import "link.connect.spec.dart" as specs;

extension type ResourceLinkServiceClient (connect.Transport _transport) {
  /// Gets a resource link by id.
  /// Returns the resources in the same order as the ids.
  Future<linkv1link.GetResourceLinksResponse> getResourceLinks(
    linkv1link.GetResourceLinksRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ResourceLinkService.getResourceLinks,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
