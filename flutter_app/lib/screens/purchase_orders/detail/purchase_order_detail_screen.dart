import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../utils/user_preference.dart';
import '../../../widgets/loading.dart';
import '../../../widgets/shad_scaffold.dart';
import 'purchase_order_detail.dart';
import 'purchase_order_detail_controller.dart';
import 'purchase_order_detail_view_model.dart';

/// Standalone screen for a single purchase order.
class PurchaseOrderDetailScreen extends StatelessWidget {
  /// Creates a [PurchaseOrderDetailScreen] for displaying details of a specific purchase order.
  const PurchaseOrderDetailScreen({super.key, required this.purchaseOrderId});

  final String purchaseOrderId;

  @override
  Widget build(BuildContext context) {
    final prefs = context.watch<UserPreferences>();
    final store = prefs.store;
    final theme = ShadTheme.of(context);

    if (store == null) {
      return Scaffold(
        body: Center(
          child: Text('Aucun magasin sélectionné.', style: theme.textTheme.p),
        ),
      );
    }

    return ChangeNotifierProvider<PurchaseOrderDetailController>(
      create: (_) => PurchaseOrderDetailController(
        purchaseOrderId: purchaseOrderId,
        storeId: store.refId,
      ),
      child: _PurchaseOrderScreenBody(purchaseOrderId: purchaseOrderId),
    );
  }
}

class _PurchaseOrderScreenBody extends StatelessWidget {
  const _PurchaseOrderScreenBody({required this.purchaseOrderId});

  final String purchaseOrderId;

  @override
  Widget build(BuildContext context) {
    final detailController = Provider.of<PurchaseOrderDetailController>(
      context,
    );
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;
    final prefs = context.watch<UserPreferences>();

    return ShadScaffold(
      title: Text(purchaseOrderId),
      body: StreamBuilder<PurchaseOrderDetailSnapshot>(
        stream: detailController.detailStream,
        builder: (context, snapshot) {
          if (detailController.isLoading && !snapshot.hasData) {
            return const Center(child: Loading());
          }

          if (detailController.errorMessage.isNotEmpty && !snapshot.hasData) {
            return _ErrorBody(
              message: detailController.errorMessage,
              onRetry: detailController.reload,
            );
          }

          final snapshot_ = snapshot.data;
          final po = snapshot_?.po;
          if (snapshot_ == null || po == null) {
            return _NotFoundBody(theme: theme, cs: cs);
          }

          return PurchaseOrderDetail(
            po: po,
            bills: snapshot_.bills,
            receivingNotes: snapshot_.receivingNotes,
            payments: detailController.payments,
            storeId: prefs.store?.refId ?? '',
            currentUserId: prefs.userId ?? '',
          );
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
              child: const Text('Réessayer'),
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
            'Bon de commande introuvable.',
            style: theme.textTheme.p.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
