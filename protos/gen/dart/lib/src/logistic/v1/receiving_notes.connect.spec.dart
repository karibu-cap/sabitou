//
//  Generated code. Do not modify.
//  source: logistic/v1/receiving_notes.proto
//

import "package:connectrpc/connect.dart" as connect;
import "receiving_notes.pb.dart" as logisticv1receiving_notes;

abstract final class ReceivingNoteService {
  /// Fully-qualified name of the ReceivingNoteService service.
  static const name = 'logistic.v1.ReceivingNoteService';

  static const createReceivingNote = connect.Spec(
    '/$name/CreateReceivingNote',
    connect.StreamType.unary,
    logisticv1receiving_notes.CreateReceivingNoteRequest.new,
    logisticv1receiving_notes.CreateReceivingNoteResponse.new,
  );
}
