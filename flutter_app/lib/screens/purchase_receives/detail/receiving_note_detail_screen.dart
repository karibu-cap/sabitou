import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/user_preference.dart';
import '../../../widgets/loading.dart';
import '../../../widgets/no_business_view.dart';
import '../../../widgets/shad_scaffold.dart';
import 'receiving_note_detail.dart';
import 'receiving_note_detail_controller.dart';
import 'receiving_note_detail_view_model.dart';

/// Standalone screen for a single receiving note.
class ReceivingNoteDetailScreen extends StatelessWidget {
  /// Creates a [ReceivingNoteDetailScreen] for displaying details of a specific receiving note.
  const ReceivingNoteDetailScreen({super.key, required this.receivingNoteId});

  /// The current receiving note id.
  final String receivingNoteId;

  @override
  Widget build(BuildContext context) {
    final prefs = context.watch<UserPreferences>();
    final store = prefs.store;

    if (store == null) {
      return const Scaffold(body: Center(child: NoBusinessView()));
    }

    return ChangeNotifierProvider<ReceivingNoteDetailController>(
      create: (_) => ReceivingNoteDetailController(
        receivingNoteId: receivingNoteId,
        storeId: store.refId,
      ),
      child: _ReceivingNoteScreenBody(receivingNoteId: receivingNoteId),
    );
  }
}

class _ReceivingNoteScreenBody extends StatelessWidget {
  const _ReceivingNoteScreenBody({required this.receivingNoteId});

  final String receivingNoteId;

  @override
  Widget build(BuildContext context) {
    final detailController = Provider.of<ReceivingNoteDetailController>(
      context,
    );
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return ShadScaffold(
      title: Text(receivingNoteId),
      body: StreamBuilder<ReceivingNoteDetailSnapshot>(
        stream: detailController.detailStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              detailController.isLoading && !snapshot.hasData) {
            return const Center(child: Loading());
          }

          if (detailController.errorMessage.isNotEmpty && !snapshot.hasData) {
            return _ErrorBody(
              message: detailController.errorMessage,
              onRetry: detailController.reload,
            );
          }

          final snapshot_ = snapshot.data;
          final note = snapshot_?.note;
          if (snapshot_ == null || note == null) {
            return _NotFoundBody(theme: theme, cs: cs);
          }

          return ReceivingNoteDetail(note: note);
        },
      ),
    );
  }
}

class _ErrorBody extends StatelessWidget {
  const _ErrorBody({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(LucideIcons.circleAlert, size: 40, color: cs.mutedForeground),
            const SizedBox(height: 14),
            Text(
              message,
              style: theme.textTheme.p.copyWith(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ShadButton.outline(
              onPressed: onRetry,
              leading: const Icon(LucideIcons.refreshCw, size: 14),
              child: Text(Intls.to.tryAgain),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotFoundBody extends StatelessWidget {
  const _NotFoundBody({required this.theme, required this.cs});
  final ShadThemeData theme;
  final ShadColorScheme cs;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(LucideIcons.clipboardX, size: 40, color: cs.mutedForeground),
          const SizedBox(height: 14),
          Text(
            Intls.to.receivingNoteNotFound,
            style: theme.textTheme.p.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
