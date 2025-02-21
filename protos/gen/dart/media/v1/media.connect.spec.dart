//
//  Generated code. Do not modify.
//  source: media/v1/media.proto
//

import "package:connectrpc/connect.dart" as connect;
import "media.pb.dart" as mediav1media;

abstract final class MediaService {
  /// Fully-qualified name of the MediaService service.
  static const name = 'media.v1.MediaService';

  /// Gets a media by id.
  static const getMedias = connect.Spec(
    '/$name/GetMedias',
    connect.StreamType.unary,
    mediav1media.GetMediasRequest.new,
    mediav1media.GetMediasResponse.new,
  );
}
