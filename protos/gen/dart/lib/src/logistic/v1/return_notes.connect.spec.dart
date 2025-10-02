//
//  Generated code. Do not modify.
//  source: logistic/v1/return_notes.proto
//

import "package:connectrpc/connect.dart" as connect;
import "return_notes.pb.dart" as logisticv1return_notes;

abstract final class ReturnService {
  /// Fully-qualified name of the ReturnService service.
  static const name = 'logistic.v1.ReturnService';

  /// Create a return note (customer returning to you)
  static const createReturn = connect.Spec(
    '/$name/CreateReturn',
    connect.StreamType.unary,
    logisticv1return_notes.CreateReturnRequest.new,
    logisticv1return_notes.CreateReturnResponse.new,
  );
}
