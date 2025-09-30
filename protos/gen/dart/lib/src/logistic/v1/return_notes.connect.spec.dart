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
  static const createCustomerReturn = connect.Spec(
    '/$name/CreateCustomerReturn',
    connect.StreamType.unary,
    logisticv1return_notes.CreateCustomerReturnRequest.new,
    logisticv1return_notes.CreateCustomerReturnResponse.new,
  );

  /// Approve/reject a return request
  static const processReturnRequest = connect.Spec(
    '/$name/ProcessReturnRequest',
    connect.StreamType.unary,
    logisticv1return_notes.ProcessReturnRequestRequest.new,
    logisticv1return_notes.ProcessReturnRequestResponse.new,
  );

  /// Create credit note from return
  static const createCreditNoteFromReturn = connect.Spec(
    '/$name/CreateCreditNoteFromReturn',
    connect.StreamType.unary,
    logisticv1return_notes.CreateCreditNoteFromReturnRequest.new,
    logisticv1return_notes.CreateCreditNoteFromReturnResponse.new,
  );

  /// Create debit note for supplier return
  static const createDebitNoteFromReturn = connect.Spec(
    '/$name/CreateDebitNoteFromReturn',
    connect.StreamType.unary,
    logisticv1return_notes.CreateDebitNoteFromReturnRequest.new,
    logisticv1return_notes.CreateDebitNoteFromReturnResponse.new,
  );

  /// Get return details
  static const getReturn = connect.Spec(
    '/$name/GetReturn',
    connect.StreamType.unary,
    logisticv1return_notes.GetReturnRequest.new,
    logisticv1return_notes.GetReturnResponse.new,
  );

  /// List returns
  static const listReturns = connect.Spec(
    '/$name/ListReturns',
    connect.StreamType.unary,
    logisticv1return_notes.ListReturnsRequest.new,
    logisticv1return_notes.ListReturnsResponse.new,
  );
}
