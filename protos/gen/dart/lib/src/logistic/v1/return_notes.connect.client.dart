//
//  Generated code. Do not modify.
//  source: logistic/v1/return_notes.proto
//

import "package:connectrpc/connect.dart" as connect;
import "return_notes.pb.dart" as logisticv1return_notes;
import "return_notes.connect.spec.dart" as specs;

extension type ReturnServiceClient (connect.Transport _transport) {
  /// Create a return note (customer returning to you)
  Future<logisticv1return_notes.CreateCustomerReturnResponse> createCustomerReturn(
    logisticv1return_notes.CreateCustomerReturnRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ReturnService.createCustomerReturn,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Approve/reject a return request
  Future<logisticv1return_notes.ProcessReturnRequestResponse> processReturnRequest(
    logisticv1return_notes.ProcessReturnRequestRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ReturnService.processReturnRequest,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Create credit note from return
  Future<logisticv1return_notes.CreateCreditNoteFromReturnResponse> createCreditNoteFromReturn(
    logisticv1return_notes.CreateCreditNoteFromReturnRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ReturnService.createCreditNoteFromReturn,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Create debit note for supplier return
  Future<logisticv1return_notes.CreateDebitNoteFromReturnResponse> createDebitNoteFromReturn(
    logisticv1return_notes.CreateDebitNoteFromReturnRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ReturnService.createDebitNoteFromReturn,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Get return details
  Future<logisticv1return_notes.GetReturnResponse> getReturn(
    logisticv1return_notes.GetReturnRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ReturnService.getReturn,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// List returns
  Future<logisticv1return_notes.ListReturnsResponse> listReturns(
    logisticv1return_notes.ListReturnsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ReturnService.listReturns,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
