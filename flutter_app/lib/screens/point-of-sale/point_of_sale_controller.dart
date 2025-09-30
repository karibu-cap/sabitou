import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../utils/button_state.dart';
import '../../utils/extends_models.dart';
import 'point_of_sale_view_model.dart';

/// Controller for new order.
class PointOfSaleController extends ChangeNotifier {
  final PointOfSaleViewModel _viewModel;

  /// The search query controller.
  final searchQueryController = TextEditingController();

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
  PointOfSaleController(this._viewModel);
}
