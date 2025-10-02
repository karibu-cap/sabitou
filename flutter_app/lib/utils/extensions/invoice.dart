import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../services/internationalization/internationalization.dart';
import '../../themes/app_colors.dart';

/// The payment.
extension PaymentMethodExtension on PaymentMethod {
  /// The payment icon.
  IconData get icon {
    return switch (this) {
      PaymentMethod.PAYMENT_METHOD_CASH => LucideIcons.banknote400,
      PaymentMethod.PAYMENT_METHOD_CREDIT_CARD => LucideIcons.creditCard400,
      PaymentMethod.PAYMENT_METHOD_ORANGE_MONEY => LucideIcons.smartphone400,
      PaymentMethod.PAYMENT_METHOD_MOBILE_MONEY => LucideIcons.smartphone400,
      PaymentMethod.PAYMENT_METHOD_MTN_MONEY => LucideIcons.smartphone400,
      PaymentMethod.PAYMENT_METHOD_VOUCHER => LucideIcons.ticket400,
      _ => LucideIcons.banknote400,
    };
  }

  /// The payment method label.
  String get label {
    return switch (this) {
      PaymentMethod.PAYMENT_METHOD_CASH => Intls.to.cash,
      PaymentMethod.PAYMENT_METHOD_CREDIT_CARD => Intls.to.card,
      PaymentMethod.PAYMENT_METHOD_ORANGE_MONEY => Intls.to.orangeMoney,
      PaymentMethod.PAYMENT_METHOD_MTN_MONEY => Intls.to.mtnMoney,
      PaymentMethod.PAYMENT_METHOD_MOBILE_MONEY => Intls.to.mobileMoney,
      PaymentMethod.PAYMENT_METHOD_VOUCHER => Intls.to.voucher,
      _ => Intls.to.unknown,
    };
  }
}

/// The invoice status extension.
extension InvoiceStatusExtension on InvoiceStatus {
  /// The invoice status label.
  String get label {
    return switch (this) {
      InvoiceStatus.INVOICE_STATUS_DRAFT => Intls.to.draft,
      InvoiceStatus.INVOICE_STATUS_ISSUED => Intls.to.issued,
      InvoiceStatus.INVOICE_STATUS_UNPAID => Intls.to.unpaid,
      InvoiceStatus.INVOICE_STATUS_PARTIALLY_PAID => Intls.to.partiallyPaid,
      InvoiceStatus.INVOICE_STATUS_PAID => Intls.to.paid,
      InvoiceStatus.INVOICE_STATUS_OVERDUE => Intls.to.overdue,
      InvoiceStatus.INVOICE_STATUS_CANCELLED => Intls.to.cancelled,
      InvoiceStatus.INVOICE_STATUS_CREDITED => Intls.to.credited,
      _ => Intls.to.pending,
    };
  }

  /// The invoice status color.
  Color get color {
    return switch (this) {
      InvoiceStatus.INVOICE_STATUS_DRAFT => AppColors.orange500,
      InvoiceStatus.INVOICE_STATUS_ISSUED => AppColors.orange500,
      InvoiceStatus.INVOICE_STATUS_UNPAID => AppColors.orange500,
      InvoiceStatus.INVOICE_STATUS_PARTIALLY_PAID => AppColors.orange500,
      InvoiceStatus.INVOICE_STATUS_PAID => AppColors.dartGreen,
      InvoiceStatus.INVOICE_STATUS_OVERDUE => AppColors.orange500,
      InvoiceStatus.INVOICE_STATUS_CANCELLED => AppColors.orange500,
      InvoiceStatus.INVOICE_STATUS_CREDITED => AppColors.orange500,
      _ => AppColors.grey500,
    };
  }
}

/// The voucher status extension.
extension VoucherStatusExtension on VoucherStatus {
  /// The voucher status label.
  String get label {
    return switch (this) {
      VoucherStatus.VOUCHER_STATUS_ACTIVE => Intls.to.active,
      VoucherStatus.VOUCHER_STATUS_PARTIALLY_USED => Intls.to.partiallyUsed,
      VoucherStatus.VOUCHER_STATUS_FULLY_USED => Intls.to.fullyUsed,
      VoucherStatus.VOUCHER_STATUS_EXPIRED => Intls.to.expired,
      VoucherStatus.VOUCHER_STATUS_CANCELLED => Intls.to.cancelled,
      _ => Intls.to.unknown,
    };
  }

  /// The voucher status color.
  Color get color {
    return switch (this) {
      VoucherStatus.VOUCHER_STATUS_ACTIVE => AppColors.dartGreen,
      VoucherStatus.VOUCHER_STATUS_PARTIALLY_USED => AppColors.orange500,
      VoucherStatus.VOUCHER_STATUS_FULLY_USED => AppColors.orange500,
      VoucherStatus.VOUCHER_STATUS_EXPIRED => AppColors.orange500,
      VoucherStatus.VOUCHER_STATUS_CANCELLED => AppColors.orange500,
      _ => AppColors.grey500,
    };
  }
}
