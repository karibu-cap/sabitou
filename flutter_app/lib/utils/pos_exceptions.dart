/// Base class for all POS-specific exceptions.
sealed class PosException implements Exception {
  const PosException(this.message);

  /// Human-readable description of the error.
  final String message;

  @override
  String toString() => '$runtimeType: $message';
}

/// Thrown when the sum of payments is less than the receipt total.
final class IncompletePaymentException extends PosException {
  const IncompletePaymentException({
    required this.totalDue,
    required this.totalPaid,
  }) : super('Payment incomplete — due: $totalDue, paid: $totalPaid');

  /// Amount the customer must pay.
  final double totalDue;

  /// Amount the customer actually paid.
  final double totalPaid;

  /// Amount still owed.
  double get shortfall => totalDue - totalPaid;
}

/// Thrown when a product does not have enough stock to fulfil the sale.
final class InsufficientStockException extends PosException {
  const InsufficientStockException({
    required this.productId,
    required this.productLabel,
    required this.requested,
    required this.available,
  }) : super(
         'Insufficient stock for "$productLabel" — '
         'requested: $requested, available: $available',
       );

  /// The product that has insufficient stock.
  final String productId;

  /// Human-readable product name used in UI messages.
  final String productLabel;

  /// Quantity the cart is trying to sell.
  final int requested;

  /// Quantity actually available in the store.
  final int available;
}

/// Thrown when the receipt referenced by [receiptId] cannot be found.
final class ReceiptNotFoundException extends PosException {
  const ReceiptNotFoundException(String receiptId)
    : super('Receipt "$receiptId" not found');
}

/// Thrown when a receipt is already completed and cannot be modified.
final class ReceiptAlreadyCompletedException extends PosException {
  const ReceiptAlreadyCompletedException(String receiptId)
    : super('Receipt "$receiptId" is already completed');
}

/// Thrown when a gift-voucher code is invalid or has no remaining balance.
final class InvalidVoucherException extends PosException {
  const InvalidVoucherException(String code)
    : super('Voucher "$code" is invalid or has no remaining balance');
}
