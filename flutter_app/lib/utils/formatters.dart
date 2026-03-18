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
        decimalDigits: 0,
        decimalSeparator: '.',
        includeSymbol: true,
        symbolSeparator: ' ',
        locale: AppInternationalizationService.to.locale,
        thousandSeparator: ',',
      ),
    );

    return geoCurrencies.formatAmountWithCurrencySymbol(
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
    final now = clock.now();
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

  static String timeAgo(DateTime dt) {
    final diff = DateTime.now().toUtc().difference(dt.toUtc());
    if (diff.inMinutes < 1) {
      return Intls.to.justNow;
    }
    if (diff.inMinutes < 60) {
      return Intls.to.minutesAgo.trParams({'count': diff.inMinutes.toString()});
    }
    if (diff.inHours < 24) {
      return Intls.to.hoursAgo.trParams({'count': diff.inHours.toString()});
    }

    return Intls.to.daysAgo.trParams({'count': diff.inDays.toString()});
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

  static String greeting() {
    final h = DateTime.now().hour;
    if (h < 12) return Intls.to.morning;
    if (h < 18) return Intls.to.afternoon;

    return Intls.to.evening;
  }

  static String hummainFormattedDate() {
    final now = DateTime.now();
    final days = [
      Intls.to.monday,
      Intls.to.tuesday,
      Intls.to.wednesday,
      Intls.to.thursday,
      Intls.to.friday,
      Intls.to.saturday,
      Intls.to.sunday,
    ];
    final months = [
      Intls.to.january,
      Intls.to.february,
      Intls.to.march,
      Intls.to.april,
      Intls.to.may,
      Intls.to.june,
      Intls.to.july,
      Intls.to.august,
      Intls.to.september,
      Intls.to.october,
      Intls.to.november,
      Intls.to.december,
    ];
    final day = days[now.weekday - 1];
    final month = months[now.month - 1];

    return '$day ${now.day} $month ${now.year}';
  }
}
