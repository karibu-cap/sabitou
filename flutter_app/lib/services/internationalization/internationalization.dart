import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../utils/app_constants.dart';
import '../storage/app_storage.dart';

/// The short version of [AppInternationalizationService].
typedef Intls = AppInternationalizationService;

/// AppInternalization defines all the 'local' strings displayed to.
class AppInternationalizationService extends ChangeNotifier {
  final _key = PreferencesKey.language;
  final AppStorageService _box;
  Locale _locale;

  /// The translations map key.
  Map<String, Map<String, String>> translations = {
    'sabitu': {'en': 'Sabitu', 'fr': 'Sabitou'},
    'cancel': {'en': 'Cancel', 'fr': 'Annuler'},
    'stores': {'en': 'Stores', 'fr': 'Magasins'},
    'dashboard': {'en': 'Dashboard', 'fr': 'Tableau de bord'},
    'signOut': {'en': 'Sign out', 'fr': 'Se deconnecter'},
    'setting': {'en': 'Setting', 'fr': 'Paramètres'},
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
    'supplierManagement': {
      'en': 'Supplier Management',
      'fr': 'Gestion des Fournisseurs',
    },
    'manageSupplierRelationships': {
      'en': 'Manage your supplier relationships',
      'fr': 'Gérez vos relations avec les fournisseurs',
    },
    'addSupplierBtn': {'en': 'Add Supplier', 'fr': 'Ajouter un Fournisseur'},
    'editSupplierBtn': {'en': 'Edit Supplier', 'fr': 'Modifier le Fournisseur'},
    'deleteSupplierBtn': {
      'en': 'Delete Supplier',
      'fr': 'Supprimer le Fournisseur',
    },
    'totalSuppliersCount': {
      'en': 'Total Suppliers',
      'fr': 'Total Fournisseurs',
    },
    'activeSuppliersText': {
      'en': 'Active suppliers',
      'fr': 'Fournisseurs actifs',
    },
    'totalProductsCount': {'en': 'Total Products', 'fr': 'Total Produits'},
    'fromAllSuppliersText': {
      'en': 'From all suppliers',
      'fr': 'De tous les fournisseurs',
    },
    'avgProductsText': {'en': 'Avg Products', 'fr': 'Produits Moy.'},
    'perSupplierText': {'en': 'Per supplier', 'fr': 'Par fournisseur'},
    'totalValueText': {'en': 'Total Value', 'fr': 'Valeur Totale'},
    'allInventoryText': {'en': 'All inventory', 'fr': 'Tout l\'inventaire'},
    'suppliersTitle': {'en': 'Suppliers', 'fr': 'Fournisseurs'},
    'contactInfoText': {'en': 'Contact Info', 'fr': 'Info Contact'},
    'productsText': {'en': 'Products', 'fr': 'Produits'},
    'statusText': {'en': 'Status', 'fr': 'Statut'},
    'activeText': {'en': 'Active', 'fr': 'Actif'},
    'inactiveText': {'en': 'Inactive', 'fr': 'Inactif'},
    'noSuppliersYet': {
      'en': 'No suppliers yet',
      'fr': 'Aucun fournisseur encore',
    },
    'addFirstSupplier': {
      'en': 'Add your first supplier to get started',
      'fr': 'Ajoutez votre premier fournisseur pour commencer',
    },
    'deleteSupplierConfirm': {
      'en':
          'Are you sure you want to delete this supplier? This action cannot be undone.',
      'fr':
          'Êtes-vous sûr de vouloir supprimer ce fournisseur ? Cette action ne peut pas être annulée.',
    },
    'cantDeleteSupplierWithProducts': {
      'en': 'You can\'t delete a supplier who contains a product',
      'fr':
          'Vous ne pouvez pas supprimer un fournisseur qui contient un produit',
    },
    'supplierDeletedSuccessfully': {
      'en': 'Supplier deleted successfully',
      'fr': 'Fournisseur supprimé avec succès',
    },
    'warningSupplierHasProducts': {
      'en':
          'Warning: This supplier has @count products. Please reassign or remove products first.',
      'fr':
          'Attention : Ce fournisseur a @count produits. Veuillez réassigner ou supprimer les produits d\'abord.',
    },
    'addNewSupplier': {
      'en': 'Add New Supplier',
      'fr': 'Ajouter un Nouveau Fournisseur',
    },
    'enterDetailsNewSupplier': {
      'en': 'Enter the details for the new supplier',
      'fr': 'Entrez les détails du nouveau fournisseur',
    },
    'updateSupplierInfo': {
      'en': 'Update supplier information',
      'fr': 'Mettre à jour les informations du fournisseur',
    },
    'companyName': {'en': 'Company Name', 'fr': 'Nom de l\'Entreprise'},
    'enterCompanyName': {
      'en': 'Enter company name',
      'fr': 'Entrez le nom de l\'entreprise',
    },
    'companyNameRequired': {
      'en': 'Company name is required',
      'fr': 'Le nom de l\'entreprise est requis',
    },
    'companyNameTooShort': {
      'en': 'Company name is too short',
      'fr': 'Le nom de l\'entreprise est trop court',
    },
    'errorLoadingSuppliers': {
      'en': 'Unable to Load Suppliers',
      'fr': 'Impossible de charger les fournisseurs',
    },
    'networkErrorMessage': {
      'en': 'Please check your internet connection and try again.',
      'fr': 'Veuillez vérifier votre connexion internet et réessayer.',
    },
    'authErrorMessage': {
      'en': 'Your session has expired. Please log in again.',
      'fr': 'Votre session a expiré. Veuillez vous reconnecter.',
    },
    'serverErrorMessage': {
      'en': 'Our servers are temporarily unavailable. Please try again later.',
      'fr':
          'Nos serveurs sont temporairement indisponibles. Veuillez réessayer plus tard.',
    },
    'dataFormatErrorMessage': {
      'en': 'There was an issue with the data format. Please contact support.',
      'fr':
          'Il y a eu un problème avec le format des données. Veuillez contacter le support.',
    },
    'genericErrorMessage': {
      'en':
          'An unexpected error occurred. Please try again or contact support.',
      'fr':
          'Une erreur inattendue s\'est produite. Veuillez réessayer ou contacter le support.',
    },
    'suggestionsText': {'en': 'Suggestions', 'fr': 'Suggestions'},
    'checkInternetConnection': {
      'en': 'Check your internet connection',
      'fr': 'Vérifiez votre connexion internet',
    },
    'refreshPageSuggestion': {
      'en': 'Refresh the page or restart the app',
      'fr': 'Actualisez la page ou redémarrez l\'application',
    },
    'contactAdminSuggestion': {
      'en': 'Contact your system administrator if the problem persists',
      'fr': 'Contactez votre administrateur système si le problème persiste',
    },
    'retryText': {'en': 'Retry', 'fr': 'Réessayer'},
    'contactSupportText': {
      'en': 'Contact Support',
      'fr': 'Contacter le Support',
    },
    'contactSupportMessage': {
      'en':
          'If you continue to experience issues, please contact our support team with the error details below.',
      'fr':
          'Si vous continuez à rencontrer des problèmes, veuillez contacter notre équipe de support avec les détails de l\'erreur ci-dessous.',
    },
    'errorDetailsText': {
      'en': 'Error Details:',
      'fr': 'Détails de l\'erreur :',
    },
    'closeText': {'en': 'Close', 'fr': 'Fermer'},
    'isActive': {'en': 'Is Active', 'fr': 'Est Actif'},
    'enterPhoneNumber': {
      'en': 'Enter phone number',
      'fr': 'Entrez le numéro de téléphone',
    },
    'emailAddress': {'en': 'Email Address', 'fr': 'Adresse E-mail'},
    'enterEmailAddress': {
      'en': 'Enter email address',
      'fr': 'Entrez l\'adresse e-mail',
    },
    'validEmailRequired': {
      'en': 'Please enter a valid email address',
      'fr': 'Veuillez entrer une adresse e-mail valide',
    },
    'enterCompleteAddress': {
      'en': 'Enter complete address',
      'fr': 'Entrez l\'adresse complète',
    },
    'address': {'en': 'Address', 'fr': 'adresse'},
    'addressRequired': {
      'en': 'Address is required',
      'fr': 'L\'adresse est requise',
    },
    'addressTooShort': {
      'en': 'Address is too short',
      'fr': 'L\'adresse est trop courte',
    },
    'additionalNotes': {
      'en': 'Additional notes about the supplier (optional)',
      'fr': 'Notes supplémentaires sur le fournisseur (optionnel)',
    },
    'notes': {'en': 'Notes', 'fr': 'Notes'},
    'supplierInformation': {
      'en': 'Supplier Information',
      'fr': 'Informations du Fournisseur',
    },
    'supplierInfoDescription': {
      'en':
          'Make sure all contact information is accurate. This will be used for purchase orders and communications.',
      'fr':
          'Assurez-vous que toutes les informations de contact sont exactes. Elles seront utilisées pour les commandes et communications.',
    },
    'updateSupplier': {
      'en': 'Update Supplier',
      'fr': 'Mettre à Jour le Fournisseur',
    },
    'supplierAddedSuccessfully': {
      'en': 'Supplier added successfully',
      'fr': 'Fournisseur ajouté avec succès',
    },
    'supplierUpdatedSuccessfully': {
      'en': 'Supplier updated successfully',
      'fr': 'Fournisseur mis à jour avec succès',
    },
    'failedToSaveSupplier': {
      'en': 'Failed to save supplier',
      'fr': 'Échec de la sauvegarde du fournisseur',
    },
    'failedToDeleteSupplier': {
      'en': 'Failed to delete supplier',
      'fr': 'Échec de la suppression du fournisseur',
    },
    'successText': {'en': 'Success', 'fr': 'Succès'},
    'errorText': {'en': 'Error', 'fr': 'Erreur'},
    'anErrorOccurredPleaseTryAgain': {
      'en':
          'An error occurred. Please try again. If the problem persists, please contact support.',
      'fr':
          'Une erreur est survenue. Veuillez réessayer. Si le problème persiste, veuillez contacter le support.',
    },
    'productManagement': {
      'en': 'Product Management',
      'fr': 'Gestion des produits',
    },
    'manageYourProducts': {
      'en': 'Manage your products',
      'fr': 'Gestion de vos produits',
    },
    'searchAndFilter': {'en': 'Search & Filter', 'fr': 'Rechercher & Filtre'},
    'allCategories': {'en': 'All Categories', 'fr': 'Toutes les catégories'},
    'searchForProduct': {
      'en': 'Search by name or barcode...',
      'fr': 'Rechercher par nom ou code-barre...',
    },
    'product': {'en': 'Product', 'fr': 'Produit'},
    'status': {'en': 'Status', 'fr': 'Statut'},
    'expiry': {'en': 'Expiry', 'fr': 'Expiration'},
    'deleteProduct': {'en': 'Delete Product', 'fr': 'Supprimer le produit'},
    'areYouSureYouWantToDelete': {
      'en':
          'Are you sure you want to delete "@name"? This action cannot be undone.',
      'fr':
          'Êtes-vous sûr de vouloir supprimer "@name"? Cette action ne peut pas être annulée.',
    },
    'productDeletedSuccessfully': {
      'en': 'Product deleted successfully',
      'fr': 'Produit supprimé avec succès',
    },
    'failedToDeleteProduct': {
      'en': 'Failed to delete product',
      'fr': 'Échec de la suppression du produit',
    },
    'outOfStock': {'en': 'Out of Stock', 'fr': 'En rupture de stock'},
    'editProduct': {'en': 'Edit Product', 'fr': 'Modifier le produit'},
    'selectCategory': {
      'en': 'Select Category',
      'fr': 'Sélectionner une catégorie',
    },
    'selectSupplier': {
      'en': 'Select Supplier',
      'fr': 'Sélectionner un fournisseur',
    },
    'isRequiredField': {
      'en': '@field is required',
      'fr': '@field est obligatoire',
    },
    'enterProductName': {
      'en': 'Enter product name',
      'fr': 'Entrez le nom du produit',
    },
    'scanOrEnterBarcode': {
      'en': 'Scan or enter barcode',
      'fr': 'Scanner ou entrez le code-barre',
    },
    'barcode': {'en': 'Barcode', 'fr': 'Code-barre'},
    'scanBarcode': {'en': 'Scan Barcode', 'fr': 'Scanner le code-barre'},
    'minStockThreshold': {
      'en': 'Min Stock Threshold',
      'fr': 'Seuil de stock minimum',
    },
    'stockQuantity': {'en': 'Stock Quantity', 'fr': 'Quantité en stock'},
    'noProductsFoundAddNewProduct': {
      'en':
          'No products found. Add a new product if you have permissions or contact the administrator.',
      'fr':
          'Aucun produit trouvé. Ajoutez un nouveau produit si vous avez des permissions ou contactez l\'administrateur.',
    },
    'searchCategory': {
      'en': 'Search Category',
      'fr': 'Rechercher une catégorie',
    },
    'noCategoryFound': {
      'en': 'No category found',
      'fr': 'Aucune catégorie trouvée',
    },
    'minStockThresholdShouldBeLessThanStockQuantity': {
      'en': 'Min stock threshold should be less than stock quantity',
      'fr':
          'Le seuil de stock minimum doit être inférieur à la quantité en stock',
    },
    'quantityShouldBeGreaterThanMinStockThreshold': {
      'en': 'Quantity should be greater than min stock threshold',
      'fr': 'La quantité doit être supérieure au seuil de stock minimum',
    },
    'expirationDateShouldBeAfterToday': {
      'en': 'Expiration date should be after today',
      'fr': 'La date d\'expiration doit être après aujourd\'hui',
    },
    'productSavedSuccessfully': {
      'en': 'Product saved successfully',
      'fr': 'Produit enregistré avec succès',
    },
    'inventoryManagement': {
      'en': 'Inventory Management',
      'fr': 'Gestion des inventaires',
    },
    'inventoryManagementDescription': {
      'en': 'Manage your products, stock levels, and inventory',
      'fr': 'Gestion de vos produits, niveaux de stock et inventaire',
    },
    'productManagementDescription': {
      'en': 'Manage your product inventory',
      'fr': 'Gestion de votre inventaire de produits',
    },
    'totalValue': {'en': 'Total Value', 'fr': 'Valeur totale'},
    'salesManagement': {'en': 'Sales Management', 'fr': 'Gestion des ventes'},
    'salesManagementDescription': {
      'en': 'Process transactions and manage sales history',
      'fr': 'Gestion des transactions et historique des ventes',
    },
    'totalSales': {'en': 'Total Sales', 'fr': 'Ventes totales'},
    'totalRevenue': {'en': 'Total Revenue', 'fr': 'Revenus totaux'},
    'itemSold': {'en': 'Item Sold', 'fr': 'Article vendu'},
    'transactionsCompleted': {
      'en': 'Transactions Completed',
      'fr': 'Transactions complétées',
    },
    'totalEarnings': {'en': 'Total Earnings', 'fr': 'Revenus totaux'},
    'totalQuantity': {'en': 'Total Quantity', 'fr': 'Quantité totale'},
    'salesHistory': {'en': 'Sales History', 'fr': 'Historique des ventes'},
    'salesHistoryDescription': {
      'en': 'View and manage your sales history',
      'fr': 'Voir et gérer votre historique des ventes',
    },
    'searchForOrder': {
      'en': 'Search by product name or transaction id ...',
      'fr': 'Rechercher par nom de produit ou id de transaction ...',
    },
    'pending': {'en': 'Pending', 'fr': 'En attente'},
    'completed': {'en': 'Completed', 'fr': 'Completé'},
    'cancelled': {'en': 'Cancelled', 'fr': 'Annulé'},
    'processing': {'en': 'Processing', 'fr': 'En traitement'},
    'orderId': {'en': 'Order #', 'fr': 'Commande #'},
    'dateAndTime': {'en': 'Date & Time', 'fr': 'Date & Heure'},
    'items': {'en': 'Items', 'fr': 'Articles'},
    'total': {'en': 'Total', 'fr': 'Total'},
    'noDataFound': {'en': 'No data found', 'fr': 'Aucune donnée trouvée'},
    'dateRange': {'en': 'Date Range', 'fr': 'Plage de date'},
    'inboundDate': {'en': 'Inbound Date', 'fr': 'Date d\'entrée'},
    'newOrders': {'en': 'New Orders', 'fr': 'Nouvelles commandes'},
    'newOrderSales': {'en': 'New Order Sales', 'fr': 'Nouvelle vente'},
    'newOrderSalesDescription': {
      'en': 'Manage your new order sales',
      'fr': 'Gestion de vos nouvelles ventes',
    },
    'noItemsAdded': {'en': 'No items added', 'fr': 'Aucun article ajouté'},
    'each': {'en': 'each', 'fr': 'chaque'},
    'cart': {'en': 'Cart', 'fr': 'Panier'},
    'completeOrder': {'en': 'Complete Order', 'fr': 'Compléter la commande'},
    'holdOrder': {'en': 'Hold Order', 'fr': 'Retenir la commande'},
    'clearOrder': {'en': 'Clear Order', 'fr': 'Effacer la commande'},
    'scanOrSearchProduct': {
      'en': 'Scan or Search Product to add...',
      'fr': 'Scanner ou rechercher un produit a ajouter...',
    },
    'noProductsFound': {
      'en': 'No products found',
      'fr': 'Aucun produit trouvé',
    },
    'resumeOrder': {'en': 'Resume Order', 'fr': 'Reprendre la commande'},
    'holdOrders': {'en': 'Hold Orders', 'fr': 'Commandes retenues'},
    'holdOrdersDescription': {
      'en': 'Manage orders that are not completed.',
      'fr': 'Gestion des commandes qui ne sont pas complétées.',
    },
    'max': {'en': 'Max', 'fr': 'Max'},
    'orderCompletedSuccessfully': {
      'en': 'Order completed successfully',
      'fr': 'Commande complétée avec succès',
    },
    'failedToCompleteOrder': {
      'en': 'Failed to complete order',
      'fr': 'Échec de la commande',
    },
    'emptyCart': {'en': 'Empty Cart', 'fr': 'Panier vide'},
    'addProductToStartSale': {
      'en': 'Add product to start sale',
      'fr': 'Ajouter un produit pour commencer la vente',
    },
    'settingsTitleDescription': {
      'en':
          'Manage your account, business information, and application preferences.',
      'fr':
          'Gestion de votre compte, informations de votre entreprise et préférences de l\'application.',
    },
    'businessInfo': {
      'en': 'Business Information',
      'fr': 'Informations de l\'entreprise',
    },
    'storeInfo': {'en': 'Store Information', 'fr': 'Informations du magasin'},
    'security&privacy': {
      'en': 'Security & Privacy',
      'fr': 'Sécurité & Confidentialité',
    },
    'system': {'en': 'System', 'fr': 'Système'},
    'businessInfoSubtitle': {
      'en': 'Manage your business details and contact information',
      'fr': 'Gestion de vos informations de l\'entreprise et de vos contacts',
    },
    'storeInfoSubtitle': {
      'en': 'Manage your store details and contact information',
      'fr': 'Gestion de vos informations du magasin et de vos contacts',
    },
    'notificationsSubtitle': {
      'en': 'Configure notification preferences',
      'fr': 'Configuration des préférences de notification',
    },
    'securitySubtitle': {
      'en': 'Configure security settings and data privacy',
      'fr':
          'Configuration des paramètres de sécurité et de la confidentialité des données',
    },
    'systemSubtitle': {
      'en': 'Manage your system settings',
      'fr': 'Gestion des paramètres de votre système',
    },
    'businessDetails': {
      'en': 'Business Details',
      'fr': 'Informations de l\'entreprise',
    },
    'businessLogo': {'en': 'Business Logo', 'fr': 'Logo de l\'entreprise'},
    'storeDetails': {'en': 'Store Details', 'fr': 'Informations du magasin'},
    'saveChanges': {
      'en': 'Save Changes',
      'fr': 'Enregistrer les modifications',
    },
    'uploadYourBusinessLogo': {
      'en': 'Upload your business logo',
      'fr': 'Téléchargez votre logo d\'entreprise',
    },
    'changeLogo': {'en': 'Change Logo', 'fr': 'Changer de logo'},
    'currency': {'en': 'Currency', 'fr': 'Devise'},
    'guest': {'en': 'Guest', 'fr': 'Invité'},
    'yourAreNotAssociatedWithAnyBusiness': {
      'en': 'You are not associated with any business.',
      'fr': 'Vous n\'êtes associé à aucune entreprise.',
    },
    'selectCurrency': {
      'en': 'Select Currency',
      'fr': 'Sélectionner une devise',
    },
    'businessEmail': {'en': 'Business Email', 'fr': 'Email de l\'entreprise'},
    'businessPhone': {
      'en': 'Business Phone',
      'fr': 'Téléphone de l\'entreprise',
    },
    'businessAddress': {
      'en': 'Business Address',
      'fr': 'Adresse de l\'entreprise',
    },
    'photoLibrary': {'en': 'Photo Library', 'fr': 'Galerie de photos'},
    'camera': {'en': 'Camera', 'fr': 'Caméra'},
    'storeLogo': {'en': 'Store Logo', 'fr': 'Logo du magasin'},
    'uploadYourStoreLogo': {
      'en': 'Upload your store logo',
      'fr': 'Téléchargez votre logo de magasin',
    },
    'yourAreNotAssociatedWithAnyStore': {
      'en': 'You are not associated with any store.',
      'fr': 'Vous n\'êtes associé à aucun magasin.',
    },
    'storeEmail': {'en': 'Store Email', 'fr': 'Email du magasin'},
    'storePhone': {'en': 'Store Phone', 'fr': 'Téléphone du magasin'},
    'changePassword': {
      'en': 'Change Password',
      'fr': 'Changer le mot de passe',
    },
    'twoFactorAuthentication': {
      'en': 'Two Factor Authentication',
      'fr': 'Authentification à deux facteurs',
    },
    'twoFactorAuthenticationDescription': {
      'en': 'Add an extra layer of security',
      'fr': 'Ajoutez une couche supplémentaire de sécurité',
    },
    'notEnabled': {'en': 'Not Enabled', 'fr': 'Non activé'},
    'enable2FA': {'en': 'Enable 2FA', 'fr': 'Activer 2FA'},
    'dataAndPrivacy': {
      'en': 'Data & Privacy',
      'fr': 'Données & Confidentialité',
    },
    'exportMyData': {'en': 'Export my data', 'fr': 'Exporter mes données'},
    'applicationSettings': {
      'en': 'Application Settings',
      'fr': 'Paramètres de l\'application',
    },
    'darkMode': {'en': 'Dark Mode', 'fr': 'Mode sombre'},
    'darkModeDescription': {
      'en': 'Switch between light and dark mode',
      'fr': 'Basculer entre le mode clair et le mode sombre',
    },
    'languageDescription': {
      'en': 'Change the language of the app',
      'fr': 'Changer la langue de l\'application',
    },
    'systemSettings': {'en': 'System Settings', 'fr': 'Paramètres du système'},
    'switchBusiness': {
      'en': 'Switch Business',
      'fr': 'Basculer entre les entreprises',
    },
    'switchStore': {'en': 'Switch Store', 'fr': 'Basculer entre les magasins'},
    'allBusiness': {'en': 'All Business', 'fr': 'Toutes les entreprises'},
    'allStores': {'en': 'All Stores', 'fr': 'Tous les magasins'},
    'businessUpdatedSuccessfully': {
      'en': 'Business updated successfully',
      'fr': 'Entreprise mise à jour avec succès',
    },
  };

  /// Direct access to the internationalization service.
  static AppInternationalizationService get to =>
      GetIt.I<AppInternationalizationService>();

  /// Constructors for internationalization.
  AppInternationalizationService(Locale initialLocale, this._box)
    : _locale = initialLocale;

  /// The current locale.
  Locale get locale => _locale;

  /// The supported locales.
  static List<Locale> get supportedLocales => [
    const Locale('en'),
    const Locale('fr'),
  ];

  /// Returns the localized value of text 'businessUpdatedSuccessfully'.
  String get businessUpdatedSuccessfully =>
      _stringOfLocalizedValue('businessUpdatedSuccessfully');

  /// Returns the localized value of text 'allBusiness'.
  String get allBusiness => _stringOfLocalizedValue('allBusiness');

  /// Returns the localized value of text 'allStores'.
  String get allStores => _stringOfLocalizedValue('allStores');

  /// Returns the localized value of text 'switchBusiness'.
  String get switchBusiness => _stringOfLocalizedValue('switchBusiness');

  /// Returns the localized value of text 'switchStore'.
  String get switchStore => _stringOfLocalizedValue('switchStore');

  /// Returns the localized value of text 'systemSettings'.
  String get systemSettings => _stringOfLocalizedValue('systemSettings');

  /// Returns the localized value of text 'newOrders'.
  String get newOrders => _stringOfLocalizedValue('newOrders');

  /// Returns the localized value of text 'applicationSettings'.
  String get applicationSettings =>
      _stringOfLocalizedValue('applicationSettings');

  /// Returns the localized value of text 'darkMode'.
  String get darkMode => _stringOfLocalizedValue('darkMode');

  /// Returns the localized value of text 'darkModeDescription'.
  String get darkModeDescription =>
      _stringOfLocalizedValue('darkModeDescription');

  /// Returns the localized value of text 'languageDescription'.
  String get languageDescription =>
      _stringOfLocalizedValue('languageDescription');

  /// Returns the localized value of text 'exportMyData'.
  String get exportMyData => _stringOfLocalizedValue('exportMyData');

  /// Returns the localized value of text 'dataAndPrivacy'.
  String get dataAndPrivacy => _stringOfLocalizedValue('dataAndPrivacy');

  /// Returns the localized value of text 'enable2FA'.
  String get enable2FA => _stringOfLocalizedValue('enable2FA');

  /// Returns the localized value of text 'twoFactorAuthentication'.
  String get twoFactorAuthentication =>
      _stringOfLocalizedValue('twoFactorAuthentication');

  /// Returns the localized value of text 'twoFactorAuthenticationDescription'.
  String get twoFactorAuthenticationDescription =>
      _stringOfLocalizedValue('twoFactorAuthenticationDescription');

  /// Returns the localized value of text 'notEnabled'.
  String get notEnabled => _stringOfLocalizedValue('notEnabled');

  /// Returns the localized value of text 'changePassword'.
  String get changePassword => _stringOfLocalizedValue('changePassword');

  /// Returns the localized value of text 'storeEmail'.
  String get storeEmail => _stringOfLocalizedValue('storeEmail');

  /// Returns the localized value of text 'storePhone'.
  String get storePhone => _stringOfLocalizedValue('storePhone');

  /// Returns the localized value of text 'yourAreNotAssociatedWithAnyStore'.
  String get yourAreNotAssociatedWithAnyStore =>
      _stringOfLocalizedValue('yourAreNotAssociatedWithAnyStore');

  /// Returns the localized value of text 'storeLogo'.
  String get storeLogo => _stringOfLocalizedValue('storeLogo');

  /// Returns the localized value of text 'uploadYourStoreLogo'.
  String get uploadYourStoreLogo =>
      _stringOfLocalizedValue('uploadYourStoreLogo');

  /// Returns the localized value of text 'saveChanges'.
  String get saveChanges => _stringOfLocalizedValue('saveChanges');

  /// Returns the localized value of text 'photoLibrary'.
  String get photoLibrary => _stringOfLocalizedValue('photoLibrary');

  /// Returns the localized value of text 'camera'.
  String get camera => _stringOfLocalizedValue('camera');

  /// Returns the localized value of text 'uploadYourBusinessLogo'.
  String get uploadYourBusinessLogo =>
      _stringOfLocalizedValue('uploadYourBusinessLogo');

  /// Returns the localized value of text 'selectCurrency'.
  String get selectCurrency => _stringOfLocalizedValue('selectCurrency');

  /// Returns the localized value of text 'businessEmail'.
  String get businessEmail => _stringOfLocalizedValue('businessEmail');

  /// Returns the localized value of text 'businessPhone'.
  String get businessPhone => _stringOfLocalizedValue('businessPhone');

  /// Returns the localized value of text 'businessAddress'.
  String get businessAddress => _stringOfLocalizedValue('businessAddress');

  /// Returns the localized value of text 'yourAreNotAssociatedWithAnyBusiness'.
  String get yourAreNotAssociatedWithAnyBusiness =>
      _stringOfLocalizedValue('yourAreNotAssociatedWithAnyBusiness');

  /// Returns the localized value of text 'guest'.
  String get guest => _stringOfLocalizedValue('guest');

  /// Returns the localized value of text 'currency'.
  String get currency => _stringOfLocalizedValue('currency');

  /// Returns the localized value of text 'changeLogo'.
  String get changeLogo => _stringOfLocalizedValue('changeLogo');

  /// Returns the localized value of text 'businessLogo'.
  String get businessLogo => _stringOfLocalizedValue('businessLogo');

  /// Returns the localized value of text 'storeDetails'.
  String get storeDetails => _stringOfLocalizedValue('storeDetails');

  /// Returns the localized value of text 'businessDetails'.
  String get businessDetails => _stringOfLocalizedValue('businessDetails');

  /// Returns the localized value of text 'security&privacy'.
  String get securityAndPrivacy => _stringOfLocalizedValue('security&privacy');

  /// Returns the localized value of text 'businessInfo'.
  String get businessInfo => _stringOfLocalizedValue('businessInfo');

  /// Returns the localized value of text 'storeInfo'.
  String get storeInfo => _stringOfLocalizedValue('storeInfo');

  /// Returns the localized value of text 'system'.
  String get system => _stringOfLocalizedValue('system');

  /// Returns the localized value of text 'businessInfoSubtitle'.
  String get businessInfoSubtitle =>
      _stringOfLocalizedValue('businessInfoSubtitle');

  /// Returns the localized value of text 'storeInfoSubtitle'.
  String get storeInfoSubtitle => _stringOfLocalizedValue('storeInfoSubtitle');

  /// Returns the localized value of text 'notificationsSubtitle'.
  String get notificationsSubtitle =>
      _stringOfLocalizedValue('notificationsSubtitle');

  /// Returns the localized value of text 'securitySubtitle'.
  String get securitySubtitle => _stringOfLocalizedValue('securitySubtitle');

  /// Returns the localized value of text 'systemSubtitle'.
  String get systemSubtitle => _stringOfLocalizedValue('systemSubtitle');

  /// Returns the localized value of text 'settingsTitleDescription'.
  String get settingsTitleDescription =>
      _stringOfLocalizedValue('settingsTitleDescription');

  /// Returns the localized value of text 'emptyCart'.
  String get emptyCart => _stringOfLocalizedValue('emptyCart');

  /// Returns the localized value of text 'addProductToStartSale'.
  String get addProductToStartSale =>
      _stringOfLocalizedValue('addProductToStartSale');

  /// Returns the localized value of text 'failedToCompleteOrder'.
  String get failedToCompleteOrder =>
      _stringOfLocalizedValue('failedToCompleteOrder');

  /// Returns the localized value of text 'orderCompletedSuccessfully'.
  String get orderCompletedSuccessfully =>
      _stringOfLocalizedValue('orderCompletedSuccessfully');

  /// Returns the localized value of text 'max'.
  String get max => _stringOfLocalizedValue('max');

  /// Returns the localized value of text 'holdOrders'.
  String get holdOrders => _stringOfLocalizedValue('holdOrders');

  /// Returns the localized value of text 'holdOrdersDescription'.
  String get holdOrdersDescription =>
      _stringOfLocalizedValue('holdOrdersDescription');

  /// Returns the localized value of text 'resumeOrder'.
  String get resumeOrder => _stringOfLocalizedValue('resumeOrder');

  /// Returns the localized value of text 'noProductsFound'.
  String get noProductsFound => _stringOfLocalizedValue('noProductsFound');

  /// Returns the localized value of text 'scanOrSearchProduct'.
  String get scanOrSearchProduct =>
      _stringOfLocalizedValue('scanOrSearchProduct');

  /// Returns the localized value of text 'completeOrder'.
  String get completeOrder => _stringOfLocalizedValue('completeOrder');

  /// Returns the localized value of text 'holdOrder'.
  String get holdOrder => _stringOfLocalizedValue('holdOrder');

  /// Returns the localized value of text 'clearOrder'.
  String get clearOrder => _stringOfLocalizedValue('clearOrder');

  /// Returns the localized value of text 'cart'.
  String get cart => _stringOfLocalizedValue('cart');

  /// Returns the localized value of text 'each'.
  String get each => _stringOfLocalizedValue('each');

  /// Returns the localized value of text 'noItemsAdded'.
  String get noItemsAdded => _stringOfLocalizedValue('noItemsAdded');

  /// Returns the localized value of text 'newOrderSales'.
  String get newOrderSales => _stringOfLocalizedValue('newOrderSales');

  /// Returns the localized value of text 'newOrderSalesDescription'.
  String get newOrderSalesDescription =>
      _stringOfLocalizedValue('newOrderSalesDescription');

  /// Returns the localized value of text 'dateRange'.
  String get dateRange => _stringOfLocalizedValue('dateRange');

  /// Returns the localized value of text 'noDataFound'.
  String get noDataFound => _stringOfLocalizedValue('noDataFound');

  /// Returns the localized value of text 'orderId'.
  String get orderId => _stringOfLocalizedValue('orderId');

  /// Returns the localized value of text 'dateAndTime'.
  String get dateAndTime => _stringOfLocalizedValue('dateAndTime');

  /// Returns the localized value of text 'items'.
  String get items => _stringOfLocalizedValue('items');

  /// Returns the localized value of text 'total'.
  String get total => _stringOfLocalizedValue('total');

  /// Returns the localized value of text 'pending'.
  String get pending => _stringOfLocalizedValue('pending');

  /// Returns the localized value of text 'completed'.
  String get completed => _stringOfLocalizedValue('completed');

  /// Returns the localized value of text 'cancelled'.
  String get cancelled => _stringOfLocalizedValue('cancelled');

  /// Returns the localized value of text 'processing'.
  String get processing => _stringOfLocalizedValue('processing');

  /// Returns the localized value of text 'searchForOrder'.
  String get searchForOrder => _stringOfLocalizedValue('searchForOrder');

  /// Returns the localized value of text 'salesHistory'.
  String get salesHistory => _stringOfLocalizedValue('salesHistory');

  /// Returns the localized value of text 'salesHistoryDescription'.
  String get salesHistoryDescription =>
      _stringOfLocalizedValue('salesHistoryDescription');

  /// Returns the localized value of text 'transactionsCompleted'.
  String get transactionsCompleted =>
      _stringOfLocalizedValue('transactionsCompleted');

  /// Returns the localized value of text 'totalEarnings'.
  String get totalEarnings => _stringOfLocalizedValue('totalEarnings');

  /// Returns the localized value of text 'totalQuantity'.
  String get totalQuantity => _stringOfLocalizedValue('totalQuantity');

  /// Returns the localized value of text 'totalSales'.
  String get totalSales => _stringOfLocalizedValue('totalSales');

  /// Returns the localized value of text 'totalRevenue'.
  String get totalRevenue => _stringOfLocalizedValue('totalRevenue');

  /// Returns the localized value of text 'itemSold'.
  String get itemSold => _stringOfLocalizedValue('itemSold');

  /// Returns the localized value of text 'salesManagement'.
  String get salesManagement => _stringOfLocalizedValue('salesManagement');

  /// Returns the localized value of text 'salesManagementDescription'.
  String get salesManagementDescription =>
      _stringOfLocalizedValue('salesManagementDescription');

  /// Returns the localized value of text 'inboundDate'.
  String get inboundDate => _stringOfLocalizedValue('inboundDate');

  /// Returns the localized value of text 'totalValue'.
  String get totalValue => _stringOfLocalizedValue('totalValue');

  /// Returns the localized value of text 'productManagementDescription'.
  String get productManagementDescription =>
      _stringOfLocalizedValue('productManagementDescription');

  /// Returns the localized value of text 'inventoryManagement'.
  String get inventoryManagement =>
      _stringOfLocalizedValue('inventoryManagement');

  /// Returns the localized value of text 'inventoryManagementDescription'.
  String get inventoryManagementDescription =>
      _stringOfLocalizedValue('inventoryManagementDescription');

  /// Returns the localized value of text 'productSavedSuccessfully'.
  String get productSavedSuccessfully =>
      _stringOfLocalizedValue('productSavedSuccessfully');

  /// Returns the localized value of text 'expirationDateShouldBeAfterToday'.
  String get expirationDateShouldBeAfterToday =>
      _stringOfLocalizedValue('expirationDateShouldBeAfterToday');

  /// Returns the localized value of text 'quantityShouldBeGreaterThanMinStockThreshold'.
  String get quantityShouldBeGreaterThanMinStockThreshold =>
      _stringOfLocalizedValue('quantityShouldBeGreaterThanMinStockThreshold');

  /// Returns the localized value of text 'minStockThresholdShouldBeLessThanStockQuantity'.
  String get minStockThresholdShouldBeLessThanStockQuantity =>
      _stringOfLocalizedValue('minStockThresholdShouldBeLessThanStockQuantity');

  /// Returns the localized value of text 'noCategoryFound'.
  String get noCategoryFound => _stringOfLocalizedValue('noCategoryFound');

  /// Returns the localized value of text 'searchCategory'.
  String get searchCategory => _stringOfLocalizedValue('searchCategory');

  /// Returns the localized value of text 'noProductsFoundAddNewProduct'.
  String get noProductsFoundAddNewProduct =>
      _stringOfLocalizedValue('noProductsFoundAddNewProduct');

  /// Returns the localized value of text 'stockQuantity'.
  String get stockQuantity => _stringOfLocalizedValue('stockQuantity');

  /// Returns the localized value of text 'minStockThreshold'.
  String get minStockThreshold => _stringOfLocalizedValue('minStockThreshold');

  /// Returns the localized value of text 'scanBarcode'.
  String get scanBarcode => _stringOfLocalizedValue('scanBarcode');

  /// Returns the localized value of text 'scanOrEnterBarcode'.
  String get scanOrEnterBarcode =>
      _stringOfLocalizedValue('scanOrEnterBarcode');

  /// Returns the localized value of text 'barcode'.
  String get barcode => _stringOfLocalizedValue('barcode');

  /// Returns the localized value of text 'enterProductName'.
  String get enterProductName => _stringOfLocalizedValue('enterProductName');

  /// Returns the localized value of text 'isRequiredField'.
  String get isRequiredField => _stringOfLocalizedValue('isRequiredField');

  /// Returns the localized value of text 'selectSupplier'.
  String get selectSupplier => _stringOfLocalizedValue('selectSupplier');

  /// Returns the localized value of text 'selectCategory'.
  String get selectCategory => _stringOfLocalizedValue('selectCategory');

  /// Returns the localized value of text 'editProduct'.
  String get editProduct => _stringOfLocalizedValue('editProduct');

  /// Returns the localized value of text 'outOfStock'.
  String get outOfStock => _stringOfLocalizedValue('outOfStock');

  /// Returns the localized value of text 'productDeletedSuccessfully'.
  String get productDeletedSuccessfully =>
      _stringOfLocalizedValue('productDeletedSuccessfully');

  /// Returns the localized value of text 'failedToDeleteProduct'.
  String get failedToDeleteProduct =>
      _stringOfLocalizedValue('failedToDeleteProduct');

  /// Returns the localized value of text 'deleteProduct'.
  String get deleteProduct => _stringOfLocalizedValue('deleteProduct');

  /// Returns the localized value of text 'areYouSureYouWantToDelete'.
  String get areYouSureYouWantToDelete =>
      _stringOfLocalizedValue('areYouSureYouWantToDelete');

  /// Returns the localized value of text 'product'.
  String get product => _stringOfLocalizedValue('product');

  /// Returns the localized value of text 'status'.
  String get status => _stringOfLocalizedValue('status');

  /// Returns the localized value of text 'expiry'.
  String get expiry => _stringOfLocalizedValue('expiry');

  /// Returns the localized value of text 'allCategories'.
  String get allCategories => _stringOfLocalizedValue('allCategories');

  /// Returns the localized value of text 'searchAndFilter'.
  String get searchAndFilter => _stringOfLocalizedValue('searchAndFilter');

  /// Returns the localized value of text 'productManagement'.
  String get productManagement => _stringOfLocalizedValue('productManagement');

  /// Returns the localized value of text 'manageYourProducts'.
  String get manageYourProducts =>
      _stringOfLocalizedValue('manageYourProducts');

  /// Returns the localized value of text 'anErrorOccurredPleaseTryAgain'.
  String get anErrorOccurredPleaseTryAgain =>
      _stringOfLocalizedValue('anErrorOccurredPleaseTryAgain');

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

  // Suppliers module getters
  /// Returns the localized value of supplierManagement.
  String get supplierManagement =>
      _stringOfLocalizedValue('supplierManagement');

  /// Returns the localized value of manageSupplierRelationships.
  String get manageSupplierRelationships =>
      _stringOfLocalizedValue('manageSupplierRelationships');

  /// Returns the localized value of addSupplierBtn.
  String get addSupplierBtn => _stringOfLocalizedValue('addSupplierBtn');

  /// Returns the localized value of editSupplierBtn.
  String get editSupplierBtn => _stringOfLocalizedValue('editSupplierBtn');

  /// Returns the localized value of deleteSupplierBtn.
  String get deleteSupplierBtn => _stringOfLocalizedValue('deleteSupplierBtn');

  /// Returns the localized value of totalSuppliersCount.
  String get totalSuppliersCount =>
      _stringOfLocalizedValue('totalSuppliersCount');

  /// Returns the localized value of activeSuppliersText.
  String get activeSuppliersText =>
      _stringOfLocalizedValue('activeSuppliersText');

  /// Returns the localized value of totalProductsCount.
  String get totalProductsCount =>
      _stringOfLocalizedValue('totalProductsCount');

  /// Returns the localized value of fromAllSuppliersText.
  String get fromAllSuppliersText =>
      _stringOfLocalizedValue('fromAllSuppliersText');

  /// Returns the localized value of avgProductsText.
  String get avgProductsText => _stringOfLocalizedValue('avgProductsText');

  /// Returns the localized value of perSupplierText.
  String get perSupplierText => _stringOfLocalizedValue('perSupplierText');

  /// Returns the localized value of totalValueText.
  String get totalValueText => _stringOfLocalizedValue('totalValueText');

  /// Returns the localized value of allInventoryText.
  String get allInventoryText => _stringOfLocalizedValue('allInventoryText');

  /// Returns the localized value of suppliersTitle.
  String get suppliersTitle => _stringOfLocalizedValue('suppliersTitle');

  /// Returns the localized value of contactInfoText.
  String get contactInfoText => _stringOfLocalizedValue('contactInfoText');

  /// Returns the localized value of productsText.
  String get productsText => _stringOfLocalizedValue('productsText');

  /// Returns the localized value of statusText.
  String get statusText => _stringOfLocalizedValue('statusText');

  /// Returns the localized value of activeText.
  String get activeText => _stringOfLocalizedValue('activeText');

  /// Returns the localized value of inactiveText.
  String get inactiveText => _stringOfLocalizedValue('inactiveText');

  /// Returns the localized value of noSuppliersYet.
  String get noSuppliersYet => _stringOfLocalizedValue('noSuppliersYet');

  /// Returns the localized value of addFirstSupplier.
  String get addFirstSupplier => _stringOfLocalizedValue('addFirstSupplier');

  /// Returns the localized value of deleteSupplierConfirm.
  String get deleteSupplierConfirm =>
      _stringOfLocalizedValue('deleteSupplierConfirm');

  /// Returns the localized value of cantDeleteSupplierWithProducts.
  String get cantDeleteSupplierWithProducts =>
      _stringOfLocalizedValue('cantDeleteSupplierWithProducts');

  /// Returns the localized value of supplierDeletedSuccessfully.
  String get supplierDeletedSuccessfully =>
      _stringOfLocalizedValue('supplierDeletedSuccessfully');

  /// Returns the localized value of warningSupplierHasProducts.
  String get warningSupplierHasProducts =>
      _stringOfLocalizedValue('warningSupplierHasProducts');

  /// Returns the localized value of addNewSupplier.
  String get addNewSupplier => _stringOfLocalizedValue('addNewSupplier');

  /// Returns the localized value of enterDetailsNewSupplier.
  String get enterDetailsNewSupplier =>
      _stringOfLocalizedValue('enterDetailsNewSupplier');

  /// Returns the localized value of updateSupplierInfo.
  String get updateSupplierInfo =>
      _stringOfLocalizedValue('updateSupplierInfo');

  /// Returns the localized value of companyName.
  String get companyName => _stringOfLocalizedValue('companyName');

  /// Returns the localized value of enterCompanyName.
  String get enterCompanyName => _stringOfLocalizedValue('enterCompanyName');

  /// Returns the localized value of companyNameRequired.
  String get companyNameRequired =>
      _stringOfLocalizedValue('companyNameRequired');

  /// Returns the localized value of companyNameTooShort.
  String get companyNameTooShort =>
      _stringOfLocalizedValue('companyNameTooShort');

  // Error widget getters
  /// Returns the localized value of errorLoadingSuppliers.
  String get errorLoadingSuppliers =>
      _stringOfLocalizedValue('errorLoadingSuppliers');

  /// Returns the localized value of networkErrorMessage.
  String get networkErrorMessage =>
      _stringOfLocalizedValue('networkErrorMessage');

  /// Returns the localized value of authErrorMessage.
  String get authErrorMessage => _stringOfLocalizedValue('authErrorMessage');

  /// Returns the localized value of serverErrorMessage.
  String get serverErrorMessage =>
      _stringOfLocalizedValue('serverErrorMessage');

  /// Returns the localized value of dataFormatErrorMessage.
  String get dataFormatErrorMessage =>
      _stringOfLocalizedValue('dataFormatErrorMessage');

  /// Returns the localized value of genericErrorMessage.
  String get genericErrorMessage =>
      _stringOfLocalizedValue('genericErrorMessage');

  /// Returns the localized value of suggestionsText.
  String get suggestionsText => _stringOfLocalizedValue('suggestionsText');

  /// Returns the localized value of checkInternetConnection.
  String get checkInternetConnection =>
      _stringOfLocalizedValue('checkInternetConnection');

  /// Returns the localized value of refreshPageSuggestion.
  String get refreshPageSuggestion =>
      _stringOfLocalizedValue('refreshPageSuggestion');

  /// Returns the localized value of contactAdminSuggestion.
  String get contactAdminSuggestion =>
      _stringOfLocalizedValue('contactAdminSuggestion');

  /// Returns the localized value of retryText.
  String get retryText => _stringOfLocalizedValue('retryText');

  /// Returns the localized value of contactSupportText.
  String get contactSupportText =>
      _stringOfLocalizedValue('contactSupportText');

  /// Returns the localized value of contactSupportMessage.
  String get contactSupportMessage =>
      _stringOfLocalizedValue('contactSupportMessage');

  /// Returns the localized value of errorDetailsText.
  String get errorDetailsText => _stringOfLocalizedValue('errorDetailsText');

  /// Returns the localized value of closeText.
  String get closeText => _stringOfLocalizedValue('closeText');

  /// Returns the localized value of isActive.
  String get isActive => _stringOfLocalizedValue('isActive');

  /// Returns the localized value of enterPhoneNumber.
  String get enterPhoneNumber => _stringOfLocalizedValue('enterPhoneNumber');

  /// Returns the localized value of emailAddress.
  String get emailAddress => _stringOfLocalizedValue('emailAddress');

  /// Returns the localized value of enterEmailAddress.
  String get enterEmailAddress => _stringOfLocalizedValue('enterEmailAddress');

  /// Returns the localized value of validEmailRequired.
  String get validEmailRequired =>
      _stringOfLocalizedValue('validEmailRequired');

  /// Returns the localized value of enterCompleteAddress.
  String get enterCompleteAddress =>
      _stringOfLocalizedValue('enterCompleteAddress');

  /// Returns the localized value of addressRequired.
  String get addressRequired => _stringOfLocalizedValue('addressRequired');

  /// Returns the localized value of addressTooShort.
  String get addressTooShort => _stringOfLocalizedValue('addressTooShort');

  /// Returns the localized value of address.
  String get address => _stringOfLocalizedValue('address');

  /// Returns the localized value of notes.
  String get notes => _stringOfLocalizedValue('notes');

  /// Returns the localized value of additionalNotes.
  String get additionalNotes => _stringOfLocalizedValue('additionalNotes');

  /// Returns the localized value of supplierInformation.
  String get supplierInformation =>
      _stringOfLocalizedValue('supplierInformation');

  /// Returns the localized value of supplierInfoDescription.
  String get supplierInfoDescription =>
      _stringOfLocalizedValue('supplierInfoDescription');

  /// Returns the localized value of updateSupplier.
  String get updateSupplier => _stringOfLocalizedValue('updateSupplier');

  /// Returns the localized value of supplierAddedSuccessfully.
  String get supplierAddedSuccessfully =>
      _stringOfLocalizedValue('supplierAddedSuccessfully');

  /// Returns the localized value of supplierUpdatedSuccessfully.
  String get supplierUpdatedSuccessfully =>
      _stringOfLocalizedValue('supplierUpdatedSuccessfully');

  /// Returns the localized value of failedToSaveSupplier.
  String get failedToSaveSupplier =>
      _stringOfLocalizedValue('failedToSaveSupplier');

  /// Returns the localized value of failedToDeleteSupplier.
  String get failedToDeleteSupplier =>
      _stringOfLocalizedValue('failedToDeleteSupplier');

  /// Returns the localized value of successText.
  String get successText => _stringOfLocalizedValue('successText');

  /// Returns the localized value of errorText.
  String get errorText => _stringOfLocalizedValue('errorText');

  /// Changes the locale.
  void changeLocale([Locale? newLocale]) {
    final local = switch ((newLocale, _locale.languageCode)) {
      (final Locale newLocale, _) => newLocale,
      (null, 'en') => const Locale('fr'),
      (_, _) => const Locale('en'),
    };

    if (_locale == local) {
      return;
    }
    _locale = local;

    _box.write(_key, local.languageCode);
    notifyListeners();
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

  String _stringOfLocalizedValue(String value) {
    return GetIt.I<AppInternationalizationService>().translate(value);
  }
}

/// Extension method for easy access to translations.
extension TranslationExtension on String {
  /// Get the translation for the given key.
  ///
  /// If [args] is specified, named string substitution is performed on the
  /// translation string. For example, if the translation string is "Hello, {name}!"
  /// and [args] is {"name": "John"}, the result will be "Hello, John!".
  String trParams([Map<String, String>? args]) {
    String result = this;
    args?.forEach((key, value) {
      result = result.replaceAll('@$key', value);
    });

    return result;
  }
}
