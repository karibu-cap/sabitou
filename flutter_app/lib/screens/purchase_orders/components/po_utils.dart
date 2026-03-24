import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_theme.dart';

/// Style bundle for a given PurchaseOrderStatus.
class PoStatusStyle {
  const PoStatusStyle({
    required this.label,
    required this.bg,
    required this.fg,
    required this.dot,
    required this.icon,
    required this.topBarColor,
  });

  final String label;
  final Color bg;
  final Color fg;
  final Color dot;
  final IconData icon;
  final Color topBarColor;
}

abstract class PoStatusUtils {
  static const Color _infoSoft = SabitouColors.infoSoft;
  static const Color _infoText = Color(0xFF1E40AF);
  static const Color _infoDot = Color(0xFF3B82F6);

  static const Color _successSoft = SabitouColors.successSoft;
  static const Color _successText = SabitouColors.successForeground;
  static const Color _successDot = SabitouColors.success;
  static const Color _dangerSoft = SabitouColors.dangerSoft;
  static const Color _dangerText = SabitouColors.dangerForeground;
  static const Color _dangerDot = SabitouColors.danger;
  static const Color _amberSoft = SabitouColors.accentSoft;
  static const Color _amberText = SabitouColors.accentForeground;
  static const Color _amberDot = SabitouColors.accentSoft;
  static const Color _neutralBg = SabitouColors.purpleSoft;
  static const Color _neutralText = SabitouColors.infoText;
  static const Color _neutralDot = SabitouColors.infoSoft;

  static PoStatusStyle styleFor(PurchaseOrderStatus status) {
    return switch (status) {
      PurchaseOrderStatus.PO_STATUS_DRAFT => const PoStatusStyle(
        label: 'Brouillon',
        bg: _neutralBg,
        fg: _neutralText,
        dot: _neutralDot,
        icon: LucideIcons.filePen,
        topBarColor: _neutralDot,
      ),
      PurchaseOrderStatus.PO_STATUS_PENDING => PoStatusStyle(
        label: Intls.to.pending,
        bg: _amberSoft,
        fg: _amberText,
        dot: _amberDot,
        icon: LucideIcons.clock,
        topBarColor: _amberDot,
      ),
      PurchaseOrderStatus.PO_STATUS_PARTIALLY_RECEIVED => PoStatusStyle(
        label: Intls.to.partial,
        bg: _infoSoft,
        fg: _infoText,
        dot: _infoDot,
        icon: LucideIcons.packageSearch,
        topBarColor: _infoDot,
      ),
      PurchaseOrderStatus.PO_STATUS_RECEIVED => PoStatusStyle(
        label: Intls.to.received,
        bg: _successSoft,
        fg: _successText,
        dot: _successDot,
        icon: LucideIcons.packageCheck,
        topBarColor: _successDot,
      ),
      PurchaseOrderStatus.PO_STATUS_CANCELLED => PoStatusStyle(
        label: Intls.to.cancelled,
        bg: _dangerSoft,
        fg: _dangerText,
        dot: _dangerDot,
        icon: LucideIcons.ban,
        topBarColor: _dangerDot,
      ),
      _ => PoStatusStyle(
        label: Intls.to.unknown,
        bg: _neutralBg,
        fg: _neutralText,
        dot: _neutralDot,
        icon: LucideIcons.circleQuestionMark400,
        topBarColor: _neutralDot,
      ),
    };
  }

  /// Whether a PO can accept new receiving notes.
  static bool canReceive(PurchaseOrderStatus status) =>
      status == PurchaseOrderStatus.PO_STATUS_PENDING ||
      status == PurchaseOrderStatus.PO_STATUS_PARTIALLY_RECEIVED;

  /// Whether a PO can generate a bill.
  static bool canGenerateBill(PurchaseOrderStatus status) =>
      status != PurchaseOrderStatus.PO_STATUS_DRAFT &&
      status != PurchaseOrderStatus.PO_STATUS_CANCELLED;

  /// Whether a PO can be cancelled.
  static bool canCancel(PurchaseOrderStatus status) =>
      status == PurchaseOrderStatus.PO_STATUS_DRAFT ||
      status == PurchaseOrderStatus.PO_STATUS_PENDING;

  /// Progress fraction of received items across all line items.
  static double receiveProgress(PurchaseOrder po) {
    if (po.items.isEmpty) return 0;
    final totalOrdered = po.items.fold<int>(
      0,
      (sum, i) => sum + i.quantityOrdered,
    );
    final totalReceived = po.items.fold<int>(
      0,
      (sum, i) => sum + i.quantityReceived,
    );
    if (totalOrdered == 0) return 0;

    return (totalReceived / totalOrdered).clamp(0.0, 1.0);
  }
}

class PoStatusPill extends StatelessWidget {
  const PoStatusPill({super.key, required this.status, this.large = false});

  final PurchaseOrderStatus status;
  final bool large;

  @override
  Widget build(BuildContext context) {
    final s = PoStatusUtils.styleFor(status);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: large ? 12 : 8,
        vertical: large ? 5 : 3,
      ),
      decoration: BoxDecoration(
        color: s.bg,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: large ? 7 : 5,
            height: large ? 7 : 5,
            decoration: BoxDecoration(color: s.dot, shape: BoxShape.circle),
          ),
          SizedBox(width: large ? 6 : 5),
          Text(
            s.label,
            style: TextStyle(
              fontSize: large ? 12 : 11,
              fontWeight: FontWeight.w500,
              color: s.fg,
            ),
          ),
        ],
      ),
    );
  }
}

class PoProgressIndicator extends StatelessWidget {
  const PoProgressIndicator({
    super.key,
    required this.label,
    required this.progress, // 0.0 to 1.0
    required this.activeColor,
  });

  final String label;
  final double progress;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    final cs = ShadTheme.of(context).colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _ProgressCircle(
          progress: progress,
          color: activeColor,
          emptyColor: cs.border,
        ),
        const SizedBox(width: 4),
        Text(label, style: TextStyle(fontSize: 11, color: cs.mutedForeground)),
      ],
    );
  }
}

class _ProgressCircle extends StatelessWidget {
  const _ProgressCircle({
    required this.progress,
    required this.color,
    required this.emptyColor,
  });

  final double progress;
  final Color color;
  final Color emptyColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 14,
      height: 14,
      child: CustomPaint(
        painter: _ProgressCirclePainter(
          progress: progress,
          color: color,
          emptyColor: emptyColor,
        ),
      ),
    );
  }
}

class _ProgressCirclePainter extends CustomPainter {
  const _ProgressCirclePainter({
    required this.progress,
    required this.color,
    required this.emptyColor,
  });

  final double progress;
  final Color color;
  final Color emptyColor;

  @override
  void paint(Canvas canvas, Size size) {
    final r = size.width / 2;
    final c = Offset(r, r);
    final emptyPaint = Paint()
      ..color = emptyColor
      ..style = PaintingStyle.fill;
    final fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawCircle(c, r, emptyPaint);
    if (progress > 0) {
      final path = Path()
        ..moveTo(r, r)
        ..arcTo(
          Rect.fromCircle(center: c, radius: r),
          -90 * (3.14159 / 180),
          360 * progress * (3.14159 / 180),
          false,
        )
        ..close();
      canvas.drawPath(path, fillPaint);
    }
  }

  @override
  bool shouldRepaint(_ProgressCirclePainter old) =>
      old.progress != progress || old.color != color;
}
