import 'package:clock/clock.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:uuid/uuid.dart';

import '../utils/user_preference.dart';

/// The cart manager for POS system
class CartManager extends ChangeNotifier {
  final Uuid _uuid = const Uuid();

  CashReceipt? _currentCashReceipt;
  final List<Payment> _payments = [];

  /// The instance of [CartManager].
  static CartManager get instance => GetIt.I<CartManager>();

  /// Backward compatibility accessor
  static CartManager get to => GetIt.I<CartManager>();

  /// The current cash receipt.
  CashReceipt? get currentCashReceipt => _currentCashReceipt;

  /// The list of payments.
  List<Payment> get payments => _payments;

  /// The can complete.
  bool get canComplete {
    final cashReceipt = _currentCashReceipt;
    if (cashReceipt == null) return false;
    if (cashReceipt.items.isEmpty) return false;

    return cashReceipt.amountPaid >= cashReceipt.totalAmount;
  }

  /// Constructor of new [CartManager].
  CartManager() {
    _initializeCart();
  }

  /// Initialize the cart.
  void _initializeCart() {
    final store = UserPreferences.instance.store;
    final user = UserPreferences.instance.user;
    if (store == null || user == null) {
      return;
    }

    _currentCashReceipt = CashReceipt(
      documentId: _uuid.v4(),
      storeId: store.refId,
      cashierUserId: user.refId,
      items: [],
      transactionTime: Timestamp.fromDateTime(clock.now()),
    );
  }

  /// Add item to cart
  bool addItem(InvoiceLineItem item) {
    if (item.quantity <= 0) return false;

    final existingIndex = _currentCashReceipt?.items.indexWhere(
      (cartItem) =>
          cartItem.productId == item.productId &&
          cartItem.batchId == item.batchId,
    );

    final currentCart = _currentCashReceipt;
    if (currentCart == null) return false;

    if (existingIndex != null && existingIndex >= 0) {
      currentCart.items[existingIndex]
        ..quantity = currentCart.items[existingIndex].quantity + item.quantity
        ..subtotal =
            (currentCart.items[existingIndex].quantity + item.quantity) *
            item.unitPrice
        ..total =
            (currentCart.items[existingIndex].quantity + item.quantity) *
                item.unitPrice +
            item.taxAmount;
    } else {
      currentCart.items.add(item);
    }
    _updatePaymentCalculations();
    notifyListeners();

    return true;
  }

  /// Update item quantity
  bool updateQuantity(String productId, int newQuantity, {String? batchId}) {
    if (newQuantity <= 0) {
      return false;
    }

    final itemIndex = _currentCashReceipt?.items.indexWhere(
      (item) => item.productId == productId && item.batchId == batchId,
    );

    final currentCart = _currentCashReceipt;
    if (itemIndex == null || itemIndex < 0 || currentCart == null) {
      return false;
    }

    currentCart.items[itemIndex]
      ..quantity = newQuantity
      ..subtotal = newQuantity * currentCart.items[itemIndex].unitPrice
      ..total =
          (newQuantity * currentCart.items[itemIndex].unitPrice) +
          (currentCart.items[itemIndex].taxAmount);
    _updatePaymentCalculations();

    notifyListeners();

    return true;
  }

  /// Remove item from cart
  bool removeItem(String productId, {String? batchId}) {
    final currentCart = _currentCashReceipt;
    if (currentCart == null) return false;

    final itemIndex = currentCart.items.indexWhere(
      (item) => item.productId == productId && item.batchId == batchId,
    );

    if (itemIndex >= 0) {
      currentCart.items.removeAt(itemIndex);
      _updatePaymentCalculations();
      notifyListeners();

      return true;
    }

    return false;
  }

  /// Clear cart
  void clearCart() {
    final currentCart = _currentCashReceipt;
    if (currentCart == null) return;

    _currentCashReceipt = CashReceipt(
      documentId: _uuid.v4(),
      storeId: currentCart.storeId,
      cashierUserId: currentCart.cashierUserId,
      items: [],
      customerId: currentCart.customerId,
    );
    _payments.clear();
    notifyListeners();
  }

  /// Add payment
  void addPayment(Payment payment) {
    _payments.add(payment);
    _updatePaymentCalculations();
    notifyListeners();
  }

  /// Remove payment
  void removePayment(int index) {
    if (index >= 0 && index < _payments.length) {
      _payments.removeAt(index);
      _updatePaymentCalculations();
      notifyListeners();
    }
  }

  /// Update payment calculations
  void _updatePaymentCalculations() {
    final totalAmount =
        _currentCashReceipt?.items.fold(0.0, (sum, item) => sum + item.total) ??
        0;
    final paidAmount = _payments.fold(
      0.0,
      (sum, payment) => sum + payment.amount.toDouble(),
    );

    _currentCashReceipt?.amountPaid = paidAmount;
    _currentCashReceipt?.totalAmount = totalAmount;
    _currentCashReceipt?.owedToCustomer = paidAmount > totalAmount
        ? totalAmount - paidAmount - (_currentCashReceipt?.changeGiven ?? 0)
        : 0;
    notifyListeners();
  }

  /// Set customer for current cart
  void setChangeGiven(double changeGiven) {
    final currentCashReceipt = _currentCashReceipt;
    if (currentCashReceipt != null) {
      _currentCashReceipt?.changeGiven = changeGiven;
      _currentCashReceipt?.owedToCustomer =
          currentCashReceipt.amountPaid -
          currentCashReceipt.totalAmount -
          changeGiven;
      notifyListeners();
    }
  }

  /// Get cart items for display
  List<InvoiceLineItem> getCartItems() {
    return _currentCashReceipt?.items ?? [];
  }
}
