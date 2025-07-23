import 'package:flutter/material.dart' show Locale;
import 'package:intl/intl.dart';

/// The formatters.
class Formatters {
  /// Format the currency.
  static String formatCurrency(double amount, Locale locale) {
    const String frenchLocale = 'fr';
    const String englishLocale = 'en';

    return NumberFormat.currency(
      name: 'XAF',
      symbol: '${NumberFormat.simpleCurrency(name: 'XAF').currencySymbol} ',
      locale: locale.languageCode.toLowerCase() == frenchLocale
          ? frenchLocale
          : englishLocale,
    ).format(amount);
  }

  /// Format date in French locale.
  static String formatDate(DateTime date, Locale locale) {
    return DateFormat('EEEE d MMMM y', locale.languageCode).format(date);
  }

  /// Format time in 24-hour format.
  static String formatTime(DateTime date, Locale locale) {
    return DateFormat('HH:mm', locale.languageCode).format(date);
  }

  /// Format date and time as 'MMM dd, HH:mm'.
  static String formatDateTimeShort(DateTime date, Locale locale) {
    return DateFormat('MMM dd, HH:mm', locale.languageCode).format(date);
  }
}
