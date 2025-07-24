import 'dart:ui';

import 'package:get/get.dart';

import '../../utils/app_constants.dart';
import '../storage/app_storate.dart';

/// Extension method for easy access to translations.
extension TranslationExtension on String {
  /// Get the translation for the given key.
  ///
  /// If [args] is specified, named string substitution is performed on the
  /// translation string. For example, if the translation string is "Hello, {name}!"
  /// and [args] is {"name": "John"}, the result will be "Hello, John!".
  String trs([Map<String, String>? args]) {
    return Get.find<AppInternationalizationService>().translate(
      this,
      args: args,
    );
  }
}

/// AppInternalization defines all the 'local' strings displayed to.
class AppInternationalizationService extends GetxService {
  final _key = PreferencesKey.language;
  final AppStorageService _box;
  final Rx<Locale> _locale;

  /// The translations map key.
  Map<String, Map<String, String>> translations = {
    'sabitu': {'en': 'Sabitu', 'fr': 'Sabitou'},
    'cancel': {'en': 'Cancel', 'fr': 'Annuler'},
    'stores': {'en': 'Stores', 'fr': 'Magasins'},
    'dashboard': {'en': 'Dashboard', 'fr': 'Tableau de bord'},
    'signOut': {'en': 'Sign out', 'fr': 'Se deconnecter'},
    'setting': {'en': 'Setting', 'fr': 'Paramètres'},
    'searchForProduct': {
      'en': 'Search for product',
      'fr': 'Rechercher un produit',
    },
    'createAccount': {'en': 'Create account', 'fr': 'Creer un compte'},
    'loginEmailRequired': {
      'en': 'Email is required',
      'fr': 'L\'email est requis',
    },
    'loginEmailInvalid': {
      'en': 'Please enter a valid email address',
      'fr': 'Veuillez entrer une adresse email valide',
    },
    'loginPasswordRequired': {
      'en': 'Password is required',
      'fr': 'Le mot de passe est requis',
    },
    'loginPasswordLength': {
      'en': 'Password must be at least 6 characters',
      'fr': 'Le mot de passe doit comporter au moins 6 caractères',
    },
    'email': {'en': 'Email', 'fr': 'Email'},
    'password': {'en': 'Password', 'fr': 'Mot de passe'},
    'firstName': {'en': 'First name', 'fr': 'Prenom'},
    'lastName': {'en': 'Last name', 'fr': 'Nom'},
    'gettingStarted': {'en': 'Getting started', 'fr': 'Commencer'},
    'alreadyHaveAnAccount': {
      'en': 'Already have an account?',
      'fr': 'Vous avez deja un compte?',
    },
    'signIn': {'en': 'Sign in', 'fr': 'Se connecter'},
    'signUp': {'en': 'Sign up', 'fr': 'S\'inscrire'},
    'dontHaveAnAccount': {
      'en': 'Don\'t have an account?',
      'fr': 'Vous n\'avez pas de compte?',
    },
    'loginInYourAccount': {
      'en': 'Login in your account',
      'fr': 'Connectez-vous dans votre compte',
    },
    'forgotPassword': {'en': 'Forgot Password?', 'fr': 'Mot de passe oublié?'},
    'signInToYourAccount': {
      'en': 'Sign In To Your Account',
      'fr': 'Connectez-vous dans votre compte',
    },
    'welcomeBack': {'en': 'Welcome back', 'fr': 'Bienvenue'},
    'enterYourFirstName': {
      'en': 'Enter your first name',
      'fr': 'Entrez votre prenom',
    },
    'enterValidEmail': {
      'en': 'Enter valid email',
      'fr': 'Entrez un email valide',
    },
    'confirmPassword': {
      'en': 'Confirm password',
      'fr': 'Confirmer le mot de passe',
    },
    'passwordDoesNotMatch': {
      'en': 'Password does not match',
      'fr': 'Mot de passe ne correspond pas',
    },
    'enterYourLastName': {
      'en': 'Enter your last name',
      'fr': 'Entrez votre nom',
    },
    'passwordMustBeAtLeast6Characters': {
      'en': 'Password must be at least 6 characters',
      'fr': 'Le mot de passe doit contenir au moins 6 caractères',
    },
    'failed': {'en': 'Failed', 'fr': 'Echec'},
    'Success': {'en': 'Success', 'fr': 'Reussi'},
    'businessName': {'en': 'Business name', 'fr': 'Nom de l\'entreprise'},
    'businessDescription': {
      'en': 'Business description',
      'fr': 'Description de l\'entreprise',
    },
    'newStore': {'en': 'New store', 'fr': 'Nouveau magasin'},
    'storeName': {'en': 'Store name', 'fr': 'Nom du magasin'},
    'storeDescription': {
      'en': 'Store description',
      'fr': 'Description du magasin',
    },
    'storeAddress': {'en': 'Store address', 'fr': 'Adresse du magasin'},
    'save': {'en': 'Save', 'fr': 'Enregistrer'},
    'inputRequired': {'en': 'Input required', 'fr': 'Saisie requise'},
    'minimum3Characters': {
      'en': 'Minimum 3 characters',
      'fr': 'Minimum 3 caractères',
    },
    'storeForYourBusiness': {
      'en': 'Store for your business',
      'fr': 'Magasin pour votre entreprise',
    },
    'adminManager': {'en': 'Admin manager', 'fr': 'Gestionnaire admin'},
    'inventoryManager': {
      'en': 'Inventory manager',
      'fr': 'Gestionnaire des stocks',
    },
    'account': {'en': 'Account', 'fr': 'Compte'},
    'uploadNewPicture': {'en': 'New picture', 'fr': 'Nouvelle image'},
    'deletePicture': {'en': 'Delete picture', 'fr': 'Supprimer l\'image'},
    'contactEmail': {'en': 'Contact email', 'fr': 'Email de contact'},
    'manageYourAccountEmailAddress': {
      'en': 'Manage your account email address',
      'fr': 'Gérer l\'adresse email de votre compte',
    },
    'business': {'en': 'Business', 'fr': 'Entreprise'},
    'manageYourBusiness': {
      'en': 'Manage your business',
      'fr': 'Gérer votre entreprise',
    },
    'store': {'en': 'Store', 'fr': 'Magasin'},
    'manageTheStore': {'en': 'Manage the store', 'fr': 'Gérer le magasin'},
    'changeTheBusiness': {
      'en': 'Change the business',
      'fr': 'Changer d\'entreprise',
    },
    'changeTheStore': {'en': 'Change the store', 'fr': 'Changer de magasin'},
    'accountSecurity': {'en': 'Account security', 'fr': 'Sécurité du compte'},
    'manageYourAccountSecurity': {
      'en': 'Manage your account security',
      'fr': 'Gérer la sécurité de votre compte',
    },
    'registrationUserNameRequired': {
      'en': 'User name is required',
      'fr': 'Le nom d’utilisateur est requis',
    },
    'registrationEmailRequired': {
      'en': 'Email is required',
      'fr': 'L’email est requis',
    },
    'registrationEmailInvalid': {
      'en': 'Please enter a valid email address',
      'fr': 'Veuillez entrer une adresse email valide',
    },
    'registrationPhoneNumberRequired': {
      'en': 'Phone number is required',
      'fr': 'Le numéro de téléphone est requis',
    },
    'registrationFirstNameRequired': {
      'en': 'First name is required',
      'fr': 'Le prénom est requis',
    },
    'registrationLastNameRequired': {
      'en': 'Last name is required',
      'fr': 'Le nom est requis',
    },
    'registrationPasswordRequired': {
      'en': 'Password is required',
      'fr': 'Le mot de passe est requis',
    },
    'registrationPasswordLength': {
      'en': 'Password must be at least 6 characters',
      'fr': 'Le mot de passe doit comporter au moins 6 caractères',
    },
    'registrationConfirmPasswordRequired': {
      'en': 'Please confirm your password',
      'fr': 'Veuillez confirmer votre mot de passe',
    },
    'registrationPasswordsDoNotMatch': {
      'en': 'Passwords do not match',
      'fr': 'Les mots de passe ne correspondent pas',
    },
    'registrationTitle': {'en': 'Register', 'fr': 'Inscription'},
    'registrationUserName': {'en': 'User name', 'fr': 'Nom d’utilisateur'},
    'registrationEmail': {'en': 'Email', 'fr': 'Email'},
    'registrationPhoneNumber': {
      'en': 'Phone number',
      'fr': 'Numéro de téléphone',
    },
    'registrationFirstName': {'en': 'First name', 'fr': 'Prénom'},
    'registrationLastName': {'en': 'Last name', 'fr': 'Nom'},
    'registrationPassword': {'en': 'Password', 'fr': 'Mot de passe'},
    'registrationConfirmPassword': {
      'en': 'Confirm password',
      'fr': 'Confirmer le mot de passe',
    },
    'registrationSubmit': {'en': 'Register', 'fr': 'S’inscrire'},
    'forgotPasswordTitle': {
      'en': 'Forgot Password',
      'fr': 'Mot de passe oublié',
    },
    'forgotPasswordEmail': {'en': 'Email', 'fr': 'Email'},
    'forgotPasswordEmailRequired': {
      'en': 'Email is required',
      'fr': 'L’email est requis',
    },
    'forgotPasswordEmailInvalid': {
      'en': 'Please enter a valid email address',
      'fr': 'Veuillez entrer une adresse email valide',
    },
    'forgotPasswordSubmit': {
      'en': 'Send reset link',
      'fr': 'Envoyer le lien de réinitialisation',
    },
    'forgotPasswordRememberPassword': {
      'en': 'Remember your password?',
      'fr': 'Vous souvenez-vous de votre mot de passe ?',
    },
    'forgotPasswordSignIn': {'en': 'Sign in', 'fr': 'Se connecter'},
  };

  /// Direct access to the internationalization service.
  static AppInternationalizationService get to => Get.find();

  /// Constructors for internationalization.
  AppInternationalizationService(Locale initialLocale, this._box)
    : _locale = Rx<Locale>(initialLocale);

  /// The current locale.
  Locale get locale => _locale.value;

  /// The supported locales.
  static List<Locale> get supportedLocales => [
    const Locale('en'),
    const Locale('fr'),
  ];

  /// Returns the localized value of minimum3Characters.
  String get minimum3Characters {
    return _stringOfLocalizedValue('minimum3Characters');
  }

  /// Returns the localized value of storeForYourBusiness.
  String get storeForYourBusiness {
    return _stringOfLocalizedValue('storeForYourBusiness');
  }

  /// Returns the localized value of failed.
  String get failed {
    return _stringOfLocalizedValue('failed');
  }

  /// Returns the localized value of businessName.
  String get businessName {
    return _stringOfLocalizedValue('businessName');
  }

  /// Returns the localized value of inputRequired.
  String get inputRequired {
    return _stringOfLocalizedValue('inputRequired');
  }

  /// Returns the localized value of save.
  String get save {
    return _stringOfLocalizedValue('save');
  }

  /// Returns the localized value of businessDescription.
  String get businessDescription {
    return _stringOfLocalizedValue('businessDescription');
  }

  /// Returns the localized value of newStore.
  String get newStore {
    return _stringOfLocalizedValue('newStore');
  }

  /// Returns the localized value of storeName.
  String get storeName {
    return _stringOfLocalizedValue('storeName');
  }

  /// Returns the localized value of storeDescription.
  String get storeDescription {
    return _stringOfLocalizedValue('storeDescription');
  }

  /// Returns the localized value of storeAddress.
  String get storeAddress {
    return _stringOfLocalizedValue('storeAddress');
  }

  /// Returns the localized value of Success.
  String get success {
    return _stringOfLocalizedValue('Success');
  }

  /// Returns the localized value of enterYourFirstName.
  String get enterYourFirstName {
    return _stringOfLocalizedValue('enterYourFirstName');
  }

  /// Returns the localized value of enterYourLastName.
  String get enterYourLastName {
    return _stringOfLocalizedValue('enterYourLastName');
  }

  /// Returns the localized value of enterValidEmail.
  String get enterValidEmail {
    return _stringOfLocalizedValue('enterValidEmail');
  }

  /// Returns the localized value of confirmPassword.
  String get confirmPassword {
    return _stringOfLocalizedValue('confirmPassword');
  }

  /// Returns the localized value of passwordDoesNotMatch.
  String get passwordDoesNotMatch {
    return _stringOfLocalizedValue('passwordDoesNotMatch');
  }

  /// Returns the localized value of passwordMustBeAtLeast6Characters.
  String get passwordMustBeAtLeast6Characters {
    return _stringOfLocalizedValue('passwordMustBeAtLeast6Characters');
  }

  /// Returns the localized value of email.
  String get email {
    return _stringOfLocalizedValue('email');
  }

  /// Returns the localized value of password.
  String get password {
    return _stringOfLocalizedValue('password');
  }

  /// Returns the localized value of firstName.
  String get firstName {
    return _stringOfLocalizedValue('firstName');
  }

  /// Returns the localized value of lastName.
  String get lastName {
    return _stringOfLocalizedValue('lastName');
  }

  /// Returns the localized value of gettingStarted.
  String get gettingStarted {
    return _stringOfLocalizedValue('gettingStarted');
  }

  /// Returns the localized value of alreadyHaveAnAccount.
  String get alreadyHaveAnAccount {
    return _stringOfLocalizedValue('alreadyHaveAnAccount');
  }

  /// Returns the localized value of signIn.
  String get signIn {
    return _stringOfLocalizedValue('signIn');
  }

  /// Returns the localized value of signUp.
  String get signUp {
    return _stringOfLocalizedValue('signUp');
  }

  /// Returns the localized value of dontHaveAnAccount.
  String get dontHaveAnAccount {
    return _stringOfLocalizedValue('dontHaveAnAccount');
  }

  /// Returns the localized value of forgotPassword.
  String get forgotPassword {
    return _stringOfLocalizedValue('forgotPassword');
  }

  /// Returns the localized value of signInToYourAccount.
  String get signInToYourAccount {
    return _stringOfLocalizedValue('signInToYourAccount');
  }

  /// Returns the localized value of loginInYourAccount.
  String get loginInYourAccount {
    return _stringOfLocalizedValue('loginInYourAccount');
  }

  /// Returns the localized value of welcomeBack.
  String get welcomeBack {
    return _stringOfLocalizedValue('welcomeBack');
  }

  /// Returns the localized value of createAccount.
  String get createAccount {
    return _stringOfLocalizedValue('createAccount');
  }

  /// Returns the localized value of searchForProduct.
  String get searchForProduct {
    return _stringOfLocalizedValue('searchForProduct');
  }

  /// Returns the localized value of setting.
  String get setting {
    return _stringOfLocalizedValue('setting');
  }

  /// Returns the localized value of signOut.
  String get signOut {
    return _stringOfLocalizedValue('signOut');
  }

  /// Returns the localized value of dashboard.
  String get dashboard {
    return _stringOfLocalizedValue('dashboard');
  }

  /// Returns the localized value of [stores].
  String get stores {
    return _stringOfLocalizedValue('stores');
  }

  /// Returns the localized value of sabitu.
  String get sabitu {
    return _stringOfLocalizedValue('sabitu');
  }

  /// Returns the localized value of cancel.
  String get cancel {
    return _stringOfLocalizedValue('cancel');
  }

  /// Returns the localized value of account.
  String get account {
    return _stringOfLocalizedValue('account');
  }

  /// Returns the localized value of uploadNewPicture.
  String get uploadNewPicture {
    return _stringOfLocalizedValue('uploadNewPicture');
  }

  /// Returns the localized value of deletePicture.
  String get deletePicture {
    return _stringOfLocalizedValue('deletePicture');
  }

  /// Returns the localized value of contactEmail.
  String get contactEmail {
    return _stringOfLocalizedValue('contactEmail');
  }

  /// Returns the localized value of manageYourAccountEmailAddress.
  String get manageYourAccountEmailAddress {
    return _stringOfLocalizedValue('manageYourAccountEmailAddress');
  }

  /// Returns the localized value of business.
  String get business {
    return _stringOfLocalizedValue('business');
  }

  /// Returns the localized value of manageYourBusiness.
  String get manageYourBusiness {
    return _stringOfLocalizedValue('manageYourBusiness');
  }

  /// Returns the localized value of store.
  String get store {
    return _stringOfLocalizedValue('store');
  }

  /// Returns the localized value of manageTheStore.
  String get manageTheStore {
    return _stringOfLocalizedValue('manageTheStore');
  }

  /// Returns the localized value of changeTheBusiness.
  String get changeTheBusiness {
    return _stringOfLocalizedValue('changeTheBusiness');
  }

  /// Returns the localized value of changeTheStore.
  String get changeTheStore {
    return _stringOfLocalizedValue('changeTheStore');
  }

  /// Returns the localized value of accountSecurity.
  String get accountSecurity {
    return _stringOfLocalizedValue('accountSecurity');
  }

  /// Returns the localized value of manageYourAccountSecurity.
  String get manageYourAccountSecurity {
    return _stringOfLocalizedValue('manageYourAccountSecurity');
  }

  /// Returns the localized value of adminManager.
  String get adminManager {
    return _stringOfLocalizedValue('adminManager');
  }

  /// Returns the localized value of registrationUserNameRequired.
  String get registrationUserNameRequired =>
      _stringOfLocalizedValue('registrationUserNameRequired');

  /// Returns the localized value of registrationEmailRequired.
  String get registrationEmailRequired =>
      _stringOfLocalizedValue('registrationEmailRequired');

  /// Returns the localized value of registrationEmailInvalid.
  String get registrationEmailInvalid =>
      _stringOfLocalizedValue('registrationEmailInvalid');

  /// Returns the localized value of registrationPhoneNumberRequired.
  String get registrationPhoneNumberRequired =>
      _stringOfLocalizedValue('registrationPhoneNumberRequired');

  /// Returns the localized value of registrationFirstNameRequired.
  String get registrationFirstNameRequired =>
      _stringOfLocalizedValue('registrationFirstNameRequired');

  /// Returns the localized value of registrationLastNameRequired.
  String get registrationLastNameRequired =>
      _stringOfLocalizedValue('registrationLastNameRequired');

  /// Returns the localized value of registrationPasswordRequired.
  String get registrationPasswordRequired =>
      _stringOfLocalizedValue('registrationPasswordRequired');

  /// Returns the localized value of registrationPasswordLength.
  String get registrationPasswordLength =>
      _stringOfLocalizedValue('registrationPasswordLength');

  /// Returns the localized value of registrationConfirmPasswordRequired.
  String get registrationConfirmPasswordRequired =>
      _stringOfLocalizedValue('registrationConfirmPasswordRequired');

  /// Returns the localized value of registrationPasswordsDoNotMatch.
  String get registrationPasswordsDoNotMatch =>
      _stringOfLocalizedValue('registrationPasswordsDoNotMatch');

  /// Returns the localized value of registrationTitle.
  String get registrationTitle => _stringOfLocalizedValue('registrationTitle');

  /// Returns the localized value of registrationUserName.
  String get registrationUserName =>
      _stringOfLocalizedValue('registrationUserName');

  /// Returns the localized value of registrationEmail.
  String get registrationEmail => _stringOfLocalizedValue('registrationEmail');

  /// Returns the localized value of registrationPhoneNumber.
  String get registrationPhoneNumber =>
      _stringOfLocalizedValue('registrationPhoneNumber');

  /// Returns the localized value of registrationFirstName.
  String get registrationFirstName =>
      _stringOfLocalizedValue('registrationFirstName');

  /// Returns the localized value of registrationLastName.
  String get registrationLastName =>
      _stringOfLocalizedValue('registrationLastName');

  /// Returns the localized value of registrationPassword.
  String get registrationPassword =>
      _stringOfLocalizedValue('registrationPassword');

  /// Returns the localized value of registrationConfirmPassword.
  String get registrationConfirmPassword =>
      _stringOfLocalizedValue('registrationConfirmPassword');

  /// Returns the localized value of registrationSubmit.
  String get registrationSubmit =>
      _stringOfLocalizedValue('registrationSubmit');

  /// Returns the localized value of forgotPasswordTitle.
  String get forgotPasswordTitle =>
      _stringOfLocalizedValue('forgotPasswordTitle');

  /// Returns the localized value of forgotPasswordEmail.
  String get forgotPasswordEmail =>
      _stringOfLocalizedValue('forgotPasswordEmail');

  /// Returns the localized value of forgotPasswordEmailRequired.
  String get forgotPasswordEmailRequired =>
      _stringOfLocalizedValue('forgotPasswordEmailRequired');

  /// Returns the localized value of forgotPasswordEmailInvalid.
  String get forgotPasswordEmailInvalid =>
      _stringOfLocalizedValue('forgotPasswordEmailInvalid');

  /// Returns the localized value of forgotPasswordSubmit.
  String get forgotPasswordSubmit =>
      _stringOfLocalizedValue('forgotPasswordSubmit');

  /// Returns the localized value of forgotPasswordRememberPassword.
  String get forgotPasswordRememberPassword =>
      _stringOfLocalizedValue('forgotPasswordRememberPassword');

  /// Returns the localized value of forgotPasswordSignIn.
  String get forgotPasswordSignIn =>
      _stringOfLocalizedValue('forgotPasswordSignIn');

  /// Returns the localized value of loginEmailRequired.
  String get loginEmailRequired {
    return _stringOfLocalizedValue('loginEmailRequired');
  }

  /// Returns the localized value of loginEmailInvalid.
  String get loginEmailInvalid {
    return _stringOfLocalizedValue('loginEmailInvalid');
  }

  /// Returns the localized value of loginPasswordRequired.
  String get loginPasswordRequired {
    return _stringOfLocalizedValue('loginPasswordRequired');
  }

  /// Returns the localized value of loginPasswordLength.
  String get loginPasswordLength {
    return _stringOfLocalizedValue('loginPasswordLength');
  }

  /// Returns the localized value of inventoryManager.
  String get inventoryManager {
    return _stringOfLocalizedValue('inventoryManager');
  }

  /// Changes the locale.
  void changeLocale([Locale? newLocale]) {
    final local = switch ((newLocale, _locale.value.languageCode)) {
      (final Locale newLocale, _) => newLocale,
      (null, 'en') => const Locale('fr'),
      (_, _) => const Locale('en'),
    };

    if (_locale.value == local) {
      return;
    }
    _locale.value = local;
    Get.updateLocale(local);
    _box.write(_key, local.languageCode);
  }

  /// Gets the translation for the given key.
  String translate(String key, {Map<String, String>? args}) {
    final value = translations[key];
    if (value == null) {
      return '_placeholder_';
    }
    final translation = value[locale.languageCode] ?? key;
    if (args != null) {
      return _replaceArgs(translation, args);
    }

    return translation;
  }

  String _replaceArgs(String translation, Map<String, String> args) {
    String result = translation;
    args.forEach((key, value) {
      result = result.replaceAll('@$key', value);
    });

    return result;
  }

  String _stringOfLocalizedValue(String value, [Map<String, String>? args]) {
    return value.trs(args);
  }
}
