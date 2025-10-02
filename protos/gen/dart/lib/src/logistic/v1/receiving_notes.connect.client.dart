//
//  Generated code. Do not modify.
//  source: logistic/v1/receiving_notes.proto
//

import "package:connectrpc/connect.dart" as connect;
import "receiving_notes.pb.dart" as logisticv1receiving_notes;
import "receiving_notes.connect.spec.dart" as specs;

extension type ReceivingNoteServiceClient (connect.Transport _transport) {
  Future<logisticv1receiving_notes.CreateReceivingNoteResponse> createReceivingNote(
    logisticv1receiving_notes.CreateReceivingNoteRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ReceivingNoteService.createReceivingNote,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
