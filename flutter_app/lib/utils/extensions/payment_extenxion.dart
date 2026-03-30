import 'package:flutter/material.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../services/internationalization/internationalization.dart';

/// The extension for the [ProductCategory] enum.
extension PaymentMethodExtension on PaymentMethod {
  /// Get the type for the product category.
  String get label {
    if (this == PaymentMethod.PAYMENT_METHOD_CASH) {
      return Intls.to.cash;
    }
    if (this == PaymentMethod.PAYMENT_METHOD_CREDIT_CARD) {
      return Intls.to.creditCard;
    }
    if (this == PaymentMethod.PAYMENT_METHOD_ORANGE_MONEY) {
      return Intls.to.orangeMoney;
    }
    if (this == PaymentMethod.PAYMENT_METHOD_MTN_MONEY) {
      return Intls.to.mtnMoMo;
    }

    return Intls.to.unknown;
  }

  /// The icon for the payment method.
  IconData get icon {
    switch (this) {
      case PaymentMethod.PAYMENT_METHOD_CASH:
        return LucideIcons.banknote;
      case PaymentMethod.PAYMENT_METHOD_MOBILE_MONEY:
        return LucideIcons.smartphone;
      case PaymentMethod.PAYMENT_METHOD_CREDIT_CARD:
        return LucideIcons.creditCard;
      case PaymentMethod.PAYMENT_METHOD_VOUCHER:
        return LucideIcons.ticket;
      default:
        return LucideIcons.circleDollarSign;
    }
  }
}
