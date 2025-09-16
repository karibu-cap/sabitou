import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../utils/button_state.dart';
import '../../utils/extends_models.dart';
import 'new_order_view_model.dart';

/// Controller for new order.
class NewOrderController extends ChangeNotifier {
  final NewOrderViewModel _viewModel;

  /// The complete order button state.
  final ButtonState completeOrderButtonState = ButtonState.initial;

  /// The on hold order button state.
  final ButtonState onHoldOrderButtonState = ButtonState.initial;

  /// Gets the list of products.
  BehaviorSubject<List<Product>> get productsSubject =>
      _viewModel.productsSubject;

  /// Gets the filtered products stream.
  Stream<List<Product>> get filteredProductsStream =>
      _viewModel.filteredProductsStream;

  /// Gets the search query.
  BehaviorSubject<String> get searchQuery => _viewModel.searchQuery;

  /// Constructor of [NewOrderController].
  NewOrderController(this._viewModel);
}
