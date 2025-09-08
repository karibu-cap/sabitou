import 'package:flutter/material.dart';
import 'package:sabitou_rpc/models.dart';

/// The [CartProvider].
class CartProvider with ChangeNotifier {
  final List<CartItem> _cart = [];
  List<CartItem> get cart => _cart;

  double get cartTotal {
    return _cart.fold(
      0.0,
      (sum, item) => sum + (item.product.priceInXaf * item.quantity),
    );
  }

  // Cart operations
  void addToCart(BusinessProduct product, {int quantity = 1}) {
    final existingIndex = _cart.indexWhere(
      (item) => item.product.refId == product.refId,
    );

    if (existingIndex != -1) {
      final existingItem = _cart[existingIndex];

      _cart[existingIndex] = existingItem.copyWith(
        quantity: existingItem.quantity + quantity,
      );
    } else {
      _cart.add(CartItem(product: product, quantity: quantity));
    }
    notifyListeners();
  }

  void updateCartQuantity(String productId, int quantity) {
    if (quantity <= 0) {
      _cart.removeWhere((item) => item.product.refId == productId);
    } else {
      final index = _cart.indexWhere((item) => item.product.refId == productId);
      if (index != -1) {
        _cart[index] = _cart[index].copyWith(quantity: quantity);
      }
    }
    notifyListeners();
  }

  void removeFromCart(String productId) {
    _cart.removeWhere((item) => item.product.refId == productId);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}

class CartItem {
  final BusinessProduct product;
  final int quantity;

  CartItem({required this.product, required this.quantity});

  CartItem copyWith({BusinessProduct? product, int? quantity}) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  double get total => (product.priceInXaf * quantity).toDouble();
}
