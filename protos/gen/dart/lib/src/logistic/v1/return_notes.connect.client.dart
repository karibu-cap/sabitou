//
//  Generated code. Do not modify.
//  source: logistic/v1/return_notes.proto
//

import "package:connectrpc/connect.dart" as connect;
import "return_notes.pb.dart" as logisticv1return_notes;
import "return_notes.connect.spec.dart" as specs;

extension type ReturnServiceClient (connect.Transport _transport) {
  /// Create a return note (customer returning to you)
  Future<logisticv1return_notes.CreateReturnResponse> createReturn(
    logisticv1return_notes.CreateReturnRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ReturnService.createReturn,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
