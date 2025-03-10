import 'package:get/get.dart';
import 'package:sabitou_rpc/connect_servers.dart';

/// The gRPC service.
final class ConnectRPCService extends GetxService {
  /// The client channel.
  final Transport clientChannel;

  /// Constructs new [ConnectRPCService].
  ConnectRPCService() : clientChannel = _createChannel();

  static Transport _createChannel() {
    const host = 'localhost';

    return Transport(
      baseUrl: host,
      codec: const ProtoCodec(),
      httpClient: createHttpClient(),
    );
  }
}
