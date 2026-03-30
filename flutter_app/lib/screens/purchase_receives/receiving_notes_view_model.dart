import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../repositories/receiving_note_repository.dart';

/// Filter options available on the Purchase Receives list screen.
enum RnStatusFilter {
  /// Show all receiving notes regardless of compliance.
  all,

  /// Show only notes where every item was accepted (zero rejections).
  received,

  /// Show only notes that contain at least one rejected item.
  withIssues,

  /// Show notes where some items have not yet been fully received.
  pending,
}

/// ViewModel for the Purchase Receives dashboard screen.
///
/// Owns the search [BehaviorSubject] and the status-filter [BehaviorSubject],
/// and derives a reactive filtered stream by combining all three inputs.
class ReceivingNotesViewModel {
  /// Constructs a [ReceivingNotesViewModel] scoped to [storeId].
  ReceivingNotesViewModel({required this.storeId});

  /// The store identifier used to scope all streams.
  final String storeId;

  final _repo = ReceivingNoteRepository.instance;

  final _searchSubject = BehaviorSubject<String>.seeded('');
  final _statusFilterSubject = BehaviorSubject<RnStatusFilter>.seeded(
    RnStatusFilter.all,
  );

  /// The current search query subject.
  BehaviorSubject<String> get searchQuery => _searchSubject;

  /// The current status filter subject.
  BehaviorSubject<RnStatusFilter> get statusFilter => _statusFilterSubject;

  /// Returns `true` when search or filter is active.
  bool get isFiltered =>
      _searchSubject.value.isNotEmpty ||
      _statusFilterSubject.value != RnStatusFilter.all;

  /// Raw unfiltered stream of all [ReceivingNote]s for the store.
  Future<List<ReceivingNote>> get rawFuture =>
      _repo.listReceivingNotes(storeId: storeId);

  /// Filtered and searched stream derived from [rawFuture].
  Stream<List<ReceivingNote>> get filteredStream => Rx.combineLatest3(
    Stream.fromFuture(rawFuture),
    _searchSubject.stream,
    _statusFilterSubject.stream,
    (notes, search, filter) {
      var list = notes.toList();

      if (search.isNotEmpty) {
        final q = search.toLowerCase();
        list = list
            .where(
              (n) =>
                  n.refId.toLowerCase().contains(q) ||
                  n.supplierId.toLowerCase().contains(q) ||
                  n.relatedPurchaseOrderId.toLowerCase().contains(q),
            )
            .toList();
      }

      switch (filter) {
        case RnStatusFilter.all:
          break;
        case RnStatusFilter.received:
          list = list
              .where((n) => n.items.every((i) => i.quantityRejected == 0))
              .toList();
        case RnStatusFilter.withIssues:
          list = list
              .where((n) => n.items.any((i) => i.quantityRejected > 0))
              .toList();
        case RnStatusFilter.pending:
          list = list
              .where(
                (n) =>
                    n.items.any((i) => i.quantityReceived < i.quantityExpected),
              )
              .toList();
      }

      return list;
    },
  );

  /// Disposes the [BehaviorSubject]s owned by this view model.
  void dispose() {
    _searchSubject.close();
    _statusFilterSubject.close();
  }
}
