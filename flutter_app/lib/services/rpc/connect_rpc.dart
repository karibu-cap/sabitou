import 'package:connectrpc/connect.dart' as connect;
import 'package:connectrpc/http2.dart';
import 'package:connectrpc/protobuf.dart';
import 'package:connectrpc/protocol/connect.dart';
import 'package:get/get.dart';

/// The gRPC service.
final class ConnectRPCService extends GetxService {
  /// The client channel.
  connect.Transport clientChannel;

  /// The instance of [ConnectRPCService].
  static final to = Get.find<ConnectRPCService>();

  /// The constructs of new [ConnectRPCService].
  ConnectRPCService({connect.Transport? clientChannel})
    : clientChannel =
          clientChannel ??
          Transport(
            baseUrl: 'localhost',
            codec: const ProtoCodec(),
            httpClient: createHttpClient(),
          );
}
