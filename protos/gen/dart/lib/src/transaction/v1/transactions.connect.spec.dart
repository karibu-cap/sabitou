//
//  Generated code. Do not modify.
//  source: transaction/v1/transactions.proto
//

import "package:connectrpc/connect.dart" as connect;
import "transactions.pb.dart" as transactionv1transactions;

abstract final class TransactionService {
  /// Fully-qualified name of the TransactionService service.
  static const name = 'transaction.v1.TransactionService';

  /// Adds a transaction.
  static const addTransaction = connect.Spec(
    '/$name/AddTransaction',
    connect.StreamType.unary,
    transactionv1transactions.AddTransactionRequest.new,
    transactionv1transactions.AddTransactionResponse.new,
  );

  /// Gets a transaction by id.
  static const getTransaction = connect.Spec(
    '/$name/GetTransaction',
    connect.StreamType.unary,
    transactionv1transactions.GetTransactionRequest.new,
    transactionv1transactions.GetTransactionResponse.new,
  );

  /// Updates a transaction.
  static const updateTransaction = connect.Spec(
    '/$name/UpdateTransaction',
    connect.StreamType.unary,
    transactionv1transactions.UpdateTransactionRequest.new,
    transactionv1transactions.UpdateTransactionResponse.new,
  );

  /// Deletes a transaction.
  static const deleteTransaction = connect.Spec(
    '/$name/DeleteTransaction',
    connect.StreamType.unary,
    transactionv1transactions.DeleteTransactionRequest.new,
    transactionv1transactions.DeleteTransactionResponse.new,
  );

  /// Find transactions by query.
  static const findTransactions = connect.Spec(
    '/$name/FindTransactions',
    connect.StreamType.unary,
    transactionv1transactions.FindTransactionsRequest.new,
    transactionv1transactions.FindTransactionsResponse.new,
  );
}
