import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../utils/button_state.dart';
import '../../utils/extends_models.dart';
import 'point_of_sales_view_models.dart';

/// Controller for point of sales screen
class PointOfSalesController extends ChangeNotifier {
  final PointOfSalesViewModel _viewModel;

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

  /// Constructor of [PointOfSalesController].
  PointOfSalesController(this._viewModel);
}
