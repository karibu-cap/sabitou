import 'package:connectrpc/connect.dart' as connect;
import 'package:connectrpc/http2.dart'
    if (dart.library.js_interop) 'package:connectrpc/web.dart'
    if (dart.library.html) 'package:connectrpc/web.dart';
import 'package:connectrpc/protobuf.dart';
import 'package:connectrpc/protocol/connect.dart';
import 'package:get_it/get_it.dart';

import '../../utils/app_config.dart';
import '../../utils/logger.dart';
import '../auth/token_service.dart';

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
            baseUrl: AppConfig.connectorUrl,
            codec: const ProtoCodec(),
            httpClient: createHttpClient(),
          );

  static connect.Interceptor _bearerTokenInterceptor() {
    return <I extends Object, O extends Object>(connect.AnyFn<I, O> next) {
      final _logger = LoggerApp('ConnectRPCService');

      return (req) async {
        try {
          // flutter_secure_storage on web uses Web Crypto AES-GCM.
          // It throws OperationError when the key doesn't exist yet (first
          // login attempt before any token is stored). We catch and proceed
          // without the header — unauthenticated RPCs (login, register) don't
          // need it, and 401 responses are handled server-side.
          final token =
              await TokenService.instance.getValidAccessToken() ??
              await TokenService.instance.getAccessToken();
          if (token != null) {
            req.headers['Authorization'] = 'Bearer $token';
          }
        } catch (e) {
          // No token available — proceed without Authorization header.
          // This is expected on first login before any token is stored.
          _logger.severe('Interceptor token error: $e');
        }

        return next(req);
      };
    };
  }
}
