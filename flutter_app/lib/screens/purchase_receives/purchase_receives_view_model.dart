import 'dart:collection';

import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../repositories/receiving_note_repository.dart';
import '../../utils/logger.dart';
import '../../utils/user_preference.dart';

/// View model for the Purchase Receives screen.
final class PurchaseReceivesViewModel {
  final LoggerApp _logger = LoggerApp('PurchaseReceivesViewModel');

  /// Gets the user preferences.
  final UserPreferences userPreferences = UserPreferences.instance;

  final _receivingNotesSubject =
      BehaviorSubject<UnmodifiableListView<ReceivingNote>>.seeded(
        UnmodifiableListView([]),
      );

  final _errorSubject = BehaviorSubject<String>.seeded('');
  final _loadingSubject = BehaviorSubject<bool>.seeded(false);
  final _searchQuerySubject = BehaviorSubject<String>.seeded('');

  /// Gets the receiving notes stream.
  BehaviorSubject<UnmodifiableListView<ReceivingNote>>
  get receivingNotesSubject => _receivingNotesSubject;

  /// Gets the error stream.
  Stream<String> get errorStream => _errorSubject.stream;

  /// Gets the loading stream.
  Stream<bool> get loadingStream => _loadingSubject.stream;

  /// Gets the search query subject.
  BehaviorSubject<String> get searchQuery => _searchQuerySubject;

  /// Gets the filtered receiving notes stream.
  Stream<List<ReceivingNote>> get filteredReceivingNotesStream =>
      Rx.combineLatest2(
        _receivingNotesSubject.stream,
        _searchQuerySubject.stream,
        (notes, searchQuery) {
          var filtered = notes.toList();

          if (searchQuery.isNotEmpty) {
            filtered = filtered.where((note) {
              return note.refId.toLowerCase().contains(
                    searchQuery.toLowerCase(),
                  ) ||
                  note.relatedPurchaseOrderId.toLowerCase().contains(
                    searchQuery.toLowerCase(),
                  );
            }).toList();
          }

          filtered.sort(
            (a, b) => b.createdAt
                .toDateTime()
                .compareTo(a.createdAt.toDateTime()),
          );

          return filtered;
        },
      );

  /// Constructs a new [PurchaseReceivesViewModel].
  PurchaseReceivesViewModel() {
    _loadReceivingNotes();
  }

  /// Loads all receiving notes for the current store.
  Future<void> _loadReceivingNotes() async {
    try {
      _loadingSubject.add(true);
      final store = userPreferences.store;
      if (store == null) {
        _logger.warning('Store not found');

        return;
      }

      final notes = await ReceivingNoteRepository.instance.listReceivingNotes(
        storeId: store.refId,
      );
      _receivingNotesSubject.add(UnmodifiableListView(notes));
    } on Exception catch (e) {
      _logger.severe('Error loading receiving notes: $e');
      _errorSubject.add('Failed to load receiving notes');
    } finally {
      _loadingSubject.add(false);
    }
  }

  /// Refreshes the receiving notes list.
  Future<void> refreshReceivingNotes() async {
    await _loadReceivingNotes();
  }

  /// Updates the search query.
  void updateSearchQuery(String query) {
    _searchQuerySubject.add(query);
  }

  /// Disposes the view model.
  void dispose() {
    _receivingNotesSubject.close();
    _errorSubject.close();
    _loadingSubject.close();
    _searchQuerySubject.close();
  }
}
