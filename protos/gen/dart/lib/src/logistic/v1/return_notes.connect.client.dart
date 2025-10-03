//
//  Generated code. Do not modify.
//  source: logistic/v1/return_notes.proto
//

import "package:connectrpc/connect.dart" as connect;
import "return_notes.pb.dart" as logisticv1return_notes;
import "return_notes.connect.spec.dart" as specs;

extension type ReturnNotesServiceClient (connect.Transport _transport) {
  /// Create a return note (customer returning to you)
  Future<logisticv1return_notes.CreateReturnNotesResponse> createReturnNotes(
    logisticv1return_notes.CreateReturnNotesRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ReturnNotesService.createReturnNotes,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
