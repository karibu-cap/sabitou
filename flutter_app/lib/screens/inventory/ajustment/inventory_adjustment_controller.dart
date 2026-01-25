import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sabitou_rpc/models.dart';

import '../../../services/internationalization/internationalization.dart';
import 'inventory_adjustment_view_model.dart';

/// Controller for the inventory adjustment dialog.
class InventoryAdjustmentController extends ChangeNotifier {
  final InventoryAdjustmentViewModel _viewModel;

  /// Whether the adjust operation is in progress.
  bool _isLoading = false;

  /// The form key for the adjustment form.
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// The controller for the adjusted quantity field.
  final TextEditingController quantityAdjustedController =
      TextEditingController();

  /// The controller for the new quantity on hand field.
  final TextEditingController newQuantityOnHandController =
      TextEditingController();

  /// The controller for the custom reason field.
  final TextEditingController customReasonController = TextEditingController();

  /// The controller for the notes field.
  final TextEditingController notesController = TextEditingController();

  /// The currently selected reason.
  String? _selectedReason;

  /// Gets the currently selected reason.
  String? get selectedReason => _selectedReason;

  /// Gets whether the adjust operation is in progress.
  bool get isLoading => _isLoading;

  /// Gets the error stream.
  Stream<String> get errorStream => _viewModel.errorStream;

  /// Gets the completer.
  Completer<bool> get completer => _viewModel.completer;

  /// The effective reason for the adjustment (predefined or custom).
  String get effectiveReason {
    if (_selectedReason == otherReasonValue || _selectedReason == null) {
      return customReasonController.text;
    }

    return _selectedReason ?? '';
  }

  /// Whether the form is valid and ready for submission.
  bool get isValid {
    final int adjusted = int.tryParse(quantityAdjustedController.text) ?? 0;
    if (adjusted == 0) return false;
    if (effectiveReason.isEmpty) return false;

    return true;
  }

  /// Gets the inventory item stream.
  InventoryLevelWithProduct? get inventoryItemStream =>
      _viewModel.inventoryItemStream;

  /// The list of predefined reasons for inventory adjustment.
  List<String> get predefinedReasons => [
    Intls.to.stockOnFire,
    Intls.to.markAsInactiveReason,
    Intls.to.stolenGoods,
    Intls.to.damagedGoods,
    Intls.to.stockWrittenOff,
    Intls.to.stocktakingResults,
    Intls.to.inventoryRevaluation,
  ];

  /// Special value for custom reason.
  String get otherReasonValue => Intls.to.otherReason;

  /// Constructs an [InventoryAdjustmentController].
  InventoryAdjustmentController({
    required InventoryAdjustmentViewModel viewModel,
  }) : _viewModel = viewModel {
    quantityAdjustedController.addListener(_onQuantityAdjustedChanged);
    newQuantityOnHandController.addListener(_onNewQuantityChanged);
  }

  void _onQuantityAdjustedChanged() {
    if (!quantityAdjustedController.selection.isValid &&
        quantityAdjustedController.text.isNotEmpty) {
      // Avoid infinite loop if called during rebuild/selection change
    }

    final int? adjusted = int.tryParse(quantityAdjustedController.text);
    if (adjusted != null) {
      final int newVal =
          (inventoryItemStream?.level.quantityAvailable ?? 0) + adjusted;
      final String newValStr = newVal.toString();
      if (newQuantityOnHandController.text != newValStr) {
        newQuantityOnHandController
          ..removeListener(_onNewQuantityChanged)
          ..text = newValStr
          ..addListener(_onNewQuantityChanged);
      }
    }
    notifyListeners();
  }

  void _onNewQuantityChanged() {
    final int? newVal = int.tryParse(newQuantityOnHandController.text);
    if (newVal != null) {
      final int adjusted =
          newVal - (inventoryItemStream?.level.quantityAvailable ?? 0);
      final String adjustedStr = adjusted.toString();
      if (quantityAdjustedController.text != adjustedStr) {
        quantityAdjustedController
          ..removeListener(_onQuantityAdjustedChanged)
          ..text = adjustedStr
          ..addListener(_onQuantityAdjustedChanged);
      }
    }
    notifyListeners();
  }

  /// Sets the selected reason.
  void setReason(String? reason) {
    _selectedReason = reason;
    notifyListeners();
  }

  /// Notifies listeners of changes.
  void notifier() {
    notifyListeners();
  }

  /// Submits the inventory adjustment.
  Future<bool> submit() async {
    if (!isValid) return false;

    _isLoading = true;
    notifyListeners();

    final bool success = await _viewModel.adjustInventory(
      productId: _viewModel.productId,
      storeId: inventoryItemStream?.level.storeId ?? '',
      quantityChange: int.tryParse(newQuantityOnHandController.text) ?? 0,
      reason: effectiveReason,
      notes: notesController.text,
    );

    _isLoading = false;
    notifyListeners();

    return success;
  }

  @override
  void dispose() {
    quantityAdjustedController.removeListener(_onQuantityAdjustedChanged);
    newQuantityOnHandController.removeListener(_onNewQuantityChanged);
    quantityAdjustedController.dispose();
    newQuantityOnHandController.dispose();
    customReasonController.dispose();
    notesController.dispose();
    super.dispose();
  }
}
