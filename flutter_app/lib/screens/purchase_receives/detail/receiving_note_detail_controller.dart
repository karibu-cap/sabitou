import 'dart:async';

import 'package:flutter/material.dart';

import 'receiving_note_detail_view_model.dart';

/// Controller for the receiving note detail screen.
class ReceivingNoteDetailController extends ChangeNotifier {
  /// Creates a new [ReceivingNoteDetailController].
  ReceivingNoteDetailController({
    required this.receivingNoteId,
    required this.storeId,
  }) : _viewModel = ReceivingNoteDetailViewModel(
         receivingNoteId: receivingNoteId,
         storeId: storeId,
       );

  final ReceivingNoteDetailViewModel _viewModel;

  /// The ID of the store to which this receiving note belongs.
  final String storeId;

  /// The ID of the receiving note being viewed.
  final String receivingNoteId;

  String _errorMessage = '';
  bool _isLoading = false;
  String _successMessage = '';

  /// `true` while an async operation is in progress.
  bool get isLoading => _isLoading;

  /// Non-empty when the last action produced an error.
  String get errorMessage => _errorMessage;

  /// Non-empty when the last action produced a success notification.
  String get successMessage => _successMessage;

  /// Reactive stream of the receiving note.
  Stream<ReceivingNoteDetailSnapshot> get detailStream =>
      _viewModel.detailStream;

  /// Re-fetches the receiving note data.
  Future<void> reload() async {
    _setLoading(true);
    // The stream will automatically emit updated data
    _setLoading(false);
  }

  /// Clears the current error message.
  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }

  /// Clears the current success message.
  void clearSuccess() {
    _successMessage = '';
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _setLoading(bool v) {
    _isLoading = v;
    _errorMessage = '';
    _successMessage = '';
    notifyListeners();
  }
}
