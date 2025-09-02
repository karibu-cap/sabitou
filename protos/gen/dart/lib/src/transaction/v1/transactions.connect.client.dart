//
//  Generated code. Do not modify.
//  source: transaction/v1/transactions.proto
//

import "package:connectrpc/connect.dart" as connect;
import "transactions.pb.dart" as transactionv1transactions;
import "transactions.connect.spec.dart" as specs;

extension type TransactionServiceClient (connect.Transport _transport) {
  /// Adds a transaction.
  Future<transactionv1transactions.AddTransactionResponse> addTransaction(
    transactionv1transactions.AddTransactionRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.TransactionService.addTransaction,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Gets a transaction by id.
  Future<transactionv1transactions.GetTransactionResponse> getTransaction(
    transactionv1transactions.GetTransactionRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.TransactionService.getTransaction,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Updates a transaction.
  Future<transactionv1transactions.UpdateTransactionResponse> updateTransaction(
    transactionv1transactions.UpdateTransactionRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.TransactionService.updateTransaction,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Deletes a transaction.
  Future<transactionv1transactions.DeleteTransactionResponse> deleteTransaction(
    transactionv1transactions.DeleteTransactionRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.TransactionService.deleteTransaction,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Find transactions by query.
  Future<transactionv1transactions.FindTransactionsResponse> findTransactions(
    transactionv1transactions.FindTransactionsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.TransactionService.findTransactions,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
