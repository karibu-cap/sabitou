import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import 'receiving_notes_view_model.dart';

/// Controller for the Purchase Receives dashboard screen.
///
/// Manages the search and filter state by delegating to
/// [ReceivingNotesViewModel], and holds the [selectedNote] used by the
/// desktop split-panel right side.
class ReceivingNotesController extends ChangeNotifier {
  /// Constructs a [ReceivingNotesController] with [viewModel].
  ReceivingNotesController(this._viewModel) {
    searchController = TextEditingController();
  }

  final ReceivingNotesViewModel _viewModel;

  /// Text controller bound to the search input field.
  late final TextEditingController searchController;

  ReceivingNote? _selectedNote;

  /// The currently selected [ReceivingNote], shown in the desktop detail panel.
  ReceivingNote? get selectedNote => _selectedNote;

  /// Returns `true` when search or filter is active.
  bool get isFiltered => _viewModel.isFiltered;

  /// The current search query subject.
  BehaviorSubject<String> get searchQuery => _viewModel.searchQuery;

  /// The current status filter subject.
  BehaviorSubject<RnStatusFilter> get statusFilter => _viewModel.statusFilter;

  /// Raw unfiltered stream of all receiving notes.
  Future<List<ReceivingNote>> get rawFuture => _viewModel.rawFuture;

  /// Filtered and searched stream of receiving notes.
  Stream<List<ReceivingNote>> get filteredStream => _viewModel.filteredStream;

  /// Selects [note] as the active detail item (desktop split view).
  void selectNote(ReceivingNote note) {
    if (_selectedNote?.refId == note.refId) {
      return;
    }
    _selectedNote = note;
    notifyListeners();
  }

  /// Clears the current selection.
  void clearSelection() {
    _selectedNote = null;
    notifyListeners();
  }

  /// Resets search query and status filter to their default values.
  void clearFilters() {
    searchQuery.add('');
    statusFilter.add(RnStatusFilter.all);
    searchController.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    _viewModel.dispose();
    super.dispose();
  }
}
