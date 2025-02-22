import 'package:get/get.dart';
import 'package:grpc/grpc_or_grpcweb.dart';

/// The gRPC service.
final class GrpcService extends GetxService {
  /// The client channel.
  final GrpcOrGrpcWebClientChannel clientChannel;

  /// Constructs new [GrpcService].
  GrpcService() : clientChannel = _createChannel();

  static GrpcOrGrpcWebClientChannel _createChannel() {
    const host = 'localhost';
    const webPort = 50052;
    const port = 50051;

    return GrpcOrGrpcWebClientChannel.toSeparatePorts(
      host: host,
      grpcPort: port,
      grpcWebPort: webPort,
      grpcTransportSecure: false,
      grpcWebTransportSecure: false,
    );
  }
}
