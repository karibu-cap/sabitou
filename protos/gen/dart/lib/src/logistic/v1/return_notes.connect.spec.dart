//
//  Generated code. Do not modify.
//  source: logistic/v1/return_notes.proto
//

import "package:connectrpc/connect.dart" as connect;
import "return_notes.pb.dart" as logisticv1return_notes;

abstract final class ReturnNotesService {
  /// Fully-qualified name of the ReturnNotesService service.
  static const name = 'logistic.v1.ReturnNotesService';

  /// Create a return note (customer returning to you)
  static const createReturnNotes = connect.Spec(
    '/$name/CreateReturnNotes',
    connect.StreamType.unary,
    logisticv1return_notes.CreateReturnNotesRequest.new,
    logisticv1return_notes.CreateReturnNotesResponse.new,
  );
}
