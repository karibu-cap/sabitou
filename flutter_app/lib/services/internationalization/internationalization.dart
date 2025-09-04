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

/// The short version of [AppInternationalizationService].
typedef Intls = AppInternationalizationService;

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
    'registrationSuccess': {
      'en': 'Registration successful!',
      'fr': 'Inscription réussie !',
    },
    'registrationFailed': {
      'en': 'Registration failed. Please try again.',
      'fr': 'Échec de l\'inscription. Veuillez réessayer.',
    },
    'loginSuccess': {'en': 'Login successful!', 'fr': 'Connexion réussie !'},
    'loginFailed': {
      'en': 'Login failed. Please try again.',
      'fr': 'Échec de la connexion. Veuillez réessayer.',
    },
    'forgotPasswordSuccess': {
      'en': 'Password reset email sent!',
      'fr': 'E-mail de réinitialisation envoyé !',
    },
    'forgotPasswordFailed': {
      'en': 'Password reset failed. Please try again.',
      'fr': 'Échec de la réinitialisation du mot de passe. Veuillez réessayer.',
    },
    'accountSecurity': {'en': 'Account security', 'fr': 'Sécurité du compte'},
    'ok': {'en': 'OK', 'fr': 'OK'},
    'manageYourAccountSecurity': {
      'en': 'Manage your account security',
      'fr': 'Gérer la sécurité de votre compte',
    },
    'userNameRequired': {
      'en': 'User name is required',
      'fr': 'Le nom d’utilisateur est requis',
    },
    'emailRequired': {'en': 'Email is required', 'fr': 'L’email est requis'},
    'emailInvalid': {
      'en': 'Please enter a valid email address',
      'fr': 'Veuillez entrer une adresse email valide',
    },
    'phoneNumberRequired': {
      'en': 'Phone number is required',
      'fr': 'Le numéro de téléphone est requis',
    },
    'phoneNumberInvalidFormat': {
      'en': 'Invalid phone number format',
      'fr': 'Format de numéro de téléphone invalide',
    },
    'phoneNumberInvalidCameroon': {
      'en': 'Invalid Cameroon phone number (format: 6XXXXXXXX)',
      'fr': 'Numéro de téléphone camerounais invalide (format: 6XXXXXXXX)',
    },
    'firstNameRequired': {
      'en': 'First name is required',
      'fr': 'Le prénom est requis',
    },
    'lastNameRequired': {
      'en': 'Last name is required',
      'fr': 'Le nom est requis',
    },
    'passwordRequired': {
      'en': 'Password is required',
      'fr': 'Le mot de passe est requis',
    },
    'passwordLength': {
      'en': 'Password must be at least 6 characters',
      'fr': 'Le mot de passe doit comporter au moins 6 caractères',
    },
    'confirmPasswordRequired': {
      'en': 'Please confirm your password',
      'fr': 'Veuillez confirmer votre mot de passe',
    },
    'products': {'en': 'Products', 'fr': 'Produits'},
    'inventory': {'en': 'Inventory', 'fr': 'Inventaire'},
    'categories': {'en': 'Categories', 'fr': 'Catégories'},
    'addProduct': {'en': 'Add Product', 'fr': 'Ajouter un produit'},
    'sales': {'en': 'Sales', 'fr': 'Ventes'},
    'reports': {'en': 'Reports', 'fr': 'Rapports'},
    'suppliers': {'en': 'Suppliers', 'fr': 'Fournisseurs'},
    'users': {'en': 'Users', 'fr': 'Utilisateurs'},
    'settings': {'en': 'Settings', 'fr': 'Paramètres'},
    'logout': {'en': 'Logout', 'fr': 'Déconnexion'},
    'login': {'en': 'Login', 'fr': 'Connexion'},
    'submit': {'en': 'Submit', 'fr': 'Soumettre'},
    'edit': {'en': 'Edit', 'fr': 'Modifier'},
    'delete': {'en': 'Delete', 'fr': 'Supprimer'},
    'search': {'en': 'Search', 'fr': 'Rechercher'},
    'name': {'en': 'Name', 'fr': 'Nom'},
    'role': {'en': 'Role', 'fr': 'Rôle'},
    'admin': {'en': 'Admin', 'fr': 'Administrateur'},
    'pharmacist': {'en': 'Pharmacist', 'fr': 'Pharmacien'},
    'assistant': {'en': 'Assistant', 'fr': 'Assistant'},
    'welcome': {'en': 'Welcome', 'fr': 'Bienvenue'},
    'add': {'en': 'Add', 'fr': 'Ajouter'},
    'update': {'en': 'Update', 'fr': 'Mettre à jour'},
    'close': {'en': 'Close', 'fr': 'Fermer'},
    'description': {'en': 'Description', 'fr': 'Description'},
    'quantity': {'en': 'Quantity', 'fr': 'Quantité'},
    'price': {'en': 'Price', 'fr': 'Prix'},
    'supplier': {'en': 'Supplier', 'fr': 'Fournisseur'},
    'date': {'en': 'Date', 'fr': 'Date'},
    'actions': {'en': 'Actions', 'fr': 'Actions'},
    'noData': {'en': 'No data available', 'fr': 'Aucune donnée disponible'},
    'requiredField': {
      'en': 'This field is required',
      'fr': 'Ce champ est requis',
    },
    'invalidEmail': {
      'en': 'Invalid email address',
      'fr': 'Adresse e-mail invalide',
    },
    'passwordsDoNotMatch': {
      'en': 'Passwords do not match',
      'fr': 'Les mots de passe ne correspondent pas',
    },
    'registrationTitle': {'en': 'Create Account', 'fr': 'Créer un compte'},
    'registrationSubtitle': {
      'en': 'Join us today',
      'fr': "Rejoignez-nous aujourd'hui",
    },
    'userName': {'en': 'User name', 'fr': 'Nom d’utilisateur'},
    'phoneNumber': {'en': 'Phone number', 'fr': 'Numéro de téléphone'},
    'registrationSubmit': {'en': 'Register', 'fr': 'S’inscrire'},
    'forgotPasswordTitle': {
      'en': 'Forgot Password',
      'fr': 'Mot de passe oublié',
    },
    'forgotPasswordSubtitle': {
      'en': 'Enter your email to reset your password',
      'fr': 'Entrez votre email pour réinitialiser votre mot de passe',
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
    'loading': {'en': 'Loading...', 'fr': 'Chargement...'},
    'success': {'en': 'Success', 'fr': 'Succès'},
    'error': {'en': 'Error', 'fr': 'Erreur'},
    'confirmDelete': {
      'en': 'Are you sure you want to delete?',
      'fr': 'Êtes-vous sûr de vouloir supprimer ?',
    },
    'yes': {'en': 'Yes', 'fr': 'Oui'},
    'no': {'en': 'No', 'fr': 'Non'},
    'logoutMessage': {
      'en': 'You have been logged out.',
      'fr': 'Vous avez été déconnecté.',
    },
    'profile': {'en': 'Profile', 'fr': 'Profil'},
    'language': {'en': 'Language', 'fr': 'Langue'},
    'english': {'en': 'English', 'fr': 'Anglais'},
    'french': {'en': 'French', 'fr': 'Français'},
    'home': {'en': 'Home', 'fr': 'Accueil'},
    'addCategory': {'en': 'Add Category', 'fr': 'Ajouter une catégorie'},
    'addSupplier': {'en': 'Add Supplier', 'fr': 'Ajouter un fournisseur'},
    'addUser': {'en': 'Add User', 'fr': 'Ajouter un utilisateur'},
    'productName': {'en': 'Product Name', 'fr': 'Nom du produit'},
    'category': {'en': 'Category', 'fr': 'Catégorie'},
    'stock': {'en': 'Stock', 'fr': 'Stock'},
    'lowStock': {'en': 'Low Stock', 'fr': 'Stock faible'},
    'expired': {'en': 'Expired', 'fr': 'Expiré'},
    'expirationDate': {'en': 'Expiration Date', 'fr': 'Date d\'expiration'},
    'active': {'en': 'Active', 'fr': 'Actif'},
    'inactive': {'en': 'Inactive', 'fr': 'Inactif'},
    'lastUpdated': {'en': 'Last updated', 'fr': 'Dernière mise à jour'},
    'lowStockAlert': {'en': 'Low Stock Alert', 'fr': 'Alerte Stock Faible'},
    'expiryAlert': {'en': 'Expiry Alert', 'fr': 'Alerte Expiration'},
    'recentActivity': {'en': 'Recent Activity', 'fr': 'Activité récente'},
    'allProductsAreWellStocked': {
      'en': 'All products are well stocked',
      'fr': 'Tous les produits sont bien stockés',
    },
    'noProductsExpiringSoon': {
      'en': 'No products expiring soon',
      'fr': 'Aucun produit expirant bientôt',
    },
    'oneDay': {'en': '1 day', 'fr': '1 jour'},
    'days': {'en': 'days', 'fr': 'jours'},
    'expires': {'en': 'Expires', 'fr': 'Expire'},
    'totalProducts': {'en': 'Total Products', 'fr': 'Total des produits'},
    'lowStockItems': {
      'en': 'Low Stock Items',
      'fr': 'Articles en stock faible',
    },
    'expiringSoon': {'en': 'Expiring Soon', 'fr': 'Expirant bientôt'},
    'todaySales': {'en': 'Today\'s Sales', 'fr': 'Ventes du jour'},
    'todayTransactions': {
      'en': 'Today\'s Transactions',
      'fr': 'Transactions du jour',
    },
    'totalSuppliers': {'en': 'Total Suppliers', 'fr': 'Total des fournisseurs'},
    'activeSuppliers': {'en': 'Active Suppliers', 'fr': 'Fournisseurs actifs'},
    'requiresAttention': {
      'en': 'Requires Attention',
      'fr': 'Besoin d\'attention',
    },
    'allGood': {'en': 'All Good', 'fr': 'Tout est bien'},
    'noRecentActivity': {
      'en': 'No recent activity',
      'fr': 'Aucune activité récente',
    },
    'ago': {'en': '@when @next ago', 'fr': 'il y a @when @next'},
    'hours': {'en': 'hours', 'fr': 'heures'},
    'minutes': {'en': 'minutes', 'fr': 'minutes'},
    'now': {'en': 'right now', 'fr': 'à l\'instant'},
    'purchase': {'en': 'Purchase', 'fr': 'Achat'},
    'sale': {'en': 'Sale', 'fr': 'Vente'},
    'adjustment': {'en': 'Adjustment', 'fr': 'Ajustement'},
    'refund': {'en': 'Refund', 'fr': 'Remboursement'},
    'transfer': {'en': 'Transfer', 'fr': 'Transfert'},
    'transaction': {'en': 'Transaction', 'fr': 'Transaction'},
    'months': {'en': 'months', 'fr': 'mois'},
    'inStock': {'en': '@quantity In Stock', 'fr': '@quantity En Stock'},
    'next2months': {'en': 'Next 2 months', 'fr': 'Prochaines 2 mois'},
    'fromYesterday': {'en': 'from yesterday', 'fr': 'de hier'},
    'high': {'en': 'High', 'fr': 'Haute'},
    'medium': {'en': 'Medium', 'fr': 'Moyenne'},
    'low': {'en': 'Low', 'fr': 'Basse'},
    'markAsRead': {'en': 'Mark as read', 'fr': 'Marquer comme lu'},
    'noNotifications': {'en': 'No notifications', 'fr': 'Aucune notification'},
    'notifications': {'en': 'Notifications', 'fr': 'Notification'},
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

  /// Returns the localized value of text 'notifications'.
  String get notifications => _stringOfLocalizedValue('notifications');

  /// Returns the localized value of text 'noNotifications'.
  String get noNotifications => _stringOfLocalizedValue('noNotifications');

  /// Returns the localized value of text 'markAsRead'.
  String get markAsRead => _stringOfLocalizedValue('markAsRead');

  /// Returns the localized value of text 'markAllRead'.
  String get markAllRead => _stringOfLocalizedValue('markAllRead');

  /// Returns the localized value of text 'high'.
  String get high => _stringOfLocalizedValue('high');

  /// Returns the localized value of text 'medium'.
  String get medium => _stringOfLocalizedValue('medium');

  /// Returns the localized value of text 'low'.
  String get low => _stringOfLocalizedValue('low');

  /// Returns the localized value of text 'fromYesterday'.
  String get fromYesterday => _stringOfLocalizedValue('fromYesterday');

  /// Returns the localized value of text 'next2months'.
  String get next2months => _stringOfLocalizedValue('next2months');

  /// Returns the localized value of text 'inStock'.
  String get inStock => _stringOfLocalizedValue('inStock');

  /// Returns the localized value of text 'months'.
  String get months => _stringOfLocalizedValue('months');

  /// Returns the localized value of text 'purchase'.
  String get purchase => _stringOfLocalizedValue('purchase');

  /// Returns the localized value of text 'sale'.
  String get sale => _stringOfLocalizedValue('sale');

  /// Returns the localized value of text 'adjustment'.
  String get adjustment => _stringOfLocalizedValue('adjustment');

  /// Returns the localized value of text 'refund'.
  String get refund => _stringOfLocalizedValue('refund');

  /// Returns the localized value of text 'transaction'.
  String get transaction => _stringOfLocalizedValue('transaction');

  /// Returns the localized value of text 'transfer'.
  String get transfer => _stringOfLocalizedValue('transfer');

  /// Returns the localized value of text 'now'.
  String get now => _stringOfLocalizedValue('now');

  /// Returns the localized value of text 'hours'.
  String get hours => _stringOfLocalizedValue('hours');

  /// Returns the localized value of text 'minutes'.
  String get minutes => _stringOfLocalizedValue('minutes');

  /// Returns the localized value of text 'ago'.
  String get ago => _stringOfLocalizedValue('ago');

  /// Returns the localized value of text 'noRecentActivity'.
  String get noRecentActivity => _stringOfLocalizedValue('noRecentActivity');

  /// Returns the localized value of text 'activeSuppliers'.
  String get activeSuppliers => _stringOfLocalizedValue('activeSuppliers');

  /// Returns the localized value of text 'requiresAttention'.
  String get requiresAttention => _stringOfLocalizedValue('requiresAttention');

  /// Returns the localized value of text 'allGood'.
  String get allGood => _stringOfLocalizedValue('allGood');

  /// Returns the localized value of text 'totalProducts'.
  String get totalProducts => _stringOfLocalizedValue('totalProducts');

  /// Returns the localized value of text 'lowStockItems'.
  String get lowStockItems => _stringOfLocalizedValue('lowStockItems');

  /// Returns the localized value of text 'expiringSoon'.
  String get expiringSoon => _stringOfLocalizedValue('expiringSoon');

  /// Returns the localized value of text 'todaySales'.
  String get todaySales => _stringOfLocalizedValue('todaySales');

  /// Returns the localized value of text 'todayTransactions'.
  String get todayTransactions => _stringOfLocalizedValue('todayTransactions');

  /// Returns the localized value of text 'totalSuppliers'.
  String get totalSuppliers => _stringOfLocalizedValue('totalSuppliers');

  /// Returns the localized value of text 'expires'.
  String get expires => _stringOfLocalizedValue('expires');

  /// Returns the localized value of text 'oneDay'.
  String get oneDay => _stringOfLocalizedValue('oneDay');

  /// Returns the localized value of text 'days'.
  String get days => _stringOfLocalizedValue('days');

  /// Returns the localized value of text 'noProductsExpiringSoon'.
  String get noProductsExpiringSoon =>
      _stringOfLocalizedValue('noProductsExpiringSoon');

  /// Returns the localized value of text 'allProductsAreWellStocked'.
  String get allProductsAreWellStocked =>
      _stringOfLocalizedValue('allProductsAreWellStocked');

  /// Returns the localized value of text 'lastUpdated'.
  String get lastUpdated => _stringOfLocalizedValue('lastUpdated');

  /// Returns the localized value of text 'lowStockAlert'.
  String get lowStockAlert => _stringOfLocalizedValue('lowStockAlert');

  /// Returns the localized value of text 'expiryAlert'.
  String get expiryAlert => _stringOfLocalizedValue('expiryAlert');

  /// Returns the localized value of text 'recentActivity'.
  String get recentActivity => _stringOfLocalizedValue('recentActivity');

  /// Returns the localized value of text 'dashboard'.
  String get active => _stringOfLocalizedValue('active');

  /// Returns the localized value of text 'dashboard'.
  String get inactive => _stringOfLocalizedValue('inactive');

  /// Returns the localized value of text 'dashboard'.
  String get dashboard => _stringOfLocalizedValue('dashboard');

  /// Returns the localized value of text 'products'.
  String get products => _stringOfLocalizedValue('products');

  /// Returns the localized value of text 'inventory'.
  String get inventory => _stringOfLocalizedValue('inventory');

  /// Returns the localized value of text 'categories'.
  String get categories => _stringOfLocalizedValue('categories');

  /// Returns the localized value of text 'addProduct'.
  String get addProduct => _stringOfLocalizedValue('addProduct');

  /// Returns the localized value of text 'sales'.
  String get sales => _stringOfLocalizedValue('sales');

  /// Returns the localized value of text 'reports'.
  String get reports => _stringOfLocalizedValue('reports');

  /// Returns the localized value of text 'suppliers'.
  String get suppliers => _stringOfLocalizedValue('suppliers');

  /// Returns the localized value of text 'users'.
  String get users => _stringOfLocalizedValue('users');

  /// Returns the localized value of text 'settings'.
  String get settings => _stringOfLocalizedValue('settings');

  /// Returns the localized value of text 'logout'.
  String get logout => _stringOfLocalizedValue('logout');

  /// Returns the localized value of text 'login'.
  String get login => _stringOfLocalizedValue('login');

  /// Returns the localized value of text 'email'.
  String get email => _stringOfLocalizedValue('email');

  /// Returns the localized value of text 'password'.
  String get password => _stringOfLocalizedValue('password');

  /// Returns the localized value of text 'confirmPassword'.
  String get confirmPassword => _stringOfLocalizedValue('confirmPassword');

  /// Returns the localized value of text 'forgotPassword'.
  String get forgotPassword => _stringOfLocalizedValue('forgotPassword');

  /// Returns the localized value of text 'submit'.
  String get submit => _stringOfLocalizedValue('submit');

  /// Returns the localized value of text 'cancel'.
  String get cancel => _stringOfLocalizedValue('cancel');

  /// Returns the localized value of text 'save'.
  String get save => _stringOfLocalizedValue('save');

  /// Returns the localized value of text 'edit'.
  String get edit => _stringOfLocalizedValue('edit');

  /// Returns the localized value of text 'delete'.
  String get delete => _stringOfLocalizedValue('delete');

  /// Returns the localized value of text 'search'.
  String get search => _stringOfLocalizedValue('search');

  /// Returns the localized value of text 'name'.
  String get name => _stringOfLocalizedValue('name');

  /// Returns the localized value of text 'role'.
  String get role => _stringOfLocalizedValue('role');

  /// Returns the localized value of text 'admin'.
  String get admin => _stringOfLocalizedValue('admin');

  /// Returns the localized value of text 'pharmacist'.
  String get pharmacist => _stringOfLocalizedValue('pharmacist');

  /// Returns the localized value of text 'assistant'.
  String get assistant => _stringOfLocalizedValue('assistant');

  /// Returns the localized value of text 'welcome'.
  String get welcome => _stringOfLocalizedValue('welcome');

  /// Returns the localized value of text 'add'.
  String get add => _stringOfLocalizedValue('add');

  /// Returns the localized value of text 'update'.
  String get update => _stringOfLocalizedValue('update');

  /// Returns the localized value of text 'close'.
  String get close => _stringOfLocalizedValue('close');

  /// Returns the localized value of text 'description'.
  String get description => _stringOfLocalizedValue('description');

  /// Returns the localized value of text 'quantity'.
  String get quantity => _stringOfLocalizedValue('quantity');

  /// Returns the localized value of text 'price'.
  String get price => _stringOfLocalizedValue('price');

  /// Returns the localized value of text 'supplier'.
  String get supplier => _stringOfLocalizedValue('supplier');

  /// Returns the localized value of text 'date'.
  String get date => _stringOfLocalizedValue('date');

  /// Returns the localized value of text 'actions'.
  String get actions => _stringOfLocalizedValue('actions');

  /// Returns the localized value of text 'noData'.
  String get noData => _stringOfLocalizedValue('noData');

  /// Returns the localized value of text 'requiredField'.
  String get requiredField => _stringOfLocalizedValue('requiredField');

  /// Returns the localized value of text 'invalidEmail'.
  String get invalidEmail => _stringOfLocalizedValue('invalidEmail');

  /// Returns the localized value of text 'passwordsDoNotMatch'.
  String get passwordsDoNotMatch =>
      _stringOfLocalizedValue('passwordsDoNotMatch');

  /// Returns the localized value of text 'loading'.
  String get loading => _stringOfLocalizedValue('loading');

  /// Returns the localized value of text 'success'.
  String get success => _stringOfLocalizedValue('success');

  /// Returns the localized value of text 'error'.
  String get error => _stringOfLocalizedValue('error');

  /// Returns the localized value of text 'confirmDelete'.
  String get confirmDelete => _stringOfLocalizedValue('confirmDelete');

  /// Returns the localized value of text 'yes'.
  String get yes => _stringOfLocalizedValue('yes');

  /// Returns the localized value of text 'no'.
  String get no => _stringOfLocalizedValue('no');

  /// Returns the localized value of text 'logoutMessage'.
  String get logoutMessage => _stringOfLocalizedValue('logoutMessage');

  /// Returns the localized value of text 'profile'.
  String get profile => _stringOfLocalizedValue('profile');

  /// Returns the localized value of text 'language'.
  String get language => _stringOfLocalizedValue('language');

  /// Returns the localized value of text 'english'.
  String get english => _stringOfLocalizedValue('english');

  /// Returns the localized value of text 'french'.
  String get french => _stringOfLocalizedValue('french');

  /// Returns the localized value of text 'home'.
  String get home => _stringOfLocalizedValue('home');

  /// Returns the localized value of text 'addCategory'.
  String get addCategory => _stringOfLocalizedValue('addCategory');

  /// Returns the localized value of text 'addSupplier'.
  String get addSupplier => _stringOfLocalizedValue('addSupplier');

  /// Returns the localized value of text 'addUser'.
  String get addUser => _stringOfLocalizedValue('addUser');

  /// Returns the localized value of text 'productName'.
  String get productName => _stringOfLocalizedValue('productName');

  /// Returns the localized value of text 'category'.
  String get category => _stringOfLocalizedValue('category');

  /// Returns the localized value of text 'stock'.
  String get stock => _stringOfLocalizedValue('stock');

  /// Returns the localized value of text 'lowStock'.
  String get lowStock => _stringOfLocalizedValue('lowStock');

  /// Returns the localized value of text 'expired'.
  String get expired => _stringOfLocalizedValue('expired');

  /// Returns the localized value of text 'expirationDate'.
  String get expirationDate => _stringOfLocalizedValue('expirationDate');

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

  /// Returns the localized value of passwordDoesNotMatch.
  String get passwordDoesNotMatch {
    return _stringOfLocalizedValue('passwordDoesNotMatch');
  }

  /// Returns the localized value of passwordMustBeAtLeast6Characters.
  String get passwordMustBeAtLeast6Characters {
    return _stringOfLocalizedValue('passwordMustBeAtLeast6Characters');
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

  /// Returns the localized value of [stores].
  String get stores {
    return _stringOfLocalizedValue('stores');
  }

  /// Returns the localized value of sabitu.
  String get sabitu {
    return _stringOfLocalizedValue('sabitu');
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

  /// Returns the localized value of userNameRequired.
  String get userNameRequired => _stringOfLocalizedValue('userNameRequired');

  /// Returns the localized value of emailRequired.
  String get emailRequired => _stringOfLocalizedValue('emailRequired');

  /// Returns the localized value of emailInvalid.
  String get emailInvalid => _stringOfLocalizedValue('emailInvalid');

  /// Returns the localized value of phoneNumberRequired.
  String get phoneNumberRequired =>
      _stringOfLocalizedValue('phoneNumberRequired');

  /// Returns the localized value of firstNameRequired.
  String get firstNameRequired => _stringOfLocalizedValue('firstNameRequired');

  /// Returns the localized value of lastNameRequired.
  String get lastNameRequired => _stringOfLocalizedValue('lastNameRequired');

  /// Returns the localized value of passwordRequired.
  String get passwordRequired => _stringOfLocalizedValue('passwordRequired');

  /// Returns the localized value of passwordLength.
  String get passwordLength => _stringOfLocalizedValue('passwordLength');

  /// Returns the localized value of confirmPasswordRequired.
  String get confirmPasswordRequired =>
      _stringOfLocalizedValue('confirmPasswordRequired');

  /// Returns the localized value of registrationTitle.
  String get registrationTitle {
    return _stringOfLocalizedValue('registrationTitle');
  }

  /// Returns the localized value of registrationSubtitle.
  String get registrationSubtitle {
    return _stringOfLocalizedValue('registrationSubtitle');
  }

  /// Returns the localized value of userName.
  String get userName => _stringOfLocalizedValue('userName');

  /// Returns the localized value of phoneNumber.
  String get phoneNumber => _stringOfLocalizedValue('phoneNumber');

  /// Returns the localized value of registrationSubmit.
  String get registrationSubmit =>
      _stringOfLocalizedValue('registrationSubmit');

  /// Returns the localized value of forgotPasswordTitle.
  String get forgotPasswordTitle =>
      _stringOfLocalizedValue('forgotPasswordTitle');

  /// Returns the localized value of forgotPasswordSubtitle.
  String get forgotPasswordSubtitle =>
      _stringOfLocalizedValue('forgotPasswordSubtitle');

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

  /// Returns the localized value of registrationSuccess.
  String get registrationSuccess =>
      _stringOfLocalizedValue('registrationSuccess');

  /// Returns the localized value of registrationFailed.
  String get registrationFailed =>
      _stringOfLocalizedValue('registrationFailed');

  /// Returns the localized value of ok.
  String get ok => _stringOfLocalizedValue('ok');

  /// Returns the localized value of loginSuccess.
  String get loginSuccess => _stringOfLocalizedValue('loginSuccess');

  /// Returns the localized value of loginFailed.
  String get loginFailed => _stringOfLocalizedValue('loginFailed');

  /// Returns the localized value of forgotPasswordSuccess.
  String get forgotPasswordSuccess =>
      _stringOfLocalizedValue('forgotPasswordSuccess');

  /// Returns the localized value of forgotPasswordFailed.
  String get forgotPasswordFailed =>
      _stringOfLocalizedValue('forgotPasswordFailed');

  /// Returns the localized value of phoneNumberInvalidFormat.
  String get phoneNumberInvalidFormat {
    return _stringOfLocalizedValue('phoneNumberInvalidFormat');
  }

  /// Returns the localized value of phoneNumberInvalidCameroon.
  String get phoneNumberInvalidCameroon {
    return _stringOfLocalizedValue('phoneNumberInvalidCameroon');
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
