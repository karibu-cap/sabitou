import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:sabitou_clients/services/internationalization/internationalization.dart';
import 'package:sabitou_clients/services/storage/app_storage.dart';

void main() {
  group('AppInternationalization', () {
    late AppInternationalizationService appInt;
    setUp(() {
      final storage = AppStorageService(AppStorageType.fake);
      GetIt.I.registerSingletonIfAbsent<AppStorageService>(() => storage);

      appInt = AppInternationalizationService(const Locale('en'), storage);
      GetIt.I.registerSingletonIfAbsent<AppInternationalizationService>(
        () => appInt,
      );
    });

    test('Initial locale should be English', () {
      expect(appInt.locale.languageCode, equals('en'));
    });

    test('Translate should return correct translation for existing key', () {
      expect(appInt.translate('cancel'), equals('Cancel'));
      expect(
        AppInternationalizationService(
          const Locale('fr'),
          AppStorageService.to,
        ).translate('cancel'),
        equals('Annuler'),
      );
    });

    test(
      'Translate should return key for _placeholder_ for non existing translation',
      () {
        expect(appInt.translate('non_existent_key'), equals('_placeholder_'));
      },
    );
    test('Translate should handle parameter substitution', () {
      AppInternationalizationService.to.translations['greeting'] = {
        'en': 'Hello, @name!',
        'fr': 'Bonjour, @name!',
      };
      expect(
        AppInternationalizationService.to.translate(
          'greeting',
          args: {'name': 'Alice'},
        ),
        equals('Hello, Alice!'),
      );

      final appIn = AppInternationalizationService(
        const Locale('fr'),
        AppStorageService.to,
      );
      appIn.translations['greeting'] = {
        'en': 'Hello, @name!',
        'fr': 'Bonjour, @name!',
      };
      expect(
        appIn.translate('greeting', args: {'name': 'Alice'}),
        equals('Bonjour, Alice!'),
      );
    });

    test('Supported locales should contain English and French', () {
      expect(
        AppInternationalizationService.supportedLocales,
        contains(const Locale('en')),
      );
      expect(
        AppInternationalizationService.supportedLocales,
        contains(const Locale('fr')),
      );
    });
  });
}
