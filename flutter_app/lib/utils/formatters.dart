import 'dart:ui';

import 'package:clock/clock.dart';
import 'package:geo_currencies/geo_currencies.dart';
import 'package:intl/intl.dart';

import '../services/internationalization/internationalization.dart';

/// The formatters.
class Formatters {
  /// Format the currency.
  static String formatCurrency(double amount) {
    final GeoCurrencies geoCurrencies = GeoCurrencies(
      config: GeoCurrenciesConfig(
        geoCurrenciesType: GeoCurrenciesType.live,
        decimalDigits: 2,
        decimalSeparator: '.',
        includeSymbol: true,
        symbolSeparator: ' ',
        locale: AppInternationalizationService.to.locale,
        thousandSeparator: ',',
      ),
    );

    return geoCurrencies.formatAmountWithCurrencyCode(
      amount: amount,
      currencyCodeIso4217: 'XAF',
    );
  }

  /// Format date in French locale.
  static String formatDate(DateTime date) {
    return DateFormat(
      'EEEE d MMMM y',
      AppInternationalizationService.to.locale.languageCode,
    ).format(date);
  }

  /// Format time in 24-hour format.
  static String formatTime(DateTime date) {
    return DateFormat(
      'HH:mm',
      AppInternationalizationService.to.locale.languageCode,
    ).format(date);
  }

  /// Format date and time as 'MMM dd, HH:mm'.
  static String formatDateTimeShort(DateTime date) {
    return DateFormat(
      'MMM dd, HH:mm',
      AppInternationalizationService.to.locale.languageCode,
    ).format(date);
  }

  /// Format the distance to now.
  static String formatDistanceToNow(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 0) {
      return Intls.to.ago.trParams({
        'when': difference.inDays.toString(),
        'next': '${Intls.to.days}${difference.inDays > 1 ? 's' : ''}',
      });
    } else if (difference.inHours > 0) {
      return Intls.to.ago.trParams({
        'when': difference.inHours.toString(),
        'next': '${Intls.to.hours}${difference.inHours > 1 ? 's' : ''}',
      });
    } else if (difference.inMinutes > 0) {
      return Intls.to.ago.trParams({
        'when': difference.inMinutes.toString(),
        'next': '${Intls.to.minutes}${difference.inMinutes > 1 ? 's' : ''}',
      });
    } else {
      return Intls.to.now;
    }
  }

  /// Format the duration to now.
  static String? formatDurationToNow(DateTime date) {
    final now = clock.now();
    final difference = date.difference(now);

    if (difference.inDays > 0 && difference.inDays > 30) {
      return '${(difference.inDays / 30).floor().toString()} ${Intls.to.months}';
    } else if (difference.inDays > 0) {
      return '${difference.inDays.toString()} ${Intls.to.days}';
    } else if (difference.inHours > 0) {
      return '${difference.inHours.toString()} ${Intls.to.hours}';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes.toString()} ${Intls.to.minutes}';
    } else {
      return null;
    }
  }
}
