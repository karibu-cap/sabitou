import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../repositories/receiving_note_repository.dart';

/// ViewModel scoped to ONE receiving note.
class ReceivingNoteDetailViewModel {
  /// A ViewModel scoped to ONE receiving note.
  /// [receivingNoteId] The ID of the receiving note to manage.
  /// [storeId] The ID of the store this receiving note is related to.
  ReceivingNoteDetailViewModel({
    required this.receivingNoteId,
    required this.storeId,
  });

  /// The ID of the receiving note to manage.
  final String receivingNoteId;

  /// The ID of the store this receiving note is related to.
  final String storeId;

  final _repo = ReceivingNoteRepository.instance;

  /// Watches the current receiving note with its line items.
  Stream<ReceivingNote?> get receivingNoteStream =>
      _repo.watchReceivingNote(receivingNoteId);

  /// Merges all reactive streams into one snapshot used by the detail screen.
  Stream<ReceivingNoteDetailSnapshot> get detailStream =>
      receivingNoteStream.map(
        (note) => ReceivingNoteDetailSnapshot(note: note),
      );
}

/// Snapshot of a receiving note.
class ReceivingNoteDetailSnapshot {
  /// Constructor of new [ReceivingNoteDetailSnapshot].
  const ReceivingNoteDetailSnapshot({this.note});

  /// The receiving note. `null` if not available.
  final ReceivingNote? note;

  /// Returns whether the snapshot contains a receiving note.
  bool get hasNote => note != null;
}
