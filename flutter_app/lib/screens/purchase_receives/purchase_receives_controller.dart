import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import 'purchase_receives_view_model.dart';

/// Controller for the Purchase Receives screen.
final class PurchaseReceivesController extends ChangeNotifier {
  /// Constructs a new [PurchaseReceivesController].
  PurchaseReceivesController(this._viewModel);

  final PurchaseReceivesViewModel _viewModel;

  /// Gets the receiving notes subject.
  BehaviorSubject<UnmodifiableListView<ReceivingNote>>
  get receivingNotesSubject => _viewModel.receivingNotesSubject;

  /// Gets the filtered receiving notes stream.
  Stream<List<ReceivingNote>> get filteredReceivingNotesStream =>
      _viewModel.filteredReceivingNotesStream;

  /// Gets the error stream.
  Stream<String> get errorStream => _viewModel.errorStream;

  /// Gets the loading stream.
  Stream<bool> get loadingStream => _viewModel.loadingStream;

  /// Gets the search query subject.
  BehaviorSubject<String> get searchQuery => _viewModel.searchQuery;

  /// Refreshes the receiving notes list.
  Future<void> refreshReceivingNotes() async {
    await _viewModel.refreshReceivingNotes();
    notifyListeners();
  }

  /// Updates the search query.
  void updateSearchQuery(String query) {
    _viewModel.updateSearchQuery(query);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

