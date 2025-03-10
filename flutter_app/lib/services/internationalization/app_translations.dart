import 'package:get/get.dart';

import 'internationalization.dart';

/// The [AppTranslations] class is a subclass of the [Translations] class
/// that is used to provide translations for the app.
class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    final result = <String, Map<String, String>>{};
    for (final entry
        in AppInternationalizationService.to.translations.entries) {
      for (final langEntry in entry.value.entries) {
        result.putIfAbsent(langEntry.key, () => {})[entry.key] =
            langEntry.value;
      }
    }

    return result;
  }
}
