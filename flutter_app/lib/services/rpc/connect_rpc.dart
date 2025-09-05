import 'package:connectrpc/connect.dart' as connect;
import 'package:connectrpc/http2.dart';
import 'package:connectrpc/protobuf.dart';
import 'package:connectrpc/protocol/connect.dart';
import 'package:get_it/get_it.dart';

/// The gRPC service.
class ConnectRPCService {
  /// The client channel.
  connect.Transport clientChannel;

  /// The instance of [ConnectRPCService].
  static final to = GetIt.I.get<ConnectRPCService>();

  /// The constructs of new [ConnectRPCService].
  ConnectRPCService({connect.Transport? clientChannel})
    : clientChannel =
          clientChannel ??
          Transport(
            baseUrl: 'http://localhost:3000',
            codec: const ProtoCodec(),
            httpClient: createHttpClient(),
          );
}
