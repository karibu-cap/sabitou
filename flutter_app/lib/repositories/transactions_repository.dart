import 'package:get/get.dart';
import 'package:sabitou_rpc/models.dart';

import '../tmp/fake_data.dart';
import '../utils/app_constants.dart';

/// The transactions repository.
class TransactionsRepository {
  /// The instance of [TransactionsRepository].
  static final instance = Get.find<TransactionsRepository>();

  /// Gets the business transaction by business id.
  Future<List<Transaction>> getConpleteTransactionsByBusinessId({
    required String businessId,
    String? storeId,
    String? orderId,
    DateTime? startOfDay,
    DateTime? endOfDay,
  }) async {
    List<Transaction> response =
        fakeData[CollectionName.transactions]
            ?.map(
              (e) =>
                  Transaction()
                    ..mergeFromProto3Json(e, ignoreUnknownFields: true),
            )
            .where(
              (t) => t.status == TransactionStatus.TRANSACTION_STATUS_COMPLETED,
            )
            .toList() ??
        [];

    if (storeId != null) {
      response = response.where((t) => t.storeId == storeId).toList();
    }

    if (orderId != null) {
      response = response.where((t) => t.orderId == orderId).toList();
    }

    if (startOfDay != null && endOfDay != null) {
      response = response
          .where(
            (t) =>
                DateTime.parse(t.createdAt).isAfter(startOfDay) &&
                DateTime.parse(t.createdAt).isBefore(endOfDay),
          )
          .toList();
    }

    return response.where((t) => t.businessId == businessId).toList();
  }
}
