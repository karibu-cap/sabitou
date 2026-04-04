import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';

import '../utils/logger.dart';

/// The sales order repository.
class SalesOrderRepository {
  /// The instance of [SalesOrderRepository].
  static final instance = GetIt.I.get<SalesOrderRepository>();

  /// Constructs a new [SalesOrderRepository].
  SalesOrderRepository({connect.Transport? transport});
}
