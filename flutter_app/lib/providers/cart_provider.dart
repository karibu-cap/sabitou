import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

/// The cart manager.
class CartManager extends ChangeNotifier {
  /// The uuid generator.
  final uuid = const Uuid();

  // /// The list of saved orders.
  // List<Order> listOfSaveOrder = [];

  // /// The current order.
  // Order? _currentOrder;

  // /// The current order.
  // Order? get currentOrder => _currentOrder;

  /// Direct access to the cart manager.
  static CartManager get to => GetIt.I<CartManager>();

  /// Constructor of new [CartManager].
  CartManager() {
    _init();
  }

  Future<void> _init() async {
    // final listOfSaveOrder = AppStorageService.to.read<List<Order>?>(
    //   '${CollectionName.orders}-${UserPreferences.instance.store?.refId}',
    // );

    // if (listOfSaveOrder != null && listOfSaveOrder.isNotEmpty) {
    //   this.listOfSaveOrder = listOfSaveOrder;
    // }

    // _resetCart();
  }

  // /// Clears the cart.
  // void clearCart() {
  //   _resetCart();
  // }

  // /// Resets the cart.
  // void _resetCart() {
  //   // final currentStore = UserPreferences.instance.store;
  //   // final user = UserPreferences.instance.user;
  //   // if (currentStore == null || user == null) {
  //   //   return;
  //   // }
  //   // _currentOrder = Order()
  //   //   ..refId = uuid.v4()
  //   //   ..storeId = currentStore.refId
  //   //   ..initiatedBy = user.refId
  //   //   ..createdAt = Timestamp.fromDateTime(clock.now())
  //   //   ..status = OrderStatus.ORDER_STATUS_PENDING;
  //   // notifyListeners();
  // }

  // /// Adds an item to the order.
  // Future<bool> addItem(
  //   String storeProductId,
  //   String itemName,
  //   int quantity,
  //   double unitPrice,
  // ) async {
  //   if (quantity <= 0) return false;

  //   final product = await ProductsRepository.instance.getProduct(
  //     GetStoreProductRequest(storeProductId: storeProductId),
  //   );
  //   // if ((product?. ?? 0) < quantity) {
  //   //   return false;
  //   // }

  //   final existingItem = _currentOrder?.orderItems.firstWhereOrNull(
  //     (item) => item.storeProductId == storeProductId,
  //   );
  //   if (existingItem != null) {
  //     existingItem.quantity += quantity;
  //   } else {
  //     _currentOrder?.orderItems.add(
  //       OrderItem()
  //         ..storeProductId = storeProductId
  //         ..itemName = itemName
  //         ..quantity = quantity
  //         ..unitPrice = unitPrice.toInt(),
  //     );
  //   }
  //   _updateTotal();
  //   notifyListeners();

  //   return true;
  // }

  // /// On hold the current order.
  // Future<void> onHoldCurrentOrder() async {
  //   _currentOrder?.status = OrderStatus.ORDER_STATUS_PROCESSING;
  //   await _saveCart();
  //   await _init();
  //   notifyListeners();
  // }

  // /// Resumes the order.
  // void resumeOrder(Order order) {
  //   _currentOrder = Order()..mergeFromMessage(order);
  //   notifyListeners();
  // }

  // /// Removes an item from the order.
  // bool removeItem(String storeProductId) {
  //   if (_currentOrder == null) {
  //     return false;
  //   }
  //   final itemIndex = _currentOrder?.orderItems.indexWhere(
  //     (item) => item.storeProductId == storeProductId,
  //   );
  //   if (itemIndex != null && itemIndex >= 0) {
  //     _currentOrder?.orderItems.removeAt(itemIndex);
  //     _updateTotal();
  //     notifyListeners();

  //     return true;
  //   }
  //   notifyListeners();

  //   return false;
  // }

  // /// Updates the quantity of an item in the order.
  // Future<bool> updateQuantity(String storeProductId, int quantity) async {
  //   // // if (quantity <= 0) {
  //   // //   return false;
  //   // // }
  //   // // final item = _currentOrder?.orderItems.firstWhereOrNull(
  //   // //   (item) => item.storeProductId == storeProductId,
  //   // // );
  //   // // if (item == null) {
  //   // //   return false;
  //   // // }

  //   // // final product = await ProductsRepository.instance.getProduct(
  //   // //   GetStoreProductRequest(storeProductId: storeProductId),
  //   // // );
  //   // // if ((product?.stockQuantity ?? 0) < quantity) {
  //   // //   return false;
  //   // // }
  //   // item.quantity = quantity;
  //   _updateTotal();
  //   notifyListeners();

  //   return true;
  // }

  // void _updateTotal() {
  //   _currentOrder?.orderPrices.grandTotal =
  //       _currentOrder?.orderItems.fold<int>(
  //         0,
  //         (sum, item) => sum + (item.quantity * item.unitPrice),
  //       ) ??
  //       0;
  //   _currentOrder?.updatedAt = Timestamp.fromDateTime(clock.now());
  //   notifyListeners();
  // }

  // /// Completes the order.
  // Future<bool> completeOrder() async {
  //   final currentOrder = _currentOrder;
  //   if (currentOrder == null || currentOrder.orderItems.isEmpty) {
  //     return false;
  //   }
  //   currentOrder
  //     ..status = OrderStatus.ORDER_STATUS_COMPLETED
  //     ..updatedAt = Timestamp.fromDateTime(clock.now());

  //   final result = await OrdersRepository.instance.addOrder(
  //     CreateOrderRequest(order: currentOrder),
  //   );

  //   if (result == null) {
  //     return false;
  //   }

  //   listOfSaveOrder.removeWhere((order) => order.refId == _currentOrder?.refId);
  //   unawaited(_removeOrderFromSaveCart());
  //   clearCart();

  //   notifyListeners();

  //   return true;
  // }

  // Future<void> _saveCart() async {
  //   final currentOrder = _currentOrder;
  //   if (currentOrder == null) {
  //     return;
  //   }
  //   final storeId = UserPreferences.instance.store?.refId;
  //   if (storeId == null) {
  //     return;
  //   }

  //   // Update or add the current order
  //   final index = listOfSaveOrder.indexWhere(
  //     (order) => order.refId == currentOrder.refId,
  //   );
  //   if (index >= 0) {
  //     listOfSaveOrder[index] = currentOrder;
  //   } else {
  //     listOfSaveOrder.add(currentOrder);
  //   }

  //   await AppStorageService.to.write(
  //     '${CollectionName.orders}-$storeId',
  //     listOfSaveOrder,
  //   );
  // }

  // Future<void> _removeOrderFromSaveCart() async {
  //   final currentOrder = _currentOrder;
  //   if (currentOrder == null) {
  //     return;
  //   }
  //   final storeId = UserPreferences.instance.store?.refId;
  //   if (storeId == null) {
  //     return;
  //   }

  //   listOfSaveOrder.removeWhere((order) => order.refId == currentOrder.refId);
  //   await AppStorageService.to.write(
  //     '${CollectionName.orders}-$storeId',
  //     listOfSaveOrder,
  //   );
  // }
}
