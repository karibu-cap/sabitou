import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../../utils/app_constants.dart';

/// The short version of [AppInternationalizationService].
typedef Intls = AppInternationalizationService;

/// AppInternalization defines all the 'local' strings displayed to.
class AppInternationalizationService extends ChangeNotifier {
  final _key = PreferencesKey.language;
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
    'members': {'en': 'Members', 'fr': 'Membres'},
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
    'asCategory': {'en': 'as category', 'fr': 'comme catégorie'},
    'selectOption': {'en': 'Select option', 'fr': 'Sélectionner une option'},
    'typeToSearch': {
      'en': 'Type to search...',
      'fr': 'Tapez pour rechercher...',
    },
    'update': {'en': 'Update', 'fr': 'Mettre à jour'},
    'read': {'en': 'Read', 'fr': 'Lire'},
    'invite': {'en': 'Invite', 'fr': 'Inviter'},
    'create': {'en': 'Create', 'fr': 'Créer'},
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
    'productImages': {'en': 'Product Images', 'fr': 'Images du produit'},
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
    'quickAddCategory': {
      'en': 'Quick Add Category',
      'fr': 'Ajout rapide de catégorie',
    },
    'hideQuickAdd': {'en': 'Hide Quick Add', 'fr': 'Masquer l\'ajout rapide'},
    'enterCategoryName': {
      'en': 'Enter category name',
      'fr': 'Entrez le nom de la catégorie',
    },
    'englishName': {'en': 'English name', 'fr': 'Nom en anglais'},
    'frenchName': {'en': 'French name', 'fr': 'Nom en français'},
    'tryDifferentSearch': {
      'en': 'Try a different search term',
      'fr': 'Essayez un terme de recherche différent',
    },
    'noCategoriesMatchFilters': {
      'en': 'No categories match your search',
      'fr': 'Aucune catégorie ne correspond à votre recherche',
    },
    'confirm': {'en': 'Confirm', 'fr': 'Confirmer'},
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
    'emptyCart': {
      'en': 'Empty Cart, please add products to continue',
      'fr': 'Panier vide. Ajoutez des articles avant de continuer.',
    },
    'addProductToStartSale': {
      'en': 'Add product to start sale',
      'fr': 'Ajouter un produit pour commencer la vente',
    },
    'teamManagement': {'en': 'Team Management', 'fr': 'Gestion d\'Équipe'},
    'manageTeamMembersRolesPermissions': {
      'en': 'Manage your team members, roles, and permissions.',
      'fr': 'Gérez les membres de votre équipe, les rôles et les permissions.',
    },
    'inviteUser': {'en': 'Invite User', 'fr': 'Inviter un Utilisateur'},
    'inviteNewTeamMember': {
      'en': 'Invite a new team member',
      'fr': 'Inviter un nouveau membre de l\'équipe',
    },
    'sendInvitationEmail': {
      'en': 'Send an invitation email to add them to your team.',
      'fr': 'Envoyez un e-mail d\'invitation pour les ajouter à votre équipe.',
    },
    'selectPermissions': {
      'en': 'Select Permissions',
      'fr': 'Sélectionner les Permissions',
    },
    'choosePermissionsForUser': {
      'en': 'Choose what this user can access and manage.',
      'fr': 'Choisissez ce que cet utilisateur peut accéder et gérer.',
    },
    'sendInvitation': {'en': 'Send Invitation', 'fr': 'Envoyer l\'Invitation'},
    'invitationSentSuccessfully': {
      'en': 'Invitation sent successfully',
      'fr': 'Invitation envoyée avec succès',
    },
    'errorSendingInvitation': {
      'en': 'Error sending invitation',
      'fr': 'Erreur lors de l\'envoi de l\'invitation',
    },
    'allStatus': {'en': 'All Status', 'fr': 'Tous les Statuts'},
    'searchTeamMembersByNameEmailStatus': {
      'en': 'Search team members by name, email, or status...',
      'fr': 'Rechercher les membres par nom, e-mail ou statut...',
    },
    'totalMembers': {'en': 'Total Members', 'fr': 'Total Membres'},
    'activeMembers': {'en': 'Active Members', 'fr': 'Membres Actifs'},
    'pendingMembers': {'en': 'Pending Members', 'fr': 'Membres en Attente'},
    'bannedMembers': {'en': 'Banned Members', 'fr': 'Membres Bannis'},
    'banned': {'en': 'Banned', 'fr': 'Banni'},
    'inactiveMembers': {'en': 'Inactive Members', 'fr': 'Membres Inactifs'},
    'teamMembers': {'en': 'Team members', 'fr': 'Membres de l\'équipe'},
    'awaitingResponse': {
      'en': 'Awaiting response',
      'fr': 'En attente de réponse',
    },
    'restrictedAccess': {'en': 'Restricted access', 'fr': 'Accès restreint'},
    'temporarilyDisabled': {
      'en': 'Temporarily disabled',
      'fr': 'Temporairement désactivé',
    },
    'joined': {'en': 'Joined', 'fr': 'Rejoint le'},
    'manageAccess': {'en': 'Manage Access', 'fr': 'Gérer l\'Accès'},
    'noPermissionsAssigned': {
      'en': 'No permissions assigned',
      'fr': 'Aucune permission assignée',
    },
    'thisUserHasNoPermissions': {
      'en': 'This user has no permissions assigned yet.',
      'fr': 'Cet utilisateur n\'a encore aucune permission assignée.',
    },
    'userPermissions': {
      'en': 'User Permissions',
      'fr': 'Permissions Utilisateur',
    },
    'manageUserPermissionsAndStatus': {
      'en': 'Manage user permissions and status.',
      'fr': 'Gérer les permissions et le statut de l\'utilisateur.',
    },
    'memberStatus': {'en': 'Member Status', 'fr': 'Statut du Membre'},
    'cannotChangeOwnStatus': {
      'en': 'You cannot change your own status.',
      'fr': 'Vous ne pouvez pas modifier votre propre statut.',
    },
    'changeUserStatus': {
      'en': 'Change the user\'s access status.',
      'fr': 'Changer le statut d\'accès de l\'utilisateur.',
    },
    'permissions': {'en': 'Permissions', 'fr': 'Permissions'},
    'selectWhatUserCanAccess': {
      'en': 'Select what this user can access and manage in your store.',
      'fr':
          'Sélectionnez ce que cet utilisateur peut accéder et gérer dans votre magasin.',
    },
    'saveChanges': {
      'en': 'Save Changes',
      'fr': 'Enregistrer les Modifications',
    },
    'permissionsUpdatedSuccessfully': {
      'en': 'Permissions updated successfully',
      'fr': 'Permissions mises à jour avec succès',
    },
    'errorUpdatingPermissions': {
      'en': 'Error updating permissions',
      'fr': 'Erreur lors de la mise à jour des permissions',
    },
    'errorUpdatingStatus': {
      'en': 'Error updating status',
      'fr': 'Erreur lors du changement de statut',
    },
    'deleteUser': {'en': 'Delete User', 'fr': 'Supprimer l\'Utilisateur'},
    'thisActionIsIrreversible': {
      'en': 'This action is irreversible',
      'fr': 'Cette action est irréversible',
    },
    'userWillBeRemovedPermanently': {
      'en':
          'This user will be removed from your team permanently. They will lose access to all store data and cannot be recovered.',
      'fr':
          'Cet utilisateur sera supprimé définitivement de votre équipe. Il perdra l\'accès à toutes les données du magasin et ne pourra pas être récupéré.',
    },
    'confirmationRequired': {
      'en': 'Confirmation required',
      'fr': 'Confirmation requise',
    },
    'typeToConfirmDeletion': {
      'en': 'To confirm deletion, type "{text}" below:',
      'fr': 'Pour confirmer la suppression, tapez "{text}" ci-dessous :',
    },
    'deletePermanently': {
      'en': 'Delete Permanently',
      'fr': 'Supprimer Définitivement',
    },
    'userDeletedSuccessfully': {
      'en': 'User deleted successfully',
      'fr': 'Utilisateur supprimé avec succès',
    },
    'errorDuringDeletion': {
      'en': 'Error during deletion',
      'fr': 'Erreur lors de la suppression',
    },
    'noTeamMembersYet': {
      'en': 'No team members yet',
      'fr': 'Aucun membre d\'équipe encore',
    },
    'inviteFirstTeamMember': {
      'en': 'Invite your first team member to get started.',
      'fr': 'Invitez votre premier membre d\'équipe pour commencer.',
    },
    'noMembersMatchFilters': {
      'en': 'No members match your filters',
      'fr': 'Aucun membre ne correspond à vos filtres',
    },
    'tryAdjustingFilters': {
      'en': 'Try adjusting your search or filter criteria.',
      'fr': 'Essayez d\'ajuster vos critères de recherche ou de filtre.',
    },
    'inviteMember': {'en': 'Invite Member', 'fr': 'Inviter un Membre'},
    'clearFilters': {'en': 'Clear Filters', 'fr': 'Effacer les Filtres'},
    'somethingWentWrong': {
      'en': 'Something went wrong',
      'fr': 'Quelque chose s\'est mal passé',
    },
    'unableToLoadTeamMembers': {
      'en':
          'Unable to load team members. Please check your connection and try again.',
      'fr':
          'Impossible de charger les membres de l\'équipe. Veuillez vérifier votre connexion et réessayer.',
    },
    'tryAgain': {'en': 'Try Again', 'fr': 'Réessayer'},
    'viewDashboard': {'en': 'View Dashboard', 'fr': 'Voir le Tableau de Bord'},
    'accessOverviewAndMetrics': {
      'en': 'Access overview and key metrics',
      'fr': 'Accéder à la vue d\'ensemble et aux métriques principales',
    },
    'analytics': {'en': 'Analytics', 'fr': 'Analyses'},
    'viewAnalytics': {'en': 'View Analytics', 'fr': 'Voir les Analyses'},
    'consultAnalyticalData': {
      'en': 'Consult analytical data and trends',
      'fr': 'Consulter les données analytiques et les tendances',
    },
    'viewReports': {'en': 'View Reports', 'fr': 'Voir les Rapports'},
    'accessPerformanceReports': {
      'en': 'Access performance reports and statistics',
      'fr': 'Accéder aux rapports de performance et statistiques',
    },
    'exportReports': {'en': 'Export Reports', 'fr': 'Exporter les Rapports'},
    'downloadAndExportReportData': {
      'en': 'Download detailed reports in various formats',
      'fr': 'Télécharger les rapports détaillés en différents formats',
    },
    'deleteReports': {'en': 'Delete Reports', 'fr': 'Supprimer les Rapports'},
    'deleteReportData': {
      'en': 'Delete report data',
      'fr': 'Supprimer les données de rapport',
    },
    'orders': {'en': 'Orders', 'fr': 'Commandes'},
    'orderStatistics': {
      'en': 'Order Statistics',
      'fr': 'Statistiques des Commandes',
    },
    'consultMetricsHistoryAnalytics': {
      'en': 'Consult metrics, history and sales analytics',
      'fr': 'Consulter les métriques, historique et analyses des ventes',
    },
    'addOrders': {'en': 'Add Orders', 'fr': 'Ajouter des Commandes'},
    'createNewOrdersRecordSales': {
      'en': 'Create new orders and record sales',
      'fr': 'Créer de nouvelles commandes et enregistrer des ventes',
    },
    'viewOrders': {'en': 'View Orders', 'fr': 'Voir les Commandes'},
    'cancelDeleteOrdersPermanently': {
      'en': 'Cancel and delete orders permanently',
      'fr': 'Annuler et supprimer définitivement des commandes',
    },
    'viewProducts': {'en': 'View Products', 'fr': 'Voir les Produits'},
    'consultInventoryPricesDetails': {
      'en': 'Consult inventory, prices and product details',
      'fr': 'Consulter l\'inventaire, prix et détails des produits',
    },
    'addProducts': {'en': 'Add Products', 'fr': 'Ajouter des Produits'},
    'createNewProductsWithPrices': {
      'en': 'Create new products with prices, descriptions and images',
      'fr': 'Créer de nouveaux produits avec prix, descriptions et images',
    },
    'editProducts': {'en': 'Edit Products', 'fr': 'Modifier les Produits'},
    'deleteProducts': {'en': 'Delete Products', 'fr': 'Supprimer les Produits'},
    'removeProductsPermanently': {
      'en': 'Remove products from catalog permanently',
      'fr': 'Retirer définitivement des produits du catalogue',
    },
    'viewSuppliers': {'en': 'View Suppliers', 'fr': 'Voir les Fournisseurs'},
    'consultSupplierListContactInfo': {
      'en': 'Consult supplier list and their contact information',
      'fr':
          'Consulter la liste des fournisseurs et leurs informations de contact',
    },
    'editSupplierInformation': {
      'en': 'Edit Supplier Information',
      'fr': 'Modifier les Informations des Fournisseurs',
    },
    'deleteSuppliers': {
      'en': 'Delete Suppliers',
      'fr': 'Supprimer les Fournisseurs',
    },
    'inviteNewMembers': {
      'en': 'Invite New Members',
      'fr': 'Inviter de nouveaux Membres',
    },
    'updateMembersPermissionsAndStatus': {
      'en': 'Update Members Permissions and Status',
      'fr': 'Modifier les Permissions et les Statuts des Membres',
    },
    'deleteMembers': {'en': 'Delete Members', 'fr': 'Supprimer les Membres'},
    'selected': {'en': 'selected', 'fr': 'selectionnée(s)'},
    'editOrderDetailsStatus': {
      'en': 'Edit details, status and information of existing orders',
      'fr':
          'Éditer les détails, statuts et informations des commandes existantes',
    },
    'editProductInformationPriceStock': {
      'en': 'Edit information, prices and stock of existing products',
      'fr': 'Éditer les informations, prix et stock des produits existants',
    },
    'unspecified': {'en': 'Unspecified', 'fr': 'Non défini'},
    'userInformation': {
      'en': 'User Information',
      'fr': 'Informations utilisateur',
    },
    'onboardingType': {'en': 'Onboarding Type', 'fr': "Type d'intégration"},
    'onboardingTypeDirect': {'en': 'Direct', 'fr': 'Direct'},
    'onboardingTypeInvite': {'en': 'Invite', 'fr': 'Invitation'},
    'onboardingTypeDirectDescription': {
      'en': 'Create user immediately with a temporary password.',
      'fr':
          "Créer l'utilisateur immédiatement avec un mot de passe temporaire.",
    },
    'onboardingTypeInviteDescription': {
      'en': 'Send an invitation email. User sets their own password.',
      'fr':
          "Envoyer un e-mail d'invitation. L'utilisateur choisit son mot de passe.",
    },
    'temporaryPassword': {
      'en': 'Temporary Password',
      'fr': 'Mot de passe temporaire',
    },
    'forcePasswordChangeOnFirstLogin': {
      'en': 'Force password change on first login',
      'fr': 'Forcer le changement de mot de passe à la première connexion',
    },
    'createUser': {'en': 'Create User', 'fr': 'Créer l\'utilisateur'},
    'userCreatedSuccessfully': {
      'en': 'User created successfully',
      'fr': 'Utilisateur créé avec succès',
    },
    'errorCreatingUser': {
      'en': 'Error creating user',
      'fr': "Erreur lors de la création de l'utilisateur",
    },
    'userAlreadyExists': {
      'en': 'A user with this email or username already exists.',
      'fr':
          "Un utilisateur avec cet email ou ce nom d'utilisateur existe déjà.",
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
    'reportAndAnalytics': {
      'en': 'Report & Analytics',
      'fr': 'Rapports & Analyses',
    },
    'reportAndAnalyticsDescription': {
      'en':
          'Analyze your business performance with comprehensive reports and insights.',
      'fr':
          'Analysez les performances de votre entreprise avec des rapports et des analyses approfondies.',
    },
    'salesAnalytics': {'en': 'Sales Analytics', 'fr': 'Analyse des ventes'},
    'inventoryReport': {
      'en': 'Inventory Report',
      'fr': 'Rapport d\'inventaire',
    },
    'productPerformance': {
      'en': 'Product Performance',
      'fr': 'Performance des produits',
    },
    'financialSummary': {
      'en': 'Financial Summary',
      'fr': 'Synthèse financière',
    },
    'netProfit': {'en': 'Net Profit', 'fr': 'Profit net'},
    'averageOrderValue': {
      'en': 'Average Order Value',
      'fr': 'Valeur moyenne de la commande',
    },
    'salesProfileTrend': {
      'en': 'Sales & Profit Trend',
      'fr': 'Tendance des ventes et des bénéfices',
    },
    'performanceOverview': {
      'en': 'Performance Overview',
      'fr': 'Aperçu des performances',
    },
    'salesByCategories': {
      'en': 'Sales by Categories',
      'fr': 'Ventes par Catégorie',
    },
    'revenueDistribution': {
      'en': 'Revenue Distribution',
      'fr': 'Répartition des revenus',
    },
    'topPerformingProducts': {
      'en': 'Top Performing Products',
      'fr': 'Produits les plus performants',
    },
    'byQuantitySold': {'en': 'By Quantity Sold', 'fr': 'Par Quantité Vendue'},
    'unitsSold': {'en': 'Units Sold', 'fr': 'Unité Vendues'},
    'profit': {'en': 'Profit', 'fr': 'Profit'},
    'totalItemsInStock': {
      'en': 'Total Items In Stock',
      'fr': 'Total des articles en stock',
    },
    'outOfStockItems': {
      'en': 'Out of Stock Items',
      'fr': 'Articles en rupture de stock',
    },
    'stockMovement': {'en': 'Stock Movement', 'fr': 'Mouvement d\'inventaire'},
    'stockInOutMovement': {
      'en': 'Stock In Out Movement',
      'fr': 'Mouvement d\'entrée et de sortie du stock',
    },
    'revenueAndExpenses': {
      'en': 'Revenue & Expenses',
      'fr': 'Revenus & Dépenses',
    },
    'expenses': {'en': 'Expenses', 'fr': 'Dépenses'},
    'revenue': {'en': 'Revenue', 'fr': 'Revenus'},
    'monthlyCashFlow': {
      'en': 'Monthly Cash Flow',
      'fr': 'Flux de trésorerie mensuelle',
    },
    'pdf': {'en': 'PDF', 'fr': 'PDF'},
    'excel': {'en': 'Excel', 'fr': 'Excel'},
    'csv': {'en': 'CSV', 'fr': 'CSV'},
    'transactions': {'en': 'Transactions', 'fr': 'Transactions'},
    'transactionsDescription': {
      'en':
          'Track all financial transactions and movements across your business.',
      'fr':
          'Suivez toutes les transactions financières et les mouvements dans votre entreprise.',
    },
    'addTransaction': {
      'en': 'Add Transaction',
      'fr': 'Ajouter une transaction',
    },
    'export': {'en': 'Export', 'fr': 'Exporter'},
    'totalRefunds': {'en': 'Total Refunds', 'fr': 'Total des remboursements'},
    'netRevenue': {'en': 'Net Revenue', 'fr': 'Revenu net'},
    'pendingTransactions': {
      'en': 'Pending Transactions',
      'fr': 'Transactions en attente',
    },
    'type': {'en': 'Type', 'fr': 'Type'},
    'searchForTransaction': {
      'en': 'Search by transaction id, order id ...',
      'fr': 'Rechercher par id de transaction, id de commande ...',
    },
    'transactionsHistory': {
      'en': 'Transactions History',
      'fr': 'Historique des transactions',
    },
    'transactionsHistoryDescription': {
      'en':
          'Track all financial transactions and movements across your business.',
      'fr':
          'Suivez toutes les transactions financières et les mouvements dans votre entreprise.',
    },
    'amount': {'en': 'Amount', 'fr': 'Montant'},
    'initiatedBy': {'en': 'Initiated By', 'fr': 'Initié par'},
    'order': {'en': 'Order', 'fr': 'Commande'},
    'units': {'en': 'Units', 'fr': 'Unités'},
    'codeBar': {'en': 'Code Bar', 'fr': 'Code Bar'},
    'salesReports': {'en': 'Sales Reports', 'fr': 'Rapports de ventes'},
    'noStoreSelected': {
      'en':
          'You haven\'t selected a store, please go to settings to select a store',
      'fr':
          'Vous n\'avez pas sélectionné de magasin, veuillez aller dans les paramètres pour en sélectionner un',
    },
    'noCategoriesYet': {
      'en': 'No categories yet',
      'fr': 'Aucune catégorie encore',
    },
    'categoryWillBeRemovedPermanently': {
      'en': 'This category will be removed from your team permanently.',
      'fr': 'Cette catégorie sera supprimée définitivement de votre équipe.',
    },
    'deleteCategory': {'en': 'Delete Category', 'fr': 'Supprimer la Catégorie'},
    'categoryNameTooShort': {
      'en': 'Category name is too short',
      'fr': 'Le nom de la catégorie est trop court',
    },
    'categoryManagement': {
      'en': 'Category Management',
      'fr': 'Gestion des Catégories',
    },
    'manageCategories': {
      'en': 'Manage your categories',
      'fr': 'Gérez vos catégories',
    },
    'editCategory': {'en': 'Edit Category', 'fr': 'Modifier la Catégorie'},
    'totalCategories': {'en': 'Total Categories', 'fr': 'Total Catégories'},
    'activeCategories': {'en': 'Active Categories', 'fr': 'Catégories Actives'},
    'inactiveCategories': {
      'en': 'Inactive Categories',
      'fr': 'Catégories Inactives',
    },
    'nameText': {'en': 'Name', 'fr': 'Nom'},
    'typeText': {'en': 'Type', 'fr': 'Type'},
    'addFirstCategory': {
      'en': 'Add your first category to get started',
      'fr': 'Ajoutez votre première catégorie pour commencer',
    },
    'deleteCategoryConfirm': {
      'en':
          'Are you sure you want to delete this category? This action cannot be undone.',
      'fr':
          'Êtes-vous sûr de vouloir supprimer cette catégorie ? Cette action ne peut pas être annulée.',
    },
    'categoryDeletedSuccessfully': {
      'en': 'Category deleted successfully',
      'fr': 'Catégorie supprimée avec succès',
    },
    'addNewCategory': {
      'en': 'Add New Category',
      'fr': 'Ajouter une Nouvelle Catégorie',
    },
    'enterDetailsNewCategory': {
      'en': 'Enter the details for the new category',
      'fr': 'Entrez les détails de la nouvelle catégorie',
    },
    'updateCategory': {
      'en': 'Update category information',
      'fr': 'Mettre à jour les informations de la catégorie',
    },
    'categoryNameEnglishVersion': {
      'en': 'Category Name (English version)',
      'fr': 'Nom de la Catégorie (version anglaise)',
    },
    'categoryNameFrenchVersion': {
      'en': 'Category Name (French version)',
      'fr': 'Nom de la Catégorie (version française)',
    },
    'categoryNameEnglishVersionRequired': {
      'en': 'Category name (English version) is required',
      'fr': 'Le nom de la catégorie (version anglaise) est requis',
    },
    'categoryNameFrenchVersionRequired': {
      'en': 'Category name (version anglaise) is required',
      'fr': 'Le nom de la catégorie (version française) est requis',
    },
    'categoryType': {'en': 'Category Type', 'fr': 'Type de Catégorie'},
    'selectType': {'en': 'Select Type', 'fr': 'Sélectionner le Type'},
    'allTypes': {'en': 'All Type', 'fr': 'Tous les Types'},
    'productType': {'en': 'Product', 'fr': 'Produit'},
    'categoryStatus': {'en': 'Category Status', 'fr': 'Statut de la Catégorie'},
    'selectStatus': {'en': 'Select Status', 'fr': 'Sélectionner le Statut'},
    'searchCategories': {
      'en': 'Search categories by name, type, or status...',
      'fr': 'Rechercher des catégories par nom, type ou statut...',
    },
    'filterByStatus': {'en': 'Filter by Status', 'fr': 'Filtrer par Statut'},
    'filterByType': {'en': 'Filter by Type', 'fr': 'Filtrer par Type'},
    'categoryAddedSuccessfully': {
      'en': 'Category added successfully',
      'fr': 'Catégorie ajoutée avec succès',
    },
    'categoryUpdatedSuccessfully': {
      'en': 'Category updated successfully',
      'fr': 'Catégorie mise à jour avec succès',
    },
    'failedToSaveCategory': {
      'en': 'Failed to save category',
      'fr': 'Échec de la sauvegarde de la catégorie',
    },
    'failedToDeleteCategory': {
      'en': 'Failed to delete category',
      'fr': 'Échec de la suppression de la catégorie',
    },
    'fifo': {'en': 'FIFO', 'fr': 'FIFO'},
    'average': {'en': 'Average', 'fr': 'Moyenne'},
    'costingMethod': {'en': 'Costing Method', 'fr': 'Méthode de comptage'},
    'costingMethodDescription': {
      'en': 'FIFO (First In First Out) would be used if nothing is selected',
      'fr':
          'FIFO (Premier Entré Premier Sorti) serait utilisé si rien n\'est sélectionné',
    },
    'costingMethodDoc': {
      'en': '''Consider the following example to know how it impacts your stock:
              | Date | Transaction | Qty | Unit Cost | | 1-4-2020 | Purchase | 10 | 100 | | 6-4-2020 | Purchase | 20 | 120 | | 10-4-2020 | Sale | 15 | ? |
              Calculating Valuation Rate at the time of sale:
              As per FIFO:
              Since this is FIFO, we will consume quantities from the earliest transactions, therefore, to make a sale of 15 qty, we will take 10 qty from the first transaction and 5 qty from the second one.
              (10 * 100) + (5 * 120) = 1600, which leaves us 15 qty in stock at cost of 120 amounting to 1800.
              As per Moving Average:
              In the Moving Average method, the value of an item is recalculated every time when an item is acquired. This is done by adding the cost of the newly acquired items to the existing inventory’s value and then dividing it by the total quantity available.
              ((10 * 100) + (20 * 120)) / 30 = 113.33
              To make a sale of 15 qty, we will directly multiply it by the average value we received just now.
              15 * 113.33 = 1700, which leaves us 15 qty in stock amounting to 1700.
              If you check, even though the quantity is same the stock value is different but both amounts to a total of 3400 only.''',
      'fr':
          '''Considérez l'exemple suivant pour comprendre son impact sur votre stock :
            | Date | Transaction | Quantité | Coût unitaire | | 1-4-2020 | Achat | 10 | 100 | | 6-4-2020 | Achat | 20 | 120 | | 10-4-2020 | Vente | 15 | ? |
            Calcul du taux d'évaluation au moment de la vente :
            Selon la méthode FIFO :
            Comme il s'agit de la méthode FIFO, nous allons consommer les quantités des transactions les plus anciennes. Par conséquent, pour effectuer une vente de 15 quantités, nous allons prendre 10 quantités de la première transaction et 5 quantités de la deuxième.
            (10 * 100) + (5 * 120) = 1600, ce qui nous laisse 15 unités en stock au coût de 120, soit un total de 1800.
            Selon la méthode de la moyenne mobile :
            Dans la méthode de la moyenne mobile, la valeur d'un article est recalculée à chaque fois qu'un article est acquis. Pour ce faire, on ajoute le coût des articles nouvellement acquis à la valeur du stock existant, puis on divise le tout par la quantité totale disponible.
            ((10 * 100) + (20 * 120)) / 30 = 113,33
            Pour réaliser une vente de 15 unités, nous la multiplierons directement par la valeur moyenne que nous venons d'obtenir.
            15 * 113,33 = 1 700, ce qui nous laisse 15 unités en stock pour un montant total de 1 700.
            Si vous vérifiez, même si la quantité est la même, la valeur du stock est différente, mais les deux montent à un total de 3 400 seulement.''',
    },
    'productDescription': {
      'en': 'Product Description',
      'fr': 'Description du produit',
    },
    'enterProductDescription': {
      'en': 'Enter product description',
      'fr': 'Entrez la description du produit',
    },
    'optional': {'en': 'Optional', 'fr': 'Optionnel'},
    'restock': {'en': 'Restock', 'fr': 'Reapprovisionnement'},
    'selectProduct': {'en': 'Select product', 'fr': 'Sélectionner un produit'},
    'salePrice': {'en': 'Sale Price', 'fr': 'Prix de vente'},
    'unitCost': {'en': 'Unit Cost', 'fr': 'Coût unitaire'},
    'failedToCreateStockInbound': {
      'en': 'Failed to create stock inbound',
      'fr': 'Échec de la création du stock',
    },
    'stockInboundSavedSuccessfully': {
      'en': 'Stock inbound saved successfully',
      'fr': 'Stock d\'approvisionnement enregistré avec succès',
    },
    'restockProductDescription': {
      'en': 'Ensure to have a valid product before restocking',
      'fr': 'Assurez-vous d\'avoir un produit valide avant de reapprovisionner',
    },
    'adjustmentStock': {'en': 'Adjustment Stock', 'fr': 'Ajustement de stock'},
    'adjustmentAmount': {
      'en': 'Adjustment Amount',
      'fr': 'Montant d\'ajustement',
    },
    'isCustomerReturn': {'en': 'Customer Return', 'fr': 'Retour client'},
    'reason': {'en': 'Reason', 'fr': 'Motif'},
    'adjustmentAmountDescription': {
      'en': 'The adjustment amount (positive or negative)',
      'fr': 'Le montant d\'ajustement (positif ou négatif)',
    },
    'autoCreateRefund': {
      'en': 'Auto Create Refund',
      'fr': 'Créer automatiquement un remboursement',
    },
    'quantityMustBePositiveWhenCustomerReturn': {
      'en': 'Quantity must be positive when customer return',
      'fr': 'La quantité doit être positive lors d\'un retour client',
    },
    'weCannotAdjustTheStockToANegativeValue': {
      'en':
          'The difference between the initial quantity and the new quantity must be greater than 0.',
      'fr':
          'La différence entre la quantité initiale et la nouvelle quantité doit être supérieure à 0.',
    },
    'stockAdjustedSuccessfully': {
      'en': 'Stock adjusted successfully',
      'fr': 'Stock ajusté avec succès',
    },
    'invoiceCreatedSuccessfully': {
      'en': 'Invoice created successfully',
      'fr': 'Facture créée avec succès',
    },
    'adjustStock': {'en': 'Adjust Stock', 'fr': 'Ajuster le stock'},
    'productNotFound': {'en': 'Product not found', 'fr': 'Produit non trouvé'},
    'totalGlobalProducts': {
      'en': 'Total Global Products',
      'fr': 'Total Produits Généraux',
    },
    'activeGlobalProducts': {
      'en': 'Active Global Products',
      'fr': 'Produits Généraux Actifs',
    },
    'inactiveGlobalProducts': {
      'en': 'Inactive Global Products',
      'fr': 'Produits Généraux Inactifs',
    },
    'globalProductsManagement': {
      'en': 'Global Products Management',
      'fr': 'Gestion des Produits Généraux',
    },
    'manageGlobalProducts': {
      'en': 'Manage your global products and their information',
      'fr': 'Gérez vos produits généraux et leurs informations',
    },
    'searchProducts': {
      'en': 'Search products by name, categories, or status...',
      'fr': 'Rechercher des produits par nom, catégories ou statut...',
    },
    'noProductsMatchFilters': {
      'en': 'No products match your filters',
      'fr': 'Aucun produit ne correspond à vos filtres',
    },
    'noProductsYet': {'en': 'No products yet', 'fr': 'Aucun produit encore'},
    'addFirstProduct': {
      'en': 'Add your first product',
      'fr': 'Ajoutez votre premier produit',
    },
    'productWillBeRemovedPermanently': {
      'en': 'This product will be removed from your stock permanently.',
      'fr': 'Ce produit sera supprimée définitivement de votre stock.',
    },
    'productAddedSuccessfully': {
      'en': 'Product added successfully',
      'fr': 'Produit ajoutée avec succès',
    },
    'productUpdatedSuccessfully': {
      'en': 'Product updated successfully',
      'fr': 'Produit mise à jour avec succès',
    },
    'failedToSaveProduct': {
      'en': 'Failed to save product',
      'fr': 'Échec de la sauvegarde du produit',
    },
    'addNewProduct': {
      'en': 'Add New Product',
      'fr': 'Ajouter un Nouveau Produit',
    },
    'enterDetailsNewProduct': {
      'en': 'Enter the details for the new product',
      'fr': 'Entrez les détails du nouveau produit',
    },
    'updateProduct': {
      'en': 'Update product information',
      'fr': 'Mettre à jour les informations du produit',
    },
    'productNameEnglishVersion': {
      'en': 'Product Name (English version)',
      'fr': 'Nom du Produit (version anglaise)',
    },
    'productNameFrenchVersion': {
      'en': 'Product Name (French version)',
      'fr': 'Nom du Produit (version française)',
    },
    'productNameEnglishVersionRequired': {
      'en': 'Product name (English version) is required',
      'fr': 'Le nom du produit (version anglaise) est requis',
    },
    'productNameFrenchVersionRequired': {
      'en': 'Product name (version anglaise) is required',
      'fr': 'Le nom du produit (version française) est requis',
    },
    'productDescriptionEnglishVersion': {
      'en': 'Product Description (English version)',
      'fr': 'Description du Produit (version anglaise)',
    },
    'productDescriptionFrenchVersion': {
      'en': 'Product Description (French version)',
      'fr': 'Description du Produit (version française)',
    },
    'productDescriptionEnglishVersionRequired': {
      'en': 'Product description (English version) is required',
      'fr': 'La description du produit (version anglaise) est requise',
    },
    'productDescriptionFrenchVersionRequired': {
      'en': 'Product description (version anglaise) is required',
      'fr': 'La description du produit (version française) est requise',
    },
    'productNameTooShort': {
      'en': 'Product name is too short',
      'fr': 'Le nom du produit est trop court',
    },
    'productDescriptionTooShort': {
      'en': 'Product description is too short',
      'fr': 'La description du produit est trop courte',
    },
    'globalProducts': {'en': 'Global Products', 'fr': 'Produits globaux'},
    'searchSuppliers': {
      'en': 'Search suppliers by name...',
      'fr': 'Rechercher des fournisseurs par nom...',
    },
    'noSuppliersMatchFilters': {
      'en': 'No suppliers match your filters',
      'fr': 'Aucun fournisseur ne correspond à vos filtres',
    },
    'invoices': {'en': 'Invoices', 'fr': 'Factures'},
    'viewInvoices': {'en': 'View Invoices', 'fr': 'Voir les Factures'},
    'createInvoices': {'en': 'Create Invoices', 'fr': 'Créer des Factures'},
    'viewTransactions': {
      'en': 'View Transactions',
      'fr': 'Voir les Transactions',
    },
    'createTransactions': {
      'en': 'Create Transactions',
      'fr': 'Créer des Transactions',
    },
    'editTransactions': {
      'en': 'Edit Transactions',
      'fr': 'Modifier des Transactions',
    },
    'storePostalCode': {
      'en': 'Store Postal Code',
      'fr': 'Code Postal du magasin',
    },
    'salesOrders': {'en': 'Sales Orders', 'fr': 'Commandes de vente'},
    'cashReceipts': {'en': 'Cash Receipts', 'fr': 'Reçus de caisse'},
    'pos': {'en': 'Point of Sale', 'fr': 'Point de vente'},
    'invoicesManagement': {
      'en': 'Invoices Management',
      'fr': 'Gestion des factures',
    },
    'invoicesManagementDescription': {
      'en': 'Manage your invoices, vouchers and purchases.',
      'fr': 'Gestion des factures et  bon de commande.',
    },
    'invoicesHistory': {
      'en': 'Invoices History',
      'fr': 'Historique des factures',
    },
    'cash': {'en': 'Cash', 'fr': 'Espèces'},
    'card': {'en': 'Card', 'fr': 'Carte'},
    'orangeMoney': {'en': 'Orange Money', 'fr': 'Orange Money'},
    'mtnMoMo': {'en': 'MTN Mobile Money', 'fr': 'MTN Mobile Money'},
    'creditCard': {'en': 'Credit Card', 'fr': 'Carte de crédit'},
    'balanceDue': {'en': 'Balance Due', 'fr': 'Solde dû'},
    'newPayment': {'en': 'New Payment', 'fr': 'Nouveau paiement'},
    'createPayment': {'en': 'Create Payment', 'fr': 'Créer le paiement'},
    'payments': {'en': 'Payments', 'fr': 'Paiements'},
    'amountExceedsBalanceDue': {
      'en': 'Amount exceeds balance due',
      'fr': 'Le montant dépasse le solde dû',
    },
    'paymentMade': {'en': 'Payment Made', 'fr': 'Paiement effectué'},
    'mtnMoney': {'en': 'MTN Money', 'fr': 'MTN Money'},
    'voucher': {'en': 'Voucher', 'fr': 'Bon de commande'},
    'mobile': {'en': 'Mobile', 'fr': 'Mobile'},
    'unknown': {'en': 'Unknown', 'fr': 'Inconnu'},
    'paid': {'en': 'Paid', 'fr': 'Payé'},
    'pendingRefund': {
      'en': 'Pending Refund',
      'fr': 'En attente de remboursement',
    },
    'refunded': {'en': 'Refunded', 'fr': 'Remboursé'},
    'id': {'en': 'ID', 'fr': 'ID'},
    'paymentMethod': {'en': 'Payment Method', 'fr': 'Méthode de paiement'},
    'issued': {'en': 'Issued', 'fr': 'Émis'},
    'redeemed': {'en': 'Redeemed', 'fr': 'Remboursé'},
    'vouchersHistory': {
      'en': 'Vouchers History',
      'fr': 'Historique des bons de commande',
    },
    'invoice': {'en': 'Invoice', 'fr': 'Facture'},
    'expiryDate': {'en': 'Expiry Date', 'fr': 'Date d\'expiration'},
    'redeemedAt': {'en': 'Redeemed At', 'fr': 'Remboursé le'},
    'redeemedBy': {'en': 'Redeemed By', 'fr': 'Remboursé par'},
    'addInvoice': {'en': 'Add Invoice', 'fr': 'Ajouter une facture'},
    'thankYouForYourOrder': {
      'en': 'Thank you for your order',
      'fr': 'Merci pour votre commande',
    },
    'restToPaid': {'en': 'Rest To Paid', 'fr': 'Reste à payer'},
    'stopThePresentInvoiceAtTheSumOf': {
      'en': 'Stop the present invoice at the sum of',
      'fr': 'Arrêtez la facture actuelle à la somme de',
    },
    'designation': {'en': 'Designation', 'fr': 'Désignation'},
    'qte': {'en': 'Qty', 'fr': 'Qte'},
    'prixUnit': {'en': 'U.P.', 'fr': 'P.U.'},
    'discount': {'en': 'Discount', 'fr': 'Remise'},
    'bySabitou': {'en': 'By Sabitou', 'fr': 'Par Sabitou'},
    'contacts': {'en': 'Contacts', 'fr': 'Contacts'},
    'taxPayerNumber': {'en': 'Tax Payer Number', 'fr': 'Numéro de TVA'},
    'nui': {'en': 'NUI', 'fr': 'NUI'},
    'tax': {'en': 'Tax', 'fr': 'Taxe'},
    'balance': {'en': 'Change', 'fr': 'Reste'},
    'changeGiven': {'en': 'Rendering', 'fr': 'Rendu'},
    'amountReceived': {'en': 'Amount received', 'fr': 'Montant reçu'},
    'totalVat': {'en': 'Total VAT', 'fr': 'Total TVA'},
    'subtotal': {'en': 'Subtotal', 'fr': 'Sous-total'},
    'selectOnOrMorePrinter': {
      'en': 'Select one or more printer',
      'fr': 'Sélectionner un ou plusieurs imprimantes',
    },
    'printerNotConnected': {
      'en': '@printer is no longer connected. Please reconnect and try again',
      'fr': '@printer n\'est plus connecté. Veuillez reconnecter et reessayer',
    },
    'noDeviceSelected': {
      'en': 'No device selected',
      'fr': 'Aucun appareil selectionne',
    },
    'theDevice': {'en': 'The Device', 'fr': 'L\'appareil'},
    'preview': {'en': 'Preview', 'fr': 'Aperçu'},
    'printerConfigurationError': {
      'en':
          'Printer configuration error. Please try again and check the bluetooth connection.',
      'fr':
          'Erreur de configuration de l\'imprimante. Veuillez reessayer et vérifier la connexion bluetooth.',
    },
    'addProductToCart': {
      'en': 'Add the product to cart',
      'fr': 'Ajouter les produit au panier',
    },
    'processPayment': {'en': 'Process Payment', 'fr': 'Traiter le paiement'},
    'invalidPaymentAmount': {
      'en': 'Invalid payment amount',
      'fr': 'Montant de paiement invalide',
    },
    'paymentAmountExceedsRemaining': {
      'en': 'Payment amount exceeds remaining',
      'fr': 'Le montant du paiement excède le reste',
    },
    'totalPaid': {'en': 'Total paid', 'fr': 'Total payé'},
    'remaining': {'en': 'Remaining', 'fr': 'Restant'},
    'amountToBePaidBack': {
      'en': 'Amount to be paid back',
      'fr': 'Montant à rendre',
    },
    'insufficientCashInRegister': {
      'en': 'Insufficient cash in register',
      'fr': 'Argent insuffisant en caisse',
    },
    'paymentMethods': {'en': 'Payment methods', 'fr': 'Méthodes de paiement'},
    'validedThePayment': {
      'en': 'Valided the payment',
      'fr': 'Valide le paiement',
    },
    'selectPaymentMethod': {
      'en': 'Select payment method',
      'fr': 'Sélectionner une methode de paiement',
    },
    'amountExceedsRemaining': {
      'en': 'Amount exceeds remaining',
      'fr': 'Le montant du paiement excède le reste',
    },
    'completePayment': {'en': 'Complete Payment', 'fr': 'Terminer le paiement'},
    'voucherId': {'en': 'Voucher ID', 'fr': 'ID du bon de commande'},
    'referenceId': {'en': 'Reference ID', 'fr': 'ID de référence'},
    'invalidOrExpiredVoucher': {
      'en': 'Invalid or expired voucher',
      'fr': 'Bon invalide ou expiré',
    },
    'invalidAmount': {'en': 'Invalid amount', 'fr': 'Montant invalide'},
    'willGive': {'en': 'Will give', 'fr': 'Rendre'},
    'stillOwe': {'en': 'Still owe', 'fr': 'Encore dette'},
    'statusWillBePendingRefund': {
      'en': 'Status will be pending refund',
      'fr': 'Le statut sera en attente de remboursement',
    },
    'viewThePaymentSelected': {
      'en': 'View payment selected',
      'fr': 'Voir les paiements choisis',
    },
    'selectedPayments': {
      'en': 'Selected payment(s)',
      'fr': 'Paiement(s) sélectionné(s)',
    },
    'areYouAbleToGiveChange': {
      'en': 'Are you able to give change ?',
      'fr': 'Etes-vous en mesure de rendre la monaie ?',
    },
    'mobileMoney': {'en': 'Mobile Money', 'fr': 'Mobile Money'},
    'storeCredit': {'en': 'Store Credit', 'fr': 'Store Credit'},
    'draft': {'en': 'Draft', 'fr': 'Brouillon'},
    'unpaid': {'en': 'Unpaid', 'fr': 'Non payé'},
    'partiallyPaid': {'en': 'Partially Paid', 'fr': 'Partiellement payé'},
    'overdue': {'en': 'Overdue', 'fr': 'En retard'},
    'credited': {'en': 'Credited', 'fr': 'Remboursé'},
    'partiallyUsed': {'en': 'Partially Used', 'fr': 'Partiellement utilisé'},
    'fullyUsed': {'en': 'Fully Used', 'fr': 'Complettement utilisé'},
    'scanOrSearchForProducts': {
      'en': 'Scan or search for products',
      'fr': 'Scanner ou rechercher des produits',
    },
    'applyVoucher': {'en': 'Apply Voucher', 'fr': 'Appliquer un bon'},
    'enterVoucherCode': {
      'en': 'Enter voucher code (e.g., BON-2025-001)',
      'fr': 'Entrez le code du bon de commande (e.g., BON-2025-001)',
    },
    'validate': {'en': 'Validate', 'fr': 'Valider'},
    'validVoucher': {'en': 'Valid Voucher', 'fr': 'Bon valide'},
    'code': {'en': 'Code', 'fr': 'Code'},
    'available': {'en': 'Available', 'fr': 'Disponible'},
    'usableAmount': {'en': 'Usable Amount', 'fr': 'Montant utilisable'},
    'clear': {'en': 'Clear', 'fr': 'Effacer'},
    'invalidOrExpiredVoucherCode': {
      'en': 'Invalid or expired voucher code',
      'fr': 'Bon invalide ou expiré',
    },
    'failedToValidateVoucher': {
      'en': 'Failed to validate voucher',
      'fr': 'Erreur de validation du bon',
    },
    'voucherCode': {'en': 'Voucher Code', 'fr': 'Code du bon'},
    'storeNotConfigured': {
      'en': 'Store not configured. Please contact the administrator.',
      'fr': 'Magasin non configuré. Veuillez contacter l\'administrateur.',
    },
    'failedToCreateCashReceipt': {
      'en': 'Failed to create cash receipt',
      'fr': 'Erreur lors de la création du reçu de caisse',
    },
    'saleCompletedSuccessfully': {
      'en': 'Sale completed successfully',
      'fr': 'Vente terminée avec succès',
    },
    'insufficientStockFor': {
      'en': 'Insufficient stock for @product',
      'fr': 'Stock insuffisant pour @product',
    },
    'requested': {'en': 'Requested', 'fr': 'Demandé'},
    'inventoryCheckFailed': {
      'en': 'Inventory check failed for @product',
      'fr': 'Erreur de vérification du stock pour @product',
    },
    'inventoryAvailable': {
      'en': 'Inventory available',
      'fr': 'Stock disponible',
    },
    'validCart': {'en': 'Valid Cart', 'fr': 'Panier valide'},
    'productNotIdentifiedInCart': {
      'en': 'Product not identified in cart',
      'fr': 'Produit non identifié dans le panier',
    },
    'invalidQuantityForProduct': {
      'en': 'Invalid quantity for product @product',
      'fr': 'Quantité invalide pour le produit @product',
    },
    'invalidPriceForProduct': {
      'en': 'Invalid price for product @product',
      'fr': 'Prix invalide pour le produit @product',
    },
    'failedToCompleteSale': {
      'en': 'Failed to complete sale',
      'fr': 'Erreur lors de la vente',
    },
    'failedToCreateSaleWithVoucher': {
      'en': 'Failed to create sale with voucher',
      'fr': 'Erreur lors de la création de la vente avec le bon',
    },
    'enterReference': {
      'en': 'Enter the reference',
      'fr': 'Entrez la référence',
    },
    'insufficientVoucherAmount': {
      'en': 'Insufficient voucher amount. Max to use: @remainingAmount',
      'fr': 'Montant du bon insuffisant. Max à utiliser: @remainingAmount',
    },
    'leaveEmptyIfYouDontWantToGiveChange': {
      'en': 'Leave empty if you don\'t want to give change',
      'fr': 'Laissez vide si vous ne voulez pas rendre la monnaie',
    },
    'amountChangeGiven': {'en': 'Change given', 'fr': 'Monnaie rendue'},
    'changeGivenMustBeLessThan': {
      'en': 'Change given must be less or equal to',
      'fr': 'La monnaie rendue doit être inférieure ou égale à',
    },
    'received': {'en': 'Received', 'fr': 'Reçue'},
    'given': {'en': 'Given', 'fr': 'Rendue'},
    'purchases': {'en': 'Purchases', 'fr': 'Achats'},
    'purchaseReceives': {
      'en': 'Purchase Receives',
      'fr': 'Réceptions d\'achats',
    },
    'billDetail': {'en': 'Bill Detail', 'fr': 'Détail de la facture'},
    'createBill': {'en': 'Create Bill', 'fr': 'Créer une facture'},
    'dueDateLabel': {'en': 'Due Date', 'fr': 'Date d\'échéance'},
    'billStatusOpen': {'en': 'Open', 'fr': 'Ouverte'},
    'billStatusPaid': {'en': 'Paid', 'fr': 'Payée'},
    'billStatusOverdue': {'en': 'Overdue', 'fr': 'En retard'},
    'noBillsFound': {'en': 'No bills found', 'fr': 'Aucune facture trouvée'},
    'noReceivingNotesFound': {
      'en': 'No receiving notes found',
      'fr': 'Aucune note de réception trouvée',
    },
    'convertToBill': {'en': 'Convert to Bill', 'fr': 'Convertir en facture'},
    'receivingNoteDetail': {
      'en': 'Receiving Note Detail',
      'fr': 'Détail de la note de réception',
    },
    'expirationType': {'en': 'Expiration Type', 'fr': 'Type d\'expiration'},
    'selectExpirationType': {
      'en': 'Select expiration type',
      'fr': 'Sélectionner un type d\'expiration',
    },
    'productsList': {'en': 'Products List', 'fr': 'Liste des produits'},
    'sku': {'en': 'SKU', 'fr': 'SKU'},
    'productsListManagement': {
      'en': 'Products List Management',
      'fr': 'Gestion des produits',
    },
    'expectedDeliveryDate': {
      'en': 'Expected Delivery Date',
      'fr': 'Date de livraison prévue',
    },
    'invalidDate': {'en': 'Invalid Date', 'fr': 'Date invalide'},
    'noProductsAddedYet': {
      'en': 'No products added yet',
      'fr': 'Aucun produit ajouté',
    },
    'clickAddProduct': {
      'en': 'Click "Add Product" to start adding products',
      'fr':
          'Cliquez sur "Ajouter un produit" pour commencer à ajouter des produits',
    },
    'addSpecialInstructionsOrNotes': {
      'en': 'Add special instructions or notes...',
      'fr': 'Ajoutez des instructions ou des notes...',
    },
    'totalAmount': {'en': 'Total Amount', 'fr': 'Montant total'},
    'pleaseAddAtLeastOneItem': {
      'en': 'Please add at least one item',
      'fr': 'Veuillez ajouter au moins un produit',
    },
    'pleaseSelectAProductForItem': {
      'en': 'Please select a product for item @item',
      'fr': 'Veuillez sélectionner un produit pour l\'article @item',
    },
    'quantityMustBeGreaterThanZeroForItem': {
      'en': 'Quantity must be greater than 0 for product @item',
      'fr': 'La quantité doit être supérieure à 0 pour le produit @item',
    },
    'amountMustBeGreaterThanZeroForItem': {
      'en': 'Amount must be greater than 0 for product @item',
      'fr': 'Le montant doit être supérieure à 0 pour le produit @item',
    },
    'purchaseOrderCreatedSuccessfully': {
      'en': 'Purchase order created successfully',
      'fr': 'Commande fournisseur créée avec succès',
    },
    'failedToCreatePurchaseOrder': {
      'en': 'Failed to create purchase order, please try again',
      'fr':
          'Erreur lors de la création de la commande fournisseur, veuillez reessayer',
    },
    'purchaseOrdersDescription': {
      'en': 'Manage your purchase orders from suppliers',
      'fr': 'Gestion des commandes fournisseur',
    },
    'purchaseOrdersNotFound': {
      'en': 'No purchase orders found',
      'fr': 'Aucune commande fournisseur trouvée',
    },
    'cancelPurchaseOrder': {
      'en': 'Cancel Purchase Order',
      'fr': 'Annuler la commande fournisseur',
    },
    'cancelOrderConfirmation': {
      'en': 'Are you sure you want to cancel "@order"?',
      'fr': 'Voulez-vous vraiment annuler "@order"?',
    },
    'reasonForCancellation': {
      'en': 'Reason for cancellation',
      'fr': 'Motif de l\'annulation',
    },
    'noKeepOrder': {'en': 'No, Keep Order', 'fr': 'Non, garder la commande'},
    'yesCancelOrder': {
      'en': 'Yes, Cancel Order',
      'fr': 'Oui, annuler la commande',
    },
    'partial': {'en': 'Partial', 'fr': 'Partiel'},
    'receivePurchaseOrder': {
      'en': 'Receive Purchase Order',
      'fr': 'Recevoir la commande',
    },
    'purchaseOrderCancelledSuccessfully': {
      'en': 'Purchase order cancelled successfully',
      'fr': 'Commande fournisseur annulée avec succès',
    },
    'failedToCancelPurchaseOrder': {
      'en': 'Failed to cancel purchase order, please try again',
      'fr':
          'Erreur lors de l\'annulation de la commande fournisseur, veuillez reessayer',
    },
    'createReceiveNote': {
      'en': 'Create Receive Note',
      'fr': 'Créer une note de réception',
    },
    'createAt': {'en': 'Created At', 'fr': 'Créé le'},
    'receiveDate': {'en': 'Receive Date', 'fr': 'Date de réception'},

    'createReceivingNote': {
      'en': 'Create Receiving Note',
      'fr': 'Créer une note de réception',
    },
    'addNotesAboutTheDeliveryConditionDamagesEtc': {
      'en': 'Add notes about the delivery condition, damages etc...',
      'fr':
          'Ajoutez des notes sur la condition de livraison, les dommages etc...',
    },
    'rejectedQuantity': {'en': 'Rejected Quantity', 'fr': 'Quantité rejetée'},
    'receivedQuantity': {'en': 'Received Quantity', 'fr': 'Quantité reçue'},
    'purchasePrice': {'en': 'Purchase Price', 'fr': 'Prix dachat'},
    'expectedQuantity': {'en': 'Expected Quantity', 'fr': 'Quantité attendue'},
    'batch': {'en': 'Batch', 'fr': 'Lot'},
    'pleaseSelectAPurchaseOrder': {
      'en': 'Please select a purchase order',
      'fr': 'Veuillez sélectionner une commande fournisseur',
    },
    'expectedQuantityMustBeGreaterThanZeroForItem': {
      'en': 'Expected quantity must be greater than 0 for item @item',
      'fr':
          'La quantité attendue doit être supérieure à 0 pour le produit @item',
    },
    'receivedQuantityCannotBeNegativeForItem': {
      'en': 'Received quantity cannot be negative for item @item',
      'fr': 'La quantité reçue ne peut pas être negative pour le produit @item',
    },
    'purchasePriceMustBeGreaterThanZeroForItem': {
      'en': 'Purchase price must be greater than 0 for item @item',
      'fr': 'Le prix dachat doit être supérieure à 0 pour le produit @item',
    },
    'receivingNoteCreatedSuccessfully': {
      'en': 'Receiving note created successfully',
      'fr': 'Note de réception créée avec succès',
    },
    'failedToCreateReceivingNote': {
      'en': 'Failed to create receiving note, please try again',
      'fr':
          'Erreur lors de la création de la note de réception, veuillez reessayer',
    },
    'createOrder': {'en': 'Create Order', 'fr': 'Créer une commande'},
    'unitPurchasePrice': {
      'en': 'Unit purchase price',
      'fr': 'Prix unitaire dachat',
    },
    'noCashReceiptsFound': {
      'en': 'No cash receipts found',
      'fr': 'Aucune réception trouvée',
    },
    'cashReceiptsWillAppearHereOnceTheyAreCreated': {
      'en': 'Cash receipts will appear here once they are created',
      'fr': 'Les réceptions apparaîtront ici une fois qu\'elles seront créées',
    },
    'refresh': {'en': 'Refresh', 'fr': 'Actualiser'},
    'errorLoadingCashReceipts': {
      'en': 'Error loading cash receipts',
      'fr': 'Erreur lors du chargement des réceptions',
    },
    'retry': {'en': 'Retry', 'fr': 'Reessayer'},
    'audits': {'en': 'Audits', 'fr': 'Audits'},
    'noTransactionsFound': {
      'en': 'No transactions found',
      'fr': 'Aucune transaction trouvée',
    },
    'viewAndManageInventoryAndVoucherTransactions': {
      'en': 'View and manage inventory and voucher transactions',
      'fr': 'Voir et gérer les transactions d\'inventaire et de vouchers',
    },
    'searchTransactions': {
      'en': 'Search transactions...',
      'fr': 'Rechercher des transactions...',
    },
    'today': {'en': 'Today', 'fr': 'Aujourd\'hui'},
    'thisWeek': {'en': 'This Week', 'fr': 'Cette semaine'},
    'thisMonth': {'en': 'This Month', 'fr': 'Ce mois'},
    'inventoryOnly': {'en': 'Inventory Only', 'fr': 'Inventaire seulement'},
    'vouchersOnly': {'en': 'Vouchers Only', 'fr': 'Vouchers seulement'},
    'vouchers': {'en': 'Vouchers', 'fr': 'Vouchers'},
    'noInventoryTransactionsFound': {
      'en': 'No inventory transactions found',
      'fr': 'Aucune transaction d\'inventaire trouvée',
    },
    'noVoucherTransactionsFound': {
      'en': 'No voucher transactions found',
      'fr': 'Aucune transaction de voucher trouvée',
    },
    'noTransactionsMatchFilters': {
      'en': 'No transactions match your current filters.',
      'fr': 'Aucune transaction ne correspond à vos filtres actuels.',
    },
    'transactionId': {'en': 'Transaction ID', 'fr': 'ID de transaction'},
    'refId': {'en': 'Document ID', 'fr': 'ID du document'},
    'productId': {'en': 'Product ID', 'fr': 'ID du produit'},
    'batchId': {'en': 'Batch ID', 'fr': 'ID du lot'},
    'usedBy': {'en': 'Used By', 'fr': 'Utilisé par'},
    'exportInitiated': {'en': 'Export initiated', 'fr': 'Exportation initiée'},
    'exportFailed': {'en': 'Export failed', 'fr': 'Échec de l\'exportation'},
    'transactionTapped': {
      'en': 'Transaction tapped',
      'fr': 'Transaction sélectionnée',
    },
    'searchCashReceipts': {
      'en': 'Search cash receipts...',
      'fr': 'Rechercher des cash receipts...',
    },
    'filter': {'en': 'Filter', 'fr': 'Filtrer'},
    'welcomeScreenThirdMessage': {
      'en':
          'Manage your inventory, sales, purchases, and cash receipts all in one place.',
      'fr':
          'Gérez votre inventaire, vos ventes, vos achats et vos reçus de caisse en un seul endroit.',
    },
    'welcomeScreenSecondMessage': {
      'en':
          'Track your stock levels, sales, and purchases with ease using Sabitou.',
      'fr':
          'Suivez facilement vos niveaux de stock, vos ventes et vos achats avec Sabitou.',
    },
    'welcomeScreenFirstMessage': {
      'en':
          'Welcome to Sabitou, your all-in-one inventory and sales management solution.',
      'fr':
          'Bienvenue chez Sabitou, votre solution tout-en-un de gestion des stocks et des ventes.',
    },
    'new': {'en': 'New', 'fr': 'Nouvelle'},
    'noPrinterConnected': {
      'en': 'No printer connect.',
      'fr': 'Aucune imprimante connecte.',
    },
    'initialStock': {'en': 'Initial Stock', 'fr': 'Stock initial'},
    'openingStock': {'en': 'Opening Stock', 'fr': 'Stock d\'ouverture'},
    'openingStockPerUnit': {
      'en': 'Opening Stock Per Unit',
      'fr': 'Stock d\'ouverture par unité',
    },
    'defaultPurchasePrice': {
      'en': 'Default Purchase Price',
      'fr': 'Prix d\'achat par défaut',
    },
    'reorderPoint': {'en': 'Reorder Point', 'fr': 'Point de commande'},
    'adjustInventory': {
      'en': 'Adjust Inventory',
      'fr': 'Ajuster l\'inventaire',
    },
    'currentStock': {
      'en': 'Current Stock: @quantity',
      'fr': 'Stock actuel : @quantity',
    },
    'inventoryAdjustedSuccessfully': {
      'en': 'Inventory adjusted successfully',
      'fr': 'Inventaire ajusté avec succès',
    },
    'failedToAdjustInventory': {
      'en': 'Failed to adjust inventory',
      'fr': 'Échec de l\'ajustement de l\'inventaire',
    },
    'newQuantityOnHand': {
      'en': 'New Quantity on hand',
      'fr': 'Nouvelle quantité en main',
    },
    'quantityAdjusted': {'en': 'Quantity Adjusted', 'fr': 'Quantité ajustée'},
    'selectAReason': {'en': 'Select a reason', 'fr': 'Choisir une raison'},
    'otherReason': {'en': 'Other', 'fr': 'Autre'},
    'customReason': {'en': 'Custom Reason', 'fr': 'Raison personnalisée'},
    'stockOnFire': {'en': 'Stock on fire', 'fr': 'Stock incendié'},
    'markAsInactiveReason': {
      'en': 'Mark as Inactive',
      'fr': 'Marquer comme inactif',
    },
    'stolenGoods': {'en': 'Stolen goods', 'fr': 'Marchandise volée'},
    'damagedGoods': {'en': 'Damaged goods', 'fr': 'Marchandise endommagée'},
    'stockWrittenOff': {
      'en': 'Stock Written off',
      'fr': 'Stock passé en pertes',
    },
    'stocktakingResults': {
      'en': 'Stocktaking results',
      'fr': 'Résultats d\'inventaire',
    },
    'inventoryRevaluation': {
      'en': 'Inventory Revaluation',
      'fr': 'Réévaluation des stocks',
    },
    'user': {'en': 'User', 'fr': 'Utilisateur'},
    'created': {'en': 'Created', 'fr': 'Créé'},
    'noHistoryAvailable': {
      'en': 'No history available',
      'fr': 'Aucune historique disponible',
    },
    'overview': {'en': 'Overview', 'fr': 'Aperçu'},
    'history': {'en': 'History', 'fr': 'Historique'},
    'adjustments': {'en': 'Adjustments', 'fr': 'Ajustements'},
    'all': {'en': 'All', 'fr': 'Tout'},
    'returnIn': {'en': 'Return In', 'fr': 'Retourner'},
    'returnOut': {'en': 'Return Out', 'fr': 'Retourner'},
    'salesOrder': {'en': 'Sales Order', 'fr': 'Commande de vente'},
    'customerName': {'en': 'Customer Name', 'fr': 'Nom du client'},
    'quantitySold': {'en': 'Quantity Sold', 'fr': 'Quantité vendue'},
    'purchaseOrder': {'en': 'Purchase Order', 'fr': 'Commande d\'achat'},
    'quantityReceived': {'en': 'Quantity Received', 'fr': 'Quantité reçue'},
    'costPrice': {'en': 'Cost Price', 'fr': 'Prix de revient'},
    'adjustmentId': {'en': 'Adjustment ID', 'fr': 'ID d\'ajustement'},
    'quantityChange': {'en': 'Quantity Change', 'fr': 'Quantité modifiée'},
    'notAvailable': {'en': 'Not Available', 'fr': 'Non disponible'},
    'availableForSale': {
      'en': 'Available for Sale',
      'fr': 'Disponible pour la vente',
    },
    'committedStock': {'en': 'Committed Stock', 'fr': 'Stock engagé'},
    'stockOnHand': {'en': 'Stock on Hand', 'fr': 'Stock en main'},
    'accountingStock': {'en': 'Accounting Stock', 'fr': 'Stock comptable'},
    'purchaseInformation': {
      'en': 'Purchase Information',
      'fr': 'Information d\'achat',
    },
    'physicalStock': {'en': 'Physical Stock', 'fr': 'Stock physique'},
    'inventoryDetails': {'en': 'Inventory Details', 'fr': 'Détails des stocks'},
    'nonPerishable': {'en': 'No perishable', 'fr': 'Non perisable'},
    'productLevel': {'en': 'Product level', 'fr': 'Niveau de produit'},
    'lotLevel': {'en': 'Lot level', 'fr': 'Niveau de lot'},
    'invalidEmailOrPassword': {
      'en': 'Invalid email or password.',
      'fr': 'Email ou mot de passe invalide.',
    },
    'noConnection': {
      'en': 'No connection. Please connect to the network.',
      'fr': 'Aucune connexion. Veuillez vous connecter à la réseau.',
    },
    'accountDisabled': {
      'en': 'This account has been disabled.',
      'fr': 'Ce compte a été désactivé.',
    },
    'serverError': {
      'en': 'A server error occurred. Please try again later.',
      'fr': 'Une erreur serveur s\'est produite. Veuillez réessayer plus tard.',
    },
    'offlineUserNotFound': {
      'en':
          'Offline login unavailable. Please connect to the network for your first login on this device.',
      'fr':
          'Connexion hors ligne non disponible. Veuillez vous connecter au réseau pour votre première connexion sur cet appareil.',
    },
    'yourAreNotAssociatedWithAnyBusinessMessage': {
      'en':
          'Your account is not associated with any business.\n Contact your administrator to get access.',
      'fr':
          "Votre compte n'est pas encore lié à un commerce.\n Contactez votre administrateur pour obtenir l'accès.",
    },
    'support': {'en': 'Support', 'fr': 'Support'},
    'phone': {'en': 'Phone', 'fr': 'Téléphone'},
    'contactAdmin': {'en': 'Contact Admin', 'fr': 'Contacter l\'admin'},
    'loadingProlile': {'en': 'Loading profile…', 'fr': 'Chargement du profil…'},
    'morning': {'en': 'Good morning', 'fr': 'Bonjour'},
    'evening': {'en': 'Good evening', 'fr': 'Bonsoir'},
    'afternoon': {'en': 'Good afternoon', 'fr': 'Bon après-midi'},
    'monday': {'en': 'Monday', 'fr': 'Lundi'},
    'tuesday': {'en': 'Tuesday', 'fr': 'Mardi'},
    'wednesday': {'en': 'Wednesday', 'fr': 'Mercredi'},
    'thursday': {'en': 'Thursday', 'fr': 'Jeudi'},
    'friday': {'en': 'Friday', 'fr': 'Vendredi'},
    'saturday': {'en': 'Saturday', 'fr': 'Samedi'},
    'sunday': {'en': 'Sunday', 'fr': 'Dimanche'},
    'january': {'en': 'January', 'fr': 'Janvier'},
    'february': {'en': 'February', 'fr': 'Février'},
    'march': {'en': 'March', 'fr': 'Mars'},
    'april': {'en': 'April', 'fr': 'Avril'},
    'may': {'en': 'May', 'fr': 'Mai'},
    'june': {'en': 'June', 'fr': 'Juin'},
    'july': {'en': 'July', 'fr': 'Juillet'},
    'august': {'en': 'August', 'fr': 'Août'},
    'september': {'en': 'September', 'fr': 'Septembre'},
    'october': {'en': 'October', 'fr': 'Octobre'},
    'november': {'en': 'November', 'fr': 'Novembre'},
    'december': {'en': 'December', 'fr': 'Décembre'},
    'nonLue': {'en': 'non lue @count', 'fr': 'non lue @count'},
    'justNow': {'en': 'just now', 'fr': 'à l\'instant'},
    'minutesAgo': {'en': '@count minutes ago', 'fr': 'il y a @count minutes'},
    'hoursAgo': {'en': '@count hours ago', 'fr': 'il y a @count heures'},
    'daysAgo': {'en': '@count days ago', 'fr': 'il y a @count jours'},
    'online': {'en': 'Online', 'fr': 'En Line'},
    'allProductsAreWellStockedMessage': {
      'en': 'All products are well stocked.',
      'fr': 'Tous les niveaux de stock sont suffisants.',
    },
    'reorderThreshold': {
      'en': 'Reorder Threshold',
      'fr': 'Seuil de réapprovisionnement',
    },
    'movement': {'en': 'Movement', 'fr': 'Mouvement'},
    'expiration': {'en': 'Expiration', 'fr': 'Expiration'},
    'buy': {'en': 'Buy', 'fr': 'Achat'},
    'sellingPrince': {'en': 'Selling Price', 'fr': 'Prix de vente'},
    'pruchaseCost': {'en': 'Purchase Cost', 'fr': 'Coût d\'achat'},
    'stockSummary': {'en': 'Stock Summary', 'fr': 'Résumé de stock'},
    'moreInformation': {'en': 'More Information', 'fr': 'Plus d\'informations'},
    'salesAndPurchaseInformation': {
      'en': 'Sales and Purchase Information',
      'fr': 'Informations de vente et d\'achat',
    },
    'invalidFormFields': {
      'en': 'Invalid form fields',
      'fr': 'Champs du formulaire invalide',
    },
    'allSuppliersText': {'en': 'All Suppliers', 'fr': 'Tous les Fournisseurs'},
    'result': {'en': 'result', 'fr': 'résultat'},
    'noPaid': {'en': 'No Paid', 'fr': 'Non payée'},
    'due': {'en': 'Due', 'fr': 'Dû'},
    'deleteBill': {'en': 'Delete Bill', 'fr': 'Supprimer la facture'},
    'confirmPayment': {'en': 'Confirm Payment', 'fr': 'Confirmer le paiement'},
    'markAsPaid': {'en': 'Mark as Paid', 'fr': 'Marquer comme payée ?'},
    'itemWillBeDelete': {
      'en': '@item will definitively delete',
      'fr': '@item sera supprimée définitivement',
    },
    'linkPurchaseOrder': {
      'en': 'PURCHASE ORDER LINKED',
      'fr': 'BON DE COMMANDE LIÉ',
    },
    'remainAmountDu': {'en': 'Remaining amount due', 'fr': 'Solde reste dû'},
    'searchBill': {
      'en': 'Search for a bill...',
      'fr': 'Rechercher une facture…',
    },
    'selectBill': {'en': 'Select a bill', 'fr': 'Sélectionnez une facture'},
    'clickBillToSeeDetails': {
      'en': 'Click on a bill to see details.',
      'fr': 'Cliquez sur une facture pour voir les détails.',
    },
    'purchaseOrders': {'en': 'Purchase Orders', 'fr': 'Bons de commande'},
    'newPurchaseOrder': {
      'en': 'New Purchase Order',
      'fr': 'Nouveau bon de commande',
    },
    'searchPurchaseOrder': {
      'en': 'Search for a PO...',
      'fr': 'Rechercher un BC…',
    },
    'selectPurchaseOrder': {
      'en': 'Select a purchase order',
      'fr': 'Sélectionnez un bon de commande',
    },
    'clickPurchaseOrderToSeeDetails': {
      'en': 'Click on a PO to see details.',
      'fr': 'Cliquez sur un BC pour voir les détails.',
    },
    'noPurchaseOrders': {
      'en': 'No purchase orders',
      'fr': 'Aucun bon de commande',
    },
    'noResults': {'en': 'No results', 'fr': 'Aucun résultat'},
    'modifyFilters': {
      'en': 'Modify filters to see more results.',
      'fr': 'Modifiez les filtres pour voir plus de résultats.',
    },
    'createFirstPurchaseOrder': {
      'en': 'Create your first purchase order.',
      'fr': 'Créez votre premier bon de commande.',
    },
    'supplierPlaceholder': {'en': 'Supplier', 'fr': 'Fournisseur'},
    'deliveryAddress': {'en': 'Delivery Address', 'fr': 'Adresse de livraison'},
    'orderedItems': {'en': 'Ordered Items', 'fr': 'Articles commandés'},
    'addItem': {'en': 'Add Item', 'fr': 'Ajouter un article'},
    'createPurchaseOrder': {
      'en': 'Create Purchase Order',
      'fr': 'Créer le bon de commande',
    },
    'generate': {'en': 'Generate', 'fr': 'Générer'},
    'generateBillQuestion': {
      'en': 'Generate Bill?',
      'fr': 'Générer la facture ?',
    },
    'billWillBeCreated': {
      'en': 'A bill will be created for @refId (@amount).',
      'fr': 'Une facture sera créée pour @refId (@amount).',
    },
    'downloadPDF': {'en': 'Download PDF', 'fr': 'Télécharger PDF'},
    'print': {'en': 'Print', 'fr': 'Imprimer'},
    'clone': {'en': 'Clone', 'fr': 'Cloner'},
    'cancelOrder': {'en': 'Cancel Order', 'fr': 'Annuler la commande'},
    'cancelPurchaseOrderQuestion': {
      'en': 'Cancel this purchase order?',
      'fr': 'Annuler ce bon de commande ?',
    },
    'confirmCancellation': {
      'en': 'Confirm Cancellation',
      'fr': 'Confirmer l\'annulation',
    },
    'receive': {'en': 'Receive', 'fr': 'Réceptionner'},
    'generateBill': {'en': 'Generate Bill', 'fr': 'Générer facture'},
    'bills': {'en': 'Bills', 'fr': 'Factures'},
    'receivals': {'en': 'Receivals', 'fr': 'Réceptions'},
    'totalAmountIncludingTax': {
      'en': 'Total amount incl. tax',
      'fr': 'Montant total TTC',
    },
    'expectedDelivery': {'en': 'Expected Delivery', 'fr': 'Livraison prévue'},
    'details': {'en': 'Details', 'fr': 'Détails'},
    'deliveryTo': {'en': 'Delivery to', 'fr': 'Livraison à'},
    'subtotalHT': {'en': 'Subtotal HT', 'fr': 'Sous-total HT'},
    'productHeader': {'en': 'Product', 'fr': 'Produit'},
    'amountHeader': {'en': 'Amount', 'fr': 'Montant'},
    'totalTTC': {'en': 'Total TTC', 'fr': 'Total TTC'},
    'receivedCount': {'en': '@count received', 'fr': '@count reçus'},
    'rejectedCount': {'en': '@count rejected', 'fr': '@count rejetés'},
    'differences': {'en': 'Differences', 'fr': 'Écarts'},
    'linkedBills': {'en': 'Linked Bills', 'fr': 'Factures liées'},
    'noBillForPurchaseOrder': {
      'en': 'No bill for this purchase order.',
      'fr': 'Aucune facture pour ce bon de commande.',
    },
    'receivingNotes': {'en': 'Receiving Notes', 'fr': 'Bons de réception'},
    'noReceivingRecorded': {
      'en': 'No receiving recorded.',
      'fr': 'Aucune réception enregistrée.',
    },
    'impossibleToLoadPurchaseOrderData': {
      'en': 'Impossible to load purchase order data.',
      'fr': 'Impossible de charger les données du bon de commande.',
    },
    'impossibleToRecordReceiving': {
      'en': 'Impossible to record receiving.',
      'fr': 'Impossible d\'enregistrer la réception.',
    },
    'receivingRecorded': {
      'en': 'Receiving @refId recorded.',
      'fr': 'Réception @refId enregistrée.',
    },
    'impossibleToGenerateBill': {
      'en': 'Impossible to generate bill.',
      'fr': 'Impossible de générer la facture.',
    },
    'billGenerated': {'en': 'Bill generated.', 'fr': 'Facture générée.'},
    'impossibleToCancelPurchaseOrder': {
      'en': 'Impossible to cancel this purchase order.',
      'fr': 'Impossible d\'annuler ce bon de commande.',
    },
    'purchaseOrderCancelled': {
      'en': 'Purchase order cancelled.',
      'fr': 'Bon de commande annulé.',
    },
    'impossibleToUpdateStatus': {
      'en': 'Impossible to update status.',
      'fr': 'Impossible de mettre à jour le statut.',
    },
    'noBill': {'en': 'No bill', 'fr': 'Aucune facture'},
    'billsWillAppearHere': {
      'en': 'Supplier bills will appear here.',
      'fr': 'Les factures fournisseurs apparaîtront ici.',
    },
    'newBill': {'en': 'New Bill', 'fr': 'Nouvelle facture'},
    'billCreationDescription': {
      'en':
          'Bills are usually created from a purchase order. Use "Generate Bill" in the purchase order details.',
      'fr':
          'Les factures sont généralement créées depuis un bon de commande. Utilisez "Générer la facture" dans le détail d\'un bon de commande.',
    },
    'unknownError': {'en': 'Unknown error', 'fr': 'Unknown error'},
    'impossibleToCreateBill': {
      'en': 'Impossible to create bill.',
      'fr': 'Impossible de créer la facture.',
    },
    'impossibleToDeleteBill': {
      'en': 'Impossible to delete bill.',
      'fr': 'Impossible de supprimer la facture.',
    },
    'billWithPaymentsCannotBeDeleted': {
      'en': 'Cannot delete a bill that has payments.',
      'fr': 'Impossible de supprimer une facture ayant des paiements.',
    },
    'impossibleToMarkAsPaid': {
      'en': 'Impossible to mark as paid.',
      'fr': 'Impossible de marquer comme payée.',
    },
    'impossibleToVoidBill': {
      'en': 'Impossible to void bill.',
      'fr': 'Impossible d\'annuler la facture.',
    },
    'dueDate': {'en': 'Due Date', 'fr': 'Échéance'},
    'tva': {'en': 'VAT', 'fr': 'TVA'},
    'jan': {'en': 'Jan', 'fr': 'Jan'},
    'feb': {'en': 'Feb', 'fr': 'Fév'},
    'mar': {'en': 'Mar', 'fr': 'Mar'},
    'apr': {'en': 'Apr', 'fr': 'Avr'},
    'jun': {'en': 'Jun', 'fr': 'Juin'},
    'jul': {'en': 'Jul', 'fr': 'Juil'},
    'aug': {'en': 'Aug', 'fr': 'Aoû'},
    'sep': {'en': 'Sep', 'fr': 'Sep'},
    'oct': {'en': 'Oct', 'fr': 'Oct'},
    'nov': {'en': 'Nov', 'fr': 'Nov'},
    'dec': {'en': 'Dec', 'fr': 'Déc'},
    'newBillMessage': {
      'en':
          'bills are usually created from a purchase order. Use "Generate bill" in the details of a purchase order.',
      'fr':
          'Les factures sont généralement créées depuis un bon de commande. Utilisez "Générer la facture" dans le détail d\'un bon de commande',
    },
    'failedToCreateThePurchaseOrder': {
      'en': 'Failed to create the purchase order.',
      'fr': 'Echec de creation du bon de commande.',
    },
    'purchaseOrderSuccessfullCreate': {
      'en': 'Purchase order created successfully.',
      'fr': 'Bon de commande créé avec succès.',
    },
    'receip': {'en': 'Receip', 'fr': 'Reçu'},
    'editBill': {'en': 'Edit bill', 'fr': 'Modifier la facture'},
    'fromPurchaseOrder': {
      'en': 'From purchase order',
      'fr': 'Depuis le bon de commande',
    },
    'generalInfo': {'en': 'General info', 'fr': 'Informations générales'},
    'purchaseOrderRef': {'en': 'Purchase order', 'fr': 'Bon de commande'},
    'purchaseOrderRefHint': {'en': 'e.g. PO-2026-001', 'fr': 'ex. PO-2026-001'},
    'supplierIdHint': {'en': 'Supplier ID', 'fr': 'ID fournisseur'},
    'supplierRequired': {
      'en': 'Supplier is required.',
      'fr': 'Le fournisseur est obligatoire.',
    },
    'lockedFromPO': {'en': 'Locked (PO)', 'fr': 'Verrouillé (BC)'},
    'billDate': {'en': 'Bill date', 'fr': 'Date de facture'},
    'atLeastOneItemRequired': {
      'en': 'Add at least one item.',
      'fr': 'Ajoutez au moins un article.',
    },
    'invalidQuantity': {
      'en': 'Quantity must be greater than 0.',
      'fr': 'La quantité doit être supérieure à 0.',
    },
    'invalidPrice': {
      'en': 'Price cannot be negative.',
      'fr': 'Le prix ne peut pas être négatif.',
    },
    'qty': {'en': 'Qty', 'fr': 'Qté'},
    'unitPrice': {'en': 'Unit price', 'fr': 'Prix unitaire'},
    'taxAbbr': {'en': 'Tax', 'fr': 'TVA'},
    'subTotal': {'en': 'Sub-total (excl. tax)', 'fr': 'Sous-total HT'},
    'taxTotal': {'en': 'Tax total', 'fr': 'Total TVA'},
    'notesHint': {
      'en': 'Payment terms, additional info…',
      'fr': 'Conditions de paiement, informations complémentaires…',
    },
    'searchProductHint': {
      'en': 'Search products…',
      'fr': 'Rechercher un produit…',
    },
    'failedToCreateBill': {
      'en': 'Failed to create the bill.',
      'fr': 'Impossible de créer la facture.',
    },
    'failedToUpdateBill': {
      'en': 'Failed to update the bill.',
      'fr': 'Impossible de mettre à jour la facture.',
    },

    'receptions': {'en': 'Receives', 'fr': 'Réceptions'},
    'readOnly': {'en': 'Read only', 'fr': 'Lecture seule'},
    'conformes': {'en': 'Compliant', 'fr': 'Conformes'},
    'ecarts': {'en': 'Issues', 'fr': 'Écarts'},
    'compliant': {'en': 'Compliant', 'fr': 'Conforme'},
    'withIssues': {'en': 'With issues', 'fr': 'Avec écarts'},
    'searchReceivingNoteHint': {
      'en': 'Ref, supplier, purchase order…',
      'fr': 'Réf, fournisseur, bon de commande…',
    },
    'selectAReceivingNote': {
      'en': 'Select a receiving note',
      'fr': 'Sélectionnez une réception',
    },
    'clickOnReceivingNoteForDetails': {
      'en': 'Click on a receiving note to view the details.',
      'fr': 'Cliquez sur un bon de réception pour voir les détails.',
    },
    'modifyFiltersForMoreResults': {
      'en': 'Adjust the filters to see more results.',
      'fr': 'Modifiez les filtres pour voir plus de résultats.',
    },
    'receivingNotesCreatedFromPos': {
      'en': 'Receives created from purchase orders will appear here.',
      'fr':
          'Les réceptions créées depuis les bons de commande apparaîtront ici.',
    },
    'receivedItems': {'en': 'Received items', 'fr': 'Articles réceptionnés'},
    'receivedPlural': {'en': 'received', 'fr': 'reçus'},
    'rejectedPlural': {'en': 'rejected', 'fr': 'rejetés'},
    'lines': {'en': 'Lines', 'fr': 'Lignes'},
    'receptionDate': {'en': 'Reception date', 'fr': 'Date de réception'},
    'creationDate': {'en': 'Creation date', 'fr': 'Date de création'},
    'receivedBy': {'en': 'Received by', 'fr': 'Reçu par'},
    'linkedPurchaseOrder': {
      'en': 'Linked purchase order',
      'fr': 'Bon de commande lié',
    },
    'expected': {'en': 'Expected', 'fr': 'Attendu'},
    'expirationAbbr': {'en': 'Exp.', 'fr': 'Exp.'},
    'batchAbbr': {'en': 'Batch', 'fr': 'Lot'},
    'percentReceived': {'en': '% received', 'fr': '% reçu'},
    'receivingNoteNotFound': {
      'en': 'Receiving note not found.',
      'fr': 'Bon de commande introuvable.',
    },

    'rejected': {'en': 'Rejected', 'fr': 'Rejeté'},

    'atLeastOneItemRequiredLabel': {
      'en': 'At least one item is required',
      'fr': 'Au moins un article est requis',
    },
    'receivedDate': {'en': 'Received date', 'fr': 'Date de réception'},
    'saveTheReceiption': {
      'en': 'Save the receiption',
      'fr': 'Enregistrer la réception',
    },
    'ordered': {'en': 'Ordered', 'fr': 'Commandé'},
    'rest': {'en': 'Rest', 'fr': 'Restant'},
    'received_quantity_must_be_less_than_remaining': {
      'en': 'Received quantity must be less than remaining',
      'fr': 'La quantité reçue doit être inférieure au restant',
    },
    'rejected_quantity_must_be_less_than_remaining': {
      'en': 'Rejected quantity must be less than remaining',
      'fr': 'La quantité rejetée doit être inférieure au restant',
    },
    'closed': {'en': 'Closed', 'fr': 'Cloturé'},
    'pleaseSelectAtLeastOneReceive': {
      'en': 'Please select at least one receive',
      'fr': 'Veuillez sélectionner au moins une option de réception',
    },
    'receives': {'en': 'Receives', 'fr': 'Reçoit'},
    'receivesDescription': {
      'en': 'Create a bill for one or more receives in this purchase order.',
      'fr':
          'Créer une facture pour un ou plusieurs articles de cette commande.',
    },
    'yetToReceive': {'en': 'Yet To Receive', 'fr': 'En attente de réception'},
    'yetToReceiveDescription': {
      'en':
          'Create a bill for all the items in this purchase order that are yet to be received.',
      'fr':
          'Créez une facture pour tous les articles de ce bon de commande qui n\'ont pas encore été reçus.',
    },
    'allItemsReceivedChooseReceives': {
      'en':
          'You have received all the items from this purchase order. Choose one or more receives to create a bill.',
      'fr':
          'Vous avez reçu tous les articles de ce bon de commande. Sélectionnez une ou plusieurs entrées de stock pour créer une facture.',
    },
    'partialItemsReceivedChooseBillType': {
      'en':
          'You have received few items from this purchase order. You can choose to create a bill for either the received items or the yet to receive items.',
      'fr':
          'Vous n\'avez reçu que quelques articles de ce bon de commande. Vous pouvez choisir de créer une facture soit pour les articles déjà reçus, soit pour ceux qui restent à recevoir.',
    },
    'unselectAll': {'en': 'Unselect all', 'fr': 'Tout désélectionner'},

    'selectAll': {'en': 'Select all', 'fr': 'Tout sélectionner'},
    'quantityFromReceive': {
      'en': 'Quantities since receipt',
      'fr': 'Quantités depuis réception',
    },
    'fromReveice': {
      'en': 'Since @nbr deliveries',
      'fr': 'Depuis @nbr réception(s)',
    },
    'addPayment': {'en': 'Add payment', 'fr': 'Ajouter payment'},
    'receiver': {'en': 'Receiver', 'fr': 'Destinataire'},
    'deleteConfirmation': {
      'en': 'Are you sure you want to delete this @item?',
      'fr': 'Êtes-vous sûr de vouloir supprimer ce @item?',
    },
    'deleteConfirmationDescription': {
      'en': 'This action cannot be undone.',
      'fr': 'Cette action ne peut pas être annulée.',
    },
    'referenceNumber': {'en': 'Reference Number', 'fr': 'Numéro de référence'},
    'validationFailed': {'en': 'Validation failed', 'fr': 'Validation échouée'},
    'noPayment': {'en': 'No Payments', 'fr': 'Aucun payment'},
    'noPaymentDescription': {
      'en': 'Create a payment to see it here',
      'fr': 'Creer un payment pour le vois ici',
    },
    'selectPaymentToSeeDetail': {
      'en': 'Select payment to see the detail',
      'fr': 'Selectionner un payment pour vois les details',
    },
    'payInFull': {'en': 'pay in full', 'fr': 'payer intégralement'},
    'noUserFound': {'en': 'No user found', 'fr': 'Aucun utilisateur trouvé'},
    'sessionExpired': {'en': 'Session expired', 'fr': 'Session expirée'},
    'pleaseSignInAgain': {
      'en': 'Please sign in again to continue',
      'fr': 'Veuillez vous reconnecter pour continuer',
    },
    'backToSignIn': {'en': 'Back to Sign In', 'fr': 'Retour à la connexion'},
    'verifyAmountWithCustomer': {
      'en': 'Verify amount with customer',
      'fr': 'Vérifier le montant avec le client',
    },
    'orderConfirmation': {
      'en': 'Order confirmation',
      'fr': 'Confirmation de commande',
    },
    'confirmAndCollect': {
      'en': 'Confirm and collect',
      'fr': 'Confirmer & collecter',
    },
    'changeToGive': {'en': 'Change to give', 'fr': 'Monnaie à rendre'},
    'modify': {'en': 'Modify', 'fr': 'Modifier'},
    'taxIncluded': {'en': 'Tax included', 'fr': 'Taux inclus'},
    'unit': {'en': 'Unit', 'fr': 'Unité'},
    'totalToPay': {'en': 'Total to pay', 'fr': 'Total à payer'},
    'mobileMoneySubLabel': {
      'en': 'Orange Money / MTN MoMo',
      'fr': 'Orange Money / MTN MoMo',
    },
    'paymentComplete': {'en': 'Payment complete', 'fr': 'Paiement effectué'},
    'payment': {'en': 'Payment', 'fr': 'Paiement'},
    'noPaymentAdded': {'en': 'No payment added', 'fr': 'Aucun paiement ajouté'},
    'printFailed': {'en': 'Print failed', 'fr': 'Échec de l\'impression'},
    'incompletePayment': {
      'en': 'Incomplete payment',
      'fr': 'Paiement incomplet',
    },
    'saleError': {'en': 'Sale error', 'fr': 'Erreur de vente'},
    'voucherOfWillBeAutoCreate': {
      'en': 'Voucher of @amount will be automatically created',
      'fr': 'Un Bon de commande de @amount sera automatiquement créé',
    },
    'receipt': {'en': 'Receipt', 'fr': 'Reçu'},
    'cashier': {'en': 'Cashier', 'fr': 'Caissier'},
    'giftVoucherTitle': {
      'en': '*** GIFT VOUCHER ***',
      'fr': '*** BON D\'ACHAT ***',
    },
    'valueLabel': {'en': 'Value:', 'fr': 'Valeur:'},
    'keepTicketSafe': {
      'en': 'Please keep this ticket safe',
      'fr': 'Conservez ce ticket précieusement',
    },
    'bp': {'en': 'P.O. Box', 'fr': 'BP'},
    'generatedBy': {'en': 'Generated by Sabitou', 'fr': 'Généré par Sabitou'},
    'thankYouForYourPurchase': {
      'en': 'Thank you for your purchase!',
      'fr': 'Merci pour votre achat!',
    },
    'poweredBy': {'en': 'Powered by Sabitou', 'fr': 'Propulsé par Sabitou'},
    'signature': {'en': 'Signature', 'fr': 'Signature'},
    'signatureAndDate': {'en': 'Signature & Date', 'fr': 'Signature & Date'},
    'referenceAbbr': {'en': 'Ref.', 'fr': 'Réf.'},
    'giftVoucherIssued': {
      'en': 'Gift voucher issued',
      'fr': 'Bon d\'achat émis',
    },
    'changeGivenLabel': {'en': 'Change given', 'fr': 'Rendu monnaie'},
    'closedStatus': {'en': 'CLOSED', 'fr': 'CLÔTURÉ'},
    'notSpecifiedStatus': {'en': 'NOT SPECIFIED', 'fr': 'NON SPÉCIFIÉ'},
    'billTitle': {'en': 'SUPPLIER INVOICE', 'fr': 'FACTURE FOURNISSEUR'},
    'createdAt': {'en': 'Created on', 'fr': 'Créé le'},
    'totalHT': {'en': 'Total EXCL', 'fr': 'Total HT'},
    'overdueStatus': {'en': 'OVERDUE', 'fr': 'EN RETARD'},
    'openStatus': {'en': 'OPEN', 'fr': 'OUVERT'},
    'voidStatus': {'en': 'VOID', 'fr': 'ANNULÉ'},
    'inProgressStatus': {'en': 'IN PROGRESS', 'fr': 'EN COURS'},
    'orderDate': {'en': 'Order Date', 'fr': 'Date commande'},
    'notesConditions': {
      'en': 'Notes / Conditions:',
      'fr': 'Notes / Conditions :',
    },
    'establishedBy': {'en': 'Established by', 'fr': 'Établi par'},
    'supplierStamp': {'en': 'Supplier Stamp', 'fr': 'Cachet fournisseur'},
    'approvedBy': {'en': 'Approved by', 'fr': 'Approuvé par'},
    'qtyOrdered': {'en': 'Qty Ord.', 'fr': 'Qté cmd.'},
    'qtyReceived': {'en': 'Qty Rec.', 'fr': 'Qté reçue'},
    'unitPriceHT': {'en': 'Subtotal HT', 'fr': 'Sous-total HT'},
    'files': {'en': 'Files', 'fr': 'Fichiers'},
    'gallery': {'en': 'Gallery', 'fr': 'Galerie'},
    'attach': {'en': 'Attach', 'fr': 'Joindre'},
    'file': {'en': 'File', 'fr': 'Fichier'},
    'processingFiles': {
      'en': 'Processing files…',
      'fr': 'Traitement des fichiers…',
    },
    'moreAllowed': {'en': 'more allowed', 'fr': 'plus permis'},
  };

  /// Returns the localized value of text 'productImages'.
  String get productImages => _stringOfLocalizedValue('productImages');

  /// Returns the localized value of text 'moreAllowed'.
  String get moreAllowed => _stringOfLocalizedValue('moreAllowed');

  /// Returns the localized value of text 'processingFiles'.
  String get processingFiles => _stringOfLocalizedValue('processingFiles');

  /// Returns the localized value of text 'file'.
  String get file => _stringOfLocalizedValue('file');

  /// Returns the localized value of text 'attach'.
  String get attach => _stringOfLocalizedValue('attach');

  /// Returns the localized value of text 'files'.
  String get files => _stringOfLocalizedValue('files');

  /// Returns the localized value of text 'gallery'.
  String get gallery => _stringOfLocalizedValue('gallery');

  /// Returns the localized value of text 'notesConditions'.
  String get notesConditions => _stringOfLocalizedValue('notesConditions');

  /// Returns the localized value of text 'establishedBy'.
  String get establishedBy => _stringOfLocalizedValue('establishedBy');

  /// Returns the localized value of text 'supplierStamp'.
  String get supplierStamp => _stringOfLocalizedValue('supplierStamp');

  /// Returns the localized value of text 'approvedBy'.
  String get approvedBy => _stringOfLocalizedValue('approvedBy');

  /// Returns the localized value of text 'qtyOrdered'.
  String get qtyOrdered => _stringOfLocalizedValue('qtyOrdered');

  /// Returns the localized value of text 'qtyReceived'.
  String get qtyReceived => _stringOfLocalizedValue('qtyReceived');

  /// Returns the localized value of text 'unitPriceHT'.
  String get unitPriceHT => _stringOfLocalizedValue('unitPriceHT');

  /// Returns the localized value of text 'orderDate'.
  String get orderDate => _stringOfLocalizedValue('orderDate');

  /// Returns the localized value of text 'inProgressStatus'.
  String get inProgressStatus => _stringOfLocalizedValue('inProgressStatus');

  /// Returns the localized value of text 'receipt'.
  String get receipt => _stringOfLocalizedValue('receipt');

  /// Returns the localized value of text 'cashier'.
  String get cashier => _stringOfLocalizedValue('cashier');

  /// Returns the localized value of text 'giftVoucherTitle'.
  String get giftVoucherTitle => _stringOfLocalizedValue('giftVoucherTitle');

  /// Returns the localized value of text 'valueLabel'.
  String get valueLabel => _stringOfLocalizedValue('valueLabel');

  /// Returns the localized value of text 'keepTicketSafe'.
  String get keepTicketSafe => _stringOfLocalizedValue('keepTicketSafe');

  /// Returns the localized value of text 'bp'.
  String get bp => _stringOfLocalizedValue('bp');

  /// Returns the localized value of text 'generatedBy'.
  String get generatedBy => _stringOfLocalizedValue('generatedBy');

  /// Returns the localized value of text 'thankYouForYourPurchase'.
  String get thankYouForYourPurchase =>
      _stringOfLocalizedValue('thankYouForYourPurchase');

  /// Returns the localized value of text 'poweredBy'.
  String get poweredBy => _stringOfLocalizedValue('poweredBy');

  /// Returns the localized value of text 'signature'.
  String get signature => _stringOfLocalizedValue('signature');

  /// Returns the localized value of text 'signatureAndDate'.
  String get signatureAndDate => _stringOfLocalizedValue('signatureAndDate');

  /// Returns the localized value of text 'referenceAbbr'.
  String get referenceAbbr => _stringOfLocalizedValue('referenceAbbr');

  /// Returns the localized value of text 'giftVoucherIssued'.
  String get giftVoucherIssued => _stringOfLocalizedValue('giftVoucherIssued');

  /// Returns the localized value of text 'changeGivenLabel'.
  String get changeGivenLabel => _stringOfLocalizedValue('changeGivenLabel');

  /// Returns the localized value of text 'voucherOfWillBeAutoCreate'.
  String get voucherOfWillBeAutoCreate =>
      _stringOfLocalizedValue('voucherOfWillBeAutoCreate');

  /// Returns the localized value of text 'noPaymentAdded'.
  String get noPaymentAdded => _stringOfLocalizedValue('noPaymentAdded');

  /// Returns the localized value of text 'printFailed'.
  String get printFailed => _stringOfLocalizedValue('printFailed');

  /// Returns the localized value of text 'incompletePayment'.
  String get incompletePayment => _stringOfLocalizedValue('incompletePayment');

  /// Returns the localized value of text 'saleError'.
  String get saleError => _stringOfLocalizedValue('saleError');

  /// Returns the localized value of text 'payment'.
  String get payment => _stringOfLocalizedValue('payment');

  /// Returns the localized value of text 'paymentComplete'.
  String get paymentComplete => _stringOfLocalizedValue('paymentComplete');

  /// Returns the localized value of text 'mobileMoneySubLabel'.
  String get mobileMoneySubLabel =>
      _stringOfLocalizedValue('mobileMoneySubLabel');

  /// Returns the localized value of text 'totalToPay'.
  String get totalToPay => _stringOfLocalizedValue('totalToPay');

  /// Returns the localized value of text 'changeToGive'.
  String get changeToGive => _stringOfLocalizedValue('changeToGive');

  /// Returns the localized value of text 'modify'.
  String get modify => _stringOfLocalizedValue('modify');

  /// Returns the localized value of text 'taxIncluded'.
  String get taxIncluded => _stringOfLocalizedValue('taxIncluded');

  /// Returns the localized value of text 'unit'.
  String get unit => _stringOfLocalizedValue('unit');

  /// Returns the localized value of text 'confirmAndCollect'.
  String get confirmAndCollect => _stringOfLocalizedValue('confirmAndCollect');

  /// Returns the localized value of text 'verifyAmountWithCustomer'.
  String get verifyAmountWithCustomer =>
      _stringOfLocalizedValue('verifyAmountWithCustomer');

  /// Returns the localized value of text 'orderConfirmation'.
  String get orderConfirmation => _stringOfLocalizedValue('orderConfirmation');

  /// Returns the localized value of text 'payInFull'.
  String get payInFull => _stringOfLocalizedValue('payInFull');

  /// Returns the localized value of text 'selectPaymentToSeeDetail'.
  String get selectPaymentToSeeDetail =>
      _stringOfLocalizedValue('selectPaymentToSeeDetail');

  /// Returns the localized value of text 'noPaymentDescription'.
  String get noPaymentDescription =>
      _stringOfLocalizedValue('noPaymentDescription');

  /// Returns the localized value of text 'noPayment'.
  String get noPayment => _stringOfLocalizedValue('noPayment');

  /// Returns the localized value of text 'validationFailed'.
  String get validationFailed => _stringOfLocalizedValue('validationFailed');

  /// Returns the localized value of text 'referenceNumber'.
  String get referenceNumber => _stringOfLocalizedValue('referenceNumber');

  /// Returns the localized value of text 'deleteConfirmationDescription'.
  String get deleteConfirmationDescription =>
      _stringOfLocalizedValue('deleteConfirmationDescription');

  /// Returns the localized value of text 'deleteConfirmation'.
  String get deleteConfirmation =>
      _stringOfLocalizedValue('deleteConfirmation');

  /// Returns the localized value of text 'receiver'.
  String get receiver => _stringOfLocalizedValue('receiver');

  /// Returns the localized value of text 'addPayment'.
  String get addPayment => _stringOfLocalizedValue('addPayment');

  /// Returns the localized value of text 'fromReveice'.
  String get fromReveice => _stringOfLocalizedValue('fromReveice');

  /// Returns the localized value of text 'quantityFromReceive'.
  String get quantityFromReceive =>
      _stringOfLocalizedValue('quantityFromReceive');

  /// Returns the localized value of text 'unselectAll'.
  String get unselectAll => _stringOfLocalizedValue('unselectAll');

  /// Returns the localized value of text 'selectAll'.
  String get selectAll => _stringOfLocalizedValue('selectAll');

  /// Returns the localized value of text 'partialItemsReceivedChooseBillType'.
  String get partialItemsReceivedChooseBillType =>
      _stringOfLocalizedValue('partialItemsReceivedChooseBillType');

  /// Returns the localized value of text 'allItemsReceivedChooseReceives'.
  String get allItemsReceivedChooseReceives =>
      _stringOfLocalizedValue('allItemsReceivedChooseReceives');

  /// Returns the localized value of text 'convertToBill'.
  String get yetToReceiveDescription =>
      _stringOfLocalizedValue('yetToReceiveDescription');

  /// Returns the localized value of text 'convertToBill'.
  String get yetToReceive => _stringOfLocalizedValue('yetToReceive');

  /// Returns the localized value of text 'convertToBill'.
  String get receivesDescription =>
      _stringOfLocalizedValue('receivesDescription');

  /// Returns the localized value of text 'convertToBill'.
  String get receives => _stringOfLocalizedValue('receives');

  /// Returns the localized value of text 'pleaseSelectAtLeastOneReceive'.
  String get pleaseSelectAtLeastOneReceive =>
      _stringOfLocalizedValue('pleaseSelectAtLeastOneReceive');

  /// Returns the localized value of text 'closed'.
  String get closed => _stringOfLocalizedValue('closed');

  /// Returns the localized value of text 'rejected_quantity_must_be_less_than_remaining'.
  String get rejected_quantity_must_be_less_than_remaining =>
      _stringOfLocalizedValue('rejected_quantity_must_be_less_than_remaining');

  /// Returns the localized value of text 'received_quantity_must_be_less_than_remaining'.
  String get received_quantity_must_be_less_than_remaining =>
      _stringOfLocalizedValue('received_quantity_must_be_less_than_remaining');

  /// Returns the localized value of text 'ordered'.
  String get ordered => _stringOfLocalizedValue('ordered');

  /// Returns the localized value of text 'rest'.
  String get rest => _stringOfLocalizedValue('rest');

  /// Returns the localized value of text 'saveTheReceiption'.
  String get saveTheReceiption => _stringOfLocalizedValue('saveTheReceiption');

  /// Returns the localized value of text 'receivedDate'.
  String get receivedDate => _stringOfLocalizedValue('receivedDate');

  /// Returns the localized value of text 'atLeastOneItemRequiredLabel'.
  String get atLeastOneItemRequiredLabel =>
      _stringOfLocalizedValue('atLeastOneItemRequiredLabel');

  /// Returns the localized value of text 'rejected'.
  String get rejected => _stringOfLocalizedValue('rejected');

  /// Returns the localized value of text 'expected'.
  String get expected => _stringOfLocalizedValue('expected');

  /// Returns the localized value of text 'receip'.
  String get receip => _stringOfLocalizedValue('receip');

  /// Returns the localized value of text 'purchaseOrderSuccessfullCreate'.
  String get purchaseOrderSuccessfullCreate =>
      _stringOfLocalizedValue('purchaseOrderSuccessfullCreate');

  /// Returns the localized value of text 'failedToCreateThePurchaseOrder'.
  String get failedToCreateThePurchaseOrder =>
      _stringOfLocalizedValue('failedToCreateThePurchaseOrder');

  /// Returns the localized value of text 'newBillMessage'.
  String get newBillMessage => _stringOfLocalizedValue('newBillMessage');

  /// Returns the localized value of text 'remainAmountDu'.
  String get remainAmountDu => _stringOfLocalizedValue('remainAmountDu');

  /// Returns the localized value of text 'linkPurchaseOrder'.
  String get linkPurchaseOrder => _stringOfLocalizedValue('linkPurchaseOrder');

  /// Returns the localized value of text 'confirmPayment'.
  String get confirmPayment => _stringOfLocalizedValue('confirmPayment');

  /// Returns the localized value of text 'markAsPaid'.
  String get markAsPaid => _stringOfLocalizedValue('markAsPaid');

  /// Returns the localized value of text 'itemWillBeDelete'.
  String get itemWillBeDelete => _stringOfLocalizedValue('itemWillBeDelete');

  /// Returns the localized value of text 'deleteBill'.
  String get deleteBill => _stringOfLocalizedValue('deleteBill');

  /// Returns the localized value of text 'due'.
  String get due => _stringOfLocalizedValue('due');

  /// Returns the localized value of text 'noPaid'.
  String get noPaid => _stringOfLocalizedValue('noPaid');

  /// Returns the localized value of text 'result'.
  String get result => _stringOfLocalizedValue('result');

  /// Returns the localized value of text 'allSuppliersText'.
  String get allSuppliersText => _stringOfLocalizedValue('allSuppliersText');

  /// Returns the localized value of text 'invalidFormFields'.
  String get invalidFormFields => _stringOfLocalizedValue('invalidFormFields');

  /// Returns the localized value of text 'salesAndPurchaseInformation'.
  String get salesAndPurchaseInformation =>
      _stringOfLocalizedValue('salesAndPurchaseInformation');

  /// Returns the localized value of text 'moreInformation'.
  String get moreInformation => _stringOfLocalizedValue('moreInformation');

  /// Returns the localized value of text 'stockSummary'.
  String get stockSummary => _stringOfLocalizedValue('stockSummary');

  /// Returns the localized value of text 'sellingPrince'.
  String get sellingPrince => _stringOfLocalizedValue('sellingPrince');

  /// Returns the localized value of text 'pruchaseCost'.
  String get pruchaseCost => _stringOfLocalizedValue('pruchaseCost');

  /// Returns the localized value of text 'movement'.
  String get movement => _stringOfLocalizedValue('movement');

  /// Returns the localized value of text 'sale'.
  String get expiration => _stringOfLocalizedValue('expiration');

  /// Returns the localized value of text 'buy'.
  String get buy => _stringOfLocalizedValue('buy');

  /// Returns the localized value of text 'reorderThreshold'.
  String get reorderThreshold => _stringOfLocalizedValue('reorderThreshold');

  /// Returns the localized value of text 'allProductsAreWellStockedMessage'.
  String get allProductsAreWellStockedMessage =>
      _stringOfLocalizedValue('allProductsAreWellStockedMessage');

  /// Returns the localized value of text 'online'.
  String get online => _stringOfLocalizedValue('online');

  /// Returns the localized value of text 'justNow'.
  String get justNow => _stringOfLocalizedValue('justNow');

  /// Returns the localized value of text 'minutesAgo'.
  String get minutesAgo => _stringOfLocalizedValue('minutesAgo');

  /// Returns the localized value of text 'hoursAgo'.
  String get hoursAgo => _stringOfLocalizedValue('hoursAgo');

  /// Returns the localized value of text 'daysAgo'.
  String get daysAgo => _stringOfLocalizedValue('daysAgo');

  /// Returns the localized value of text 'nonLue'.
  String get nonLue => _stringOfLocalizedValue('nonLue');

  /// Returns the localized value of text 'monday'.
  String get monday => _stringOfLocalizedValue('monday');

  /// Returns the localized value of text 'tuesday'.
  String get tuesday => _stringOfLocalizedValue('tuesday');

  /// Returns the localized value of text 'wednesday'.
  String get wednesday => _stringOfLocalizedValue('wednesday');

  /// Returns the localized value of text 'thursday'.
  String get thursday => _stringOfLocalizedValue('thursday');

  /// Returns the localized value of text 'friday'.
  String get friday => _stringOfLocalizedValue('friday');

  /// Returns the localized value of text 'saturday'.
  String get saturday => _stringOfLocalizedValue('saturday');

  /// Returns the localized value of text 'sunday'.
  String get sunday => _stringOfLocalizedValue('sunday');

  /// Returns the localized value of text 'january'.
  String get january => _stringOfLocalizedValue('january');

  /// Returns the localized value of text 'february'.
  String get february => _stringOfLocalizedValue('february');

  /// Returns the localized value of text 'march'.
  String get march => _stringOfLocalizedValue('march');

  /// Returns the localized value of text 'april'.
  String get april => _stringOfLocalizedValue('april');

  /// Returns the localized value of text 'may'.
  String get may => _stringOfLocalizedValue('may');

  /// Returns the localized value of text 'june'.
  String get june => _stringOfLocalizedValue('june');

  /// Returns the localized value of text 'july'.
  String get july => _stringOfLocalizedValue('july');

  /// Returns the localized value of text 'august'.
  String get august => _stringOfLocalizedValue('august');

  /// Returns the localized value of text 'september'.
  String get september => _stringOfLocalizedValue('september');

  /// Returns the localized value of text 'october'.
  String get october => _stringOfLocalizedValue('october');

  /// Returns the localized value of text 'november'.
  String get november => _stringOfLocalizedValue('november');

  /// Returns the localized value of text 'december'.
  String get december => _stringOfLocalizedValue('december');

  /// Returns the localized value of text 'morning'.
  String get morning => _stringOfLocalizedValue('morning');

  /// Returns the localized value of text 'evening'.
  String get evening => _stringOfLocalizedValue('evening');

  /// Returns the localized value of text 'afternoon'.
  String get afternoon => _stringOfLocalizedValue('afternoon');

  /// Returns the localized value of text 'loadingProlile'.
  String get loadingProlile => _stringOfLocalizedValue('loadingProlile');

  /// Returns the localized value of text 'contactAdmin'.
  String get contactAdmin => _stringOfLocalizedValue('contactAdmin');

  /// Returns the localized value of text 'support'.
  String get support => _stringOfLocalizedValue('support');

  /// Returns the localized value of text 'phone'.
  String get phone => _stringOfLocalizedValue('phone');

  /// Returns the localized value of text 'yourAreNotAssociatedWithAnyBusinessMessage'.
  String get yourAreNotAssociatedWithAnyBusinessMessage =>
      _stringOfLocalizedValue('yourAreNotAssociatedWithAnyBusinessMessage');

  /// Returns the localized value of text 'offlineUserNotFound'.
  String get offlineUserNotFound =>
      _stringOfLocalizedValue('offlineUserNotFound');

  /// Returns the localized value of text 'noConnection'.
  String get noConnection => _stringOfLocalizedValue('noConnection');

  /// Returns the localized value of text 'accountDisabled'.
  String get accountDisabled => _stringOfLocalizedValue('accountDisabled');

  /// Returns the localized value of text 'serverError'.
  String get serverError => _stringOfLocalizedValue('serverError');

  /// Returns the localized value of text 'invalidEmailOrPassword'.
  String get invalidEmailOrPassword =>
      _stringOfLocalizedValue('invalidEmailOrPassword');

  /// Returns the localized value of text 'nonPerishable'.
  String get nonPerishable => _stringOfLocalizedValue('nonPerishable');

  /// Returns the localized value of text 'productLevel'.
  String get productLevel => _stringOfLocalizedValue('productLevel');

  /// Returns the localized value of text 'lotLevel'.
  String get lotLevel => _stringOfLocalizedValue('lotLevel');

  /// Returns the localized value of text 'availableForSale'.
  String get availableForSale => _stringOfLocalizedValue('availableForSale');

  /// Returns the localized value of text 'availableForSale'.
  String get inventoryDetails => _stringOfLocalizedValue('inventoryDetails');

  /// Returns the localized value of text 'committedStock'.
  String get committedStock => _stringOfLocalizedValue('committedStock');

  /// Returns the localized value of text 'stockOnHand'.
  String get stockOnHand => _stringOfLocalizedValue('stockOnHand');

  /// Returns the localized value of text 'accountingStock'.
  String get accountingStock => _stringOfLocalizedValue('accountingStock');

  /// Returns the localized value of text 'purchaseInformation'.
  String get purchaseInformation =>
      _stringOfLocalizedValue('purchaseInformation');

  /// Returns the localized value of text 'physicalStock'.
  String get physicalStock => _stringOfLocalizedValue('physicalStock');

  /// Returns the localized value of text 'openingStock'.
  String get openingStock => _stringOfLocalizedValue('openingStock');

  /// Returns the localized value of text 'notAvailable'.
  String get notAvailable => _stringOfLocalizedValue('notAvailable');

  /// Returns the localized value of text 'returnIn'.
  String get returnIn => _stringOfLocalizedValue('returnIn');

  /// Returns the localized value of text 'returnOut'.
  String get returnOut => _stringOfLocalizedValue('returnOut');

  /// Returns the localized value of text 'salesOrder'.
  String get salesOrder => _stringOfLocalizedValue('salesOrder');

  /// Returns the localized value of text 'customerName'.
  String get customerName => _stringOfLocalizedValue('customerName');

  /// Returns the localized value of text 'quantitySold'.
  String get quantitySold => _stringOfLocalizedValue('quantitySold');

  /// Returns the localized value of text 'purchaseOrder'.
  String get purchaseOrder => _stringOfLocalizedValue('purchaseOrder');

  /// Returns the localized value of text 'quantityReceived'.
  String get quantityReceived => _stringOfLocalizedValue('quantityReceived');

  /// Returns the localized value of text 'costPrice'.
  String get costPrice => _stringOfLocalizedValue('costPrice');

  /// Returns the localized value of text 'adjustmentId'.
  String get adjustmentId => _stringOfLocalizedValue('adjustmentId');

  /// Returns the localized value of text 'quantityChange'.
  String get quantityChange => _stringOfLocalizedValue('quantityChange');

  /// Returns the localized value of text 'all'.
  String get all => _stringOfLocalizedValue('all');

  /// Returns the localized value of text 'adjustments'.
  String get adjustments => _stringOfLocalizedValue('adjustments');

  /// Returns the localized value of text 'noTransactionsFound'.
  String get noTransactionsFound =>
      _stringOfLocalizedValue('noTransactionsFound');

  /// Returns the localized value of text 'user'.
  String get user => _stringOfLocalizedValue('user');

  /// Returns the localized value of text 'created'.
  String get created => _stringOfLocalizedValue('created');

  /// Returns the localized value of text 'noHistoryAvailable'.
  String get noHistoryAvailable =>
      _stringOfLocalizedValue('noHistoryAvailable');

  /// Returns the localized value of text 'overview'.
  String get overview => _stringOfLocalizedValue('overview');

  /// Returns the localized value of text 'history'.
  String get history => _stringOfLocalizedValue('history');

  /// Returns the localized value of text 'adjustInventory'.
  String get adjustInventory => _stringOfLocalizedValue('adjustInventory');

  /// Returns the localized value of text 'currentStock'.
  String get currentStock => _stringOfLocalizedValue('currentStock');

  /// Returns the localized value of text 'newQuantityOnHand'.
  String get newQuantityOnHand => _stringOfLocalizedValue('newQuantityOnHand');

  /// Returns the localized value of text 'quantityAdjusted'.
  String get quantityAdjusted => _stringOfLocalizedValue('quantityAdjusted');

  /// Returns the localized value of text 'selectAReason'.
  String get selectAReason => _stringOfLocalizedValue('selectAReason');

  /// Returns the localized value of text 'otherReason'.
  String get otherReason => _stringOfLocalizedValue('otherReason');

  /// Returns the localized value of text 'customReason'.
  String get customReason => _stringOfLocalizedValue('customReason');

  /// Returns the localized value of text 'stockOnFire'.
  String get stockOnFire => _stringOfLocalizedValue('stockOnFire');

  /// Returns the localized value of text 'markAsInactiveReason'.
  String get markAsInactiveReason =>
      _stringOfLocalizedValue('markAsInactiveReason');

  /// Returns the localized value of text 'stolenGoods'.
  String get stolenGoods => _stringOfLocalizedValue('stolenGoods');

  /// Returns the localized value of text 'damagedGoods'.
  String get damagedGoods => _stringOfLocalizedValue('damagedGoods');

  /// Returns the localized value of text 'stockWrittenOff'.
  String get stockWrittenOff => _stringOfLocalizedValue('stockWrittenOff');

  /// Returns the localized value of text 'stocktakingResults'.
  String get stocktakingResults =>
      _stringOfLocalizedValue('stocktakingResults');

  /// Returns the localized value of text 'inventoryRevaluation'.
  String get inventoryRevaluation =>
      _stringOfLocalizedValue('inventoryRevaluation');

  /// Returns the localized value of text 'inventoryAdjustedSuccessfully'.
  String get inventoryAdjustedSuccessfully =>
      _stringOfLocalizedValue('inventoryAdjustedSuccessfully');

  /// Returns the localized value of text 'failedToAdjustInventory'.
  String get failedToAdjustInventory =>
      _stringOfLocalizedValue('failedToAdjustInventory');

  /// The initial stock.
  String get initialStock => _stringOfLocalizedValue('initialStock');

  /// The opening stock per unit text.
  String get openingStockPerUnit =>
      _stringOfLocalizedValue('openingStockPerUnit');

  /// The default purchase price text.
  String get defaultPurchasePrice =>
      _stringOfLocalizedValue('defaultPurchasePrice');

  /// The reorder point.
  String get reorderPoint => _stringOfLocalizedValue('reorderPoint');

  /// Direct access to the internationalization service.
  static AppInternationalizationService get to =>
      GetIt.I<AppInternationalizationService>();

  /// Constructors for internationalization.
  AppInternationalizationService(Locale initialLocale)
    : _locale = initialLocale;

  /// The current locale.
  Locale get locale => _locale;

  /// The supported locales.
  static List<Locale> get supportedLocales => [
    const Locale('en'),
    const Locale('fr'),
  ];

  /// The string for noPrinterConnected.
  String get noPrinterConnected =>
      _stringOfLocalizedValue('noPrinterConnected');

  /// The new screen first message.
  String get newText => _stringOfLocalizedValue('new');

  /// The welcome screen first message.
  String get welcomeScreenFirstMessage =>
      _stringOfLocalizedValue('welcomeScreenFirstMessage');

  /// The welcome screen second message.
  String get welcomeScreenSecondMessage =>
      _stringOfLocalizedValue('welcomeScreenSecondMessage');

  /// The welcome screen third message.
  String get welcomeScreenThirdMessage =>
      _stringOfLocalizedValue('welcomeScreenThirdMessage');

  /// The search cash receipts.
  String get searchCashReceipts =>
      _stringOfLocalizedValue('searchCashReceipts');

  /// The filter.
  String get filter => _stringOfLocalizedValue('filter');

  /// The view and manage inventory and voucher transactions.
  String get viewAndManageInventoryAndVoucherTransactions =>
      _stringOfLocalizedValue('viewAndManageInventoryAndVoucherTransactions');

  /// The audits.
  String get audits => _stringOfLocalizedValue('audits');

  /// The search and filter.
  String get searchAndFilter => _stringOfLocalizedValue('searchAndFilter');

  /// The search transactions.
  String get searchTransactions =>
      _stringOfLocalizedValue('searchTransactions');

  /// The today.
  String get today => _stringOfLocalizedValue('today');

  /// The this week.
  String get thisWeek => _stringOfLocalizedValue('thisWeek');

  /// The this month.
  String get thisMonth => _stringOfLocalizedValue('thisMonth');

  /// The inventory only.
  String get inventoryOnly => _stringOfLocalizedValue('inventoryOnly');

  /// The vouchers only.
  String get vouchersOnly => _stringOfLocalizedValue('vouchersOnly');

  /// The inventory.
  String get inventory => _stringOfLocalizedValue('inventory');

  /// The vouchers.
  String get vouchers => _stringOfLocalizedValue('vouchers');

  /// The export.
  String get export => _stringOfLocalizedValue('export');

  /// The refresh.
  String get refresh => _stringOfLocalizedValue('refresh');

  /// The no inventory transactions found.
  String get noInventoryTransactionsFound =>
      _stringOfLocalizedValue('noInventoryTransactionsFound');

  /// The no voucher transactions found.
  String get noVoucherTransactionsFound =>
      _stringOfLocalizedValue('noVoucherTransactionsFound');

  /// The no transactions match filters.
  String get noTransactionsMatchFilters =>
      _stringOfLocalizedValue('noTransactionsMatchFilters');

  /// The transaction id.
  String get transactionId => _stringOfLocalizedValue('transactionId');

  /// The type.
  String get type => _stringOfLocalizedValue('type');

  /// The amount.
  String get amount => _stringOfLocalizedValue('amount');

  /// The date.
  String get date => _stringOfLocalizedValue('date');

  /// The voucher.
  String get voucher => _stringOfLocalizedValue('voucher');

  /// The purchase.
  String get purchase => _stringOfLocalizedValue('purchase');

  /// The sale.
  String get sale => _stringOfLocalizedValue('sale');

  /// The adjustment.
  String get adjustment => _stringOfLocalizedValue('adjustment');

  /// The refund.
  String get refund => _stringOfLocalizedValue('refund');

  /// The transfer.
  String get transfer => _stringOfLocalizedValue('transfer');

  /// The quantity.
  String get quantity => _stringOfLocalizedValue('quantity');

  /// The document id.
  String get refId => _stringOfLocalizedValue('refId');

  /// The product id.
  String get productId => _stringOfLocalizedValue('productId');

  /// The batch id.
  String get batchId => _stringOfLocalizedValue('batchId');

  /// The voucher id.
  String get voucherId => _stringOfLocalizedValue('voucherId');

  /// The used by.
  String get usedBy => _stringOfLocalizedValue('usedBy');

  /// The export initiated.
  String get exportInitiated => _stringOfLocalizedValue('exportInitiated');

  /// The export failed.
  String get exportFailed => _stringOfLocalizedValue('exportFailed');

  /// The transaction tapped.
  String get transactionTapped => _stringOfLocalizedValue('transactionTapped');

  /// The retry.
  String get retry => _stringOfLocalizedValue('retry');

  /// The error loading cash receipts.
  String get errorLoadingCashReceipts =>
      _stringOfLocalizedValue('errorLoadingCashReceipts');

  /// The no cash receipts found.
  String get noCashReceiptsFound =>
      _stringOfLocalizedValue('noCashReceiptsFound');

  /// The cash receipts will appear here once they are created.
  String get cashReceiptsWillAppearHereOnceTheyAreCreated =>
      _stringOfLocalizedValue('cashReceiptsWillAppearHereOnceTheyAreCreated');

  /// The unit purchase price.
  String get unitPurchasePrice => _stringOfLocalizedValue('unitPurchasePrice');

  /// The create order.
  String get createOrder => _stringOfLocalizedValue('createOrder');

  /// The please select a purchase order.
  String get expectedQuantityMustBeGreaterThanZeroForItem =>
      _stringOfLocalizedValue('expectedQuantityMustBeGreaterThanZeroForItem');

  /// The please select a purchase order.
  String get receivedQuantityCannotBeNegativeForItem =>
      _stringOfLocalizedValue('receivedQuantityCannotBeNegativeForItem');

  /// The please select a purchase order.
  String get purchasePriceMustBeGreaterThanZeroForItem =>
      _stringOfLocalizedValue('purchasePriceMustBeGreaterThanZeroForItem');

  /// The please select a purchase order.
  String get pleaseSelectAPurchaseOrder =>
      _stringOfLocalizedValue('pleaseSelectAPurchaseOrder');

  /// The receiving note created successfully.
  String get receivingNoteCreatedSuccessfully =>
      _stringOfLocalizedValue('receivingNoteCreatedSuccessfully');

  /// The failed to create receiving note.
  String get failedToCreateReceivingNote =>
      _stringOfLocalizedValue('failedToCreateReceivingNote');

  /// The receiving note description.
  String get receivingNoteDescription =>
      _stringOfLocalizedValue('receivingNoteDescription');

  /// The batch.
  String get batch => _stringOfLocalizedValue('batch');

  /// The expected quantity.
  String get expectedQuantity => _stringOfLocalizedValue('expectedQuantity');

  /// The purchase price.
  String get purchasePrice => _stringOfLocalizedValue('purchasePrice');

  /// The received quantity.
  String get receivedQuantity => _stringOfLocalizedValue('receivedQuantity');

  /// The rejected quantity.
  String get rejectedQuantity => _stringOfLocalizedValue('rejectedQuantity');

  /// The add notes about the delivery condition damages etc.
  String get addNotesAboutTheDeliveryConditionDamagesEtc =>
      _stringOfLocalizedValue('addNotesAboutTheDeliveryConditionDamagesEtc');

  /// The createReceivingNote.
  String get createReceivingNote =>
      _stringOfLocalizedValue('createReceivingNote');

  /// The receive date.
  String get receiveDate => _stringOfLocalizedValue('receiveDate');

  /// The select purchase order.
  String get selectPurchaseOrder =>
      _stringOfLocalizedValue('selectPurchaseOrder');

  /// The create at.
  String get createAt => _stringOfLocalizedValue('createAt');

  /// The create receive note.
  String get createReceiveNote => _stringOfLocalizedValue('createReceiveNote');

  /// The purchase order cancelled successfully.
  String get purchaseOrderCancelledSuccessfully =>
      _stringOfLocalizedValue('purchaseOrderCancelledSuccessfully');

  /// The failed to cancel purchase order.
  String get failedToCancelPurchaseOrder =>
      _stringOfLocalizedValue('failedToCancelPurchaseOrder');

  /// The receive purchase order.
  String get receivePurchaseOrder =>
      _stringOfLocalizedValue('receivePurchaseOrder');

  /// The partial.
  String get partial => _stringOfLocalizedValue('partial');

  /// The reason for cancellation.
  String get reasonForCancellation =>
      _stringOfLocalizedValue('reasonForCancellation');

  /// The no keep order.
  String get noKeepOrder => _stringOfLocalizedValue('noKeepOrder');

  /// The yes cancel order.
  String get yesCancelOrder => _stringOfLocalizedValue('yesCancelOrder');

  /// The cancel order confirmation.
  String get cancelOrderConfirmation =>
      _stringOfLocalizedValue('cancelOrderConfirmation');

  /// The cancel purchase order.
  String get cancelPurchaseOrder =>
      _stringOfLocalizedValue('cancelPurchaseOrder');

  /// The purchase orders description.
  String get purchaseOrdersNotFound =>
      _stringOfLocalizedValue('purchaseOrdersNotFound');

  /// The purchase orders description.
  String get purchaseOrdersDescription =>
      _stringOfLocalizedValue('purchaseOrdersDescription');

  /// The purchase order created successfully.
  String get purchaseOrderCreatedSuccessfully =>
      _stringOfLocalizedValue('purchaseOrderCreatedSuccessfully');

  /// The failed to create purchase order.
  String get failedToCreatePurchaseOrder =>
      _stringOfLocalizedValue('failedToCreatePurchaseOrder');

  /// The please add at least one item.
  String get pleaseAddAtLeastOneItem =>
      _stringOfLocalizedValue('pleaseAddAtLeastOneItem');

  /// The please select a product for item.
  String get pleaseSelectAProductForItem =>
      _stringOfLocalizedValue('pleaseSelectAProductForItem');

  /// The quantity must be greater than zero for item.
  String get quantityMustBeGreaterThanZeroForItem =>
      _stringOfLocalizedValue('quantityMustBeGreaterThanZeroForItem');

  /// The amount must be greater than zero for item.
  String get amountMustBeGreaterThanZeroForItem =>
      _stringOfLocalizedValue('amountMustBeGreaterThanZeroForItem');

  /// The create purchase order.
  String get createPurchaseOrder =>
      _stringOfLocalizedValue('createPurchaseOrder');

  /// The total amount.
  String get totalAmount => _stringOfLocalizedValue('totalAmount');

  /// The add special instructions or notes.
  String get addSpecialInstructionsOrNotes =>
      _stringOfLocalizedValue('addSpecialInstructionsOrNotes');

  /// The no products added yet.
  String get noProductsAddedYet =>
      _stringOfLocalizedValue('noProductsAddedYet');

  /// The click add product.
  String get clickAddProduct => _stringOfLocalizedValue('clickAddProduct');

  /// The invalid date.
  String get invalidDate => _stringOfLocalizedValue('invalidDate');

  /// The expected delivery date.
  String get expectedDeliveryDate =>
      _stringOfLocalizedValue('expectedDeliveryDate');

  /// The products list management.
  String get productsListManagement =>
      _stringOfLocalizedValue('productsListManagement');

  /// The sku.
  String get sku => _stringOfLocalizedValue('sku');

  /// The products list.
  String get productsList => _stringOfLocalizedValue('productsList');

  /// The select expiration type.
  String get selectExpirationType =>
      _stringOfLocalizedValue('selectExpirationType');

  /// The expiration type.
  String get expirationType => _stringOfLocalizedValue('expirationType');

  /// The purchase orders.
  String get purchaseOrders => _stringOfLocalizedValue('purchaseOrders');

  /// The purchases section label.
  String get purchases => _stringOfLocalizedValue('purchases');

  /// The purchase receives label.
  String get purchaseReceives => _stringOfLocalizedValue('purchaseReceives');

  /// The bills label.
  String get bills => _stringOfLocalizedValue('bills');

  /// The bill detail label.
  String get billDetail => _stringOfLocalizedValue('billDetail');

  /// Create bill label.
  String get createBill => _stringOfLocalizedValue('createBill');

  /// Generate bill label.
  String get generateBill => _stringOfLocalizedValue('generateBill');

  /// Due date label.
  String get dueDateLabel => _stringOfLocalizedValue('dueDateLabel');

  /// Bill status open label.
  String get billStatusOpen => _stringOfLocalizedValue('billStatusOpen');

  /// Returns the localized value of text 'newPurchaseOrder'.
  String get newPurchaseOrder => _stringOfLocalizedValue('newPurchaseOrder');

  /// Returns the localized value of text 'draft'.
  String get draft => _stringOfLocalizedValue('draft');

  /// Returns the localized value of text 'received'.
  String get received => _stringOfLocalizedValue('received');

  /// Returns the localized value of text 'searchPurchaseOrder'.
  String get searchPurchaseOrder =>
      _stringOfLocalizedValue('searchPurchaseOrder');

  /// Returns the localized value of text 'clickPurchaseOrderToSeeDetails'.
  String get clickPurchaseOrderToSeeDetails =>
      _stringOfLocalizedValue('clickPurchaseOrderToSeeDetails');

  /// Returns the localized value of text 'noPurchaseOrders'.
  String get noPurchaseOrders => _stringOfLocalizedValue('noPurchaseOrders');

  /// Returns the localized value of text 'noResults'.
  String get noResults => _stringOfLocalizedValue('noResults');

  /// Returns the localized value of text 'modifyFilters'.
  String get modifyFilters => _stringOfLocalizedValue('modifyFilters');

  /// Returns the localized value of text 'createFirstPurchaseOrder'.
  String get createFirstPurchaseOrder =>
      _stringOfLocalizedValue('createFirstPurchaseOrder');

  /// Returns the localized value of text 'supplierPlaceholder'.
  String get supplierPlaceholder =>
      _stringOfLocalizedValue('supplierPlaceholder');

  /// Returns the localized value of text 'deliveryAddress'.
  String get deliveryAddress => _stringOfLocalizedValue('deliveryAddress');

  /// Returns the localized value of text 'items'.
  String get items => _stringOfLocalizedValue('items');

  /// Returns the localized value of text 'orderedItems'.
  String get orderedItems => _stringOfLocalizedValue('orderedItems');

  /// Returns the localized value of text 'addItem'.
  String get addItem => _stringOfLocalizedValue('addItem');

  /// Returns the localized value of text 'generate'.
  String get generate => _stringOfLocalizedValue('generate');

  /// Returns the localized value of text 'generateBillQuestion'.
  String get generateBillQuestion =>
      _stringOfLocalizedValue('generateBillQuestion');

  /// Returns the localized value of text 'billWillBeCreated'.
  String get billWillBeCreated => _stringOfLocalizedValue('billWillBeCreated');

  /// Returns the localized value of text 'downloadPDF'.
  String get downloadPDF => _stringOfLocalizedValue('downloadPDF');

  /// Returns the localized value of text 'print'.
  String get print => _stringOfLocalizedValue('print');

  /// Returns the localized value of text 'clone'.
  String get clone => _stringOfLocalizedValue('clone');

  /// Returns the localized value of text 'cancelOrder'.
  String get cancelOrder => _stringOfLocalizedValue('cancelOrder');

  /// Returns the localized value of text 'cancelPurchaseOrderQuestion'.
  String get cancelPurchaseOrderQuestion =>
      _stringOfLocalizedValue('cancelPurchaseOrderQuestion');

  /// Returns the localized value of text 'thisActionIsIrreversible'.
  String get thisActionIsIrreversible =>
      _stringOfLocalizedValue('thisActionIsIrreversible');

  /// Returns the localized value of text 'no'.
  String get no => _stringOfLocalizedValue('no');

  /// Returns the localized value of text 'confirmCancellation'.
  String get confirmCancellation =>
      _stringOfLocalizedValue('confirmCancellation');

  /// Returns the localized value of text 'receive'.
  String get receive => _stringOfLocalizedValue('receive');

  /// Returns the localized value of text 'receivals'.
  String get receivals => _stringOfLocalizedValue('receivals');

  /// Returns the localized value of text 'totalAmountIncludingTax'.
  String get totalAmountIncludingTax =>
      _stringOfLocalizedValue('totalAmountIncludingTax');

  /// Returns the localized value of text 'order'.
  String get order => _stringOfLocalizedValue('order');

  /// Returns the localized value of text 'expectedDelivery'.
  String get expectedDelivery => _stringOfLocalizedValue('expectedDelivery');

  /// Returns the localized value of text 'details'.
  String get details => _stringOfLocalizedValue('details');

  /// Returns the localized value of text 'deliveryTo'.
  String get deliveryTo => _stringOfLocalizedValue('deliveryTo');

  /// Returns the localized value of text 'subtotalHT'.
  String get subtotalHT => _stringOfLocalizedValue('subtotalHT');

  /// Returns the localized value of text 'productHeader'.
  String get productHeader => _stringOfLocalizedValue('productHeader');

  /// Returns the localized value of text 'amountHeader'.
  String get amountHeader => _stringOfLocalizedValue('amountHeader');

  /// Returns the localized value of text 'totalTTC'.
  String get totalTTC => _stringOfLocalizedValue('totalTTC');

  /// Returns the localized value of text 'closedStatus'.
  String get closedStatus => _stringOfLocalizedValue('closedStatus');

  /// Returns the localized value of text 'notSpecifiedStatus'.
  String get notSpecifiedStatus =>
      _stringOfLocalizedValue('notSpecifiedStatus');

  /// Returns the localized value of text 'billTitle'.
  String get billTitle => _stringOfLocalizedValue('billTitle');

  /// Returns the localized value of text 'createdAt'.
  String get createdAt => _stringOfLocalizedValue('createdAt');

  /// Returns the localized value of text 'qty'.
  String get qty => _stringOfLocalizedValue('qty');

  /// Returns the localized value of text 'totalHT'.
  String get totalHT => _stringOfLocalizedValue('totalHT');

  /// Returns the localized value of text 'overdueStatus'.
  String get overdueStatus => _stringOfLocalizedValue('overdueStatus');

  /// Returns the localized value of text 'openStatus'.
  String get openStatus => _stringOfLocalizedValue('openStatus');

  /// Returns the localized value of text 'voidStatus'.
  String get voidStatus => _stringOfLocalizedValue('voidStatus');

  /// Returns the localized value of text 'notesLabel'.
  String get notesLabel => _stringOfLocalizedValue('notesLabel');

  /// Returns the localized value of text 'receivedCount'.
  String get receivedCount => _stringOfLocalizedValue('receivedCount');

  /// Returns the localized value of text 'rejectedCount'.
  String get rejectedCount => _stringOfLocalizedValue('rejectedCount');

  /// Returns the localized value of text 'differences'.
  String get differences => _stringOfLocalizedValue('differences');

  /// Returns the localized value of text 'linkedBills'.
  String get linkedBills => _stringOfLocalizedValue('linkedBills');

  /// Returns the localized value of text 'noBillForPurchaseOrder'.
  String get noBillForPurchaseOrder =>
      _stringOfLocalizedValue('noBillForPurchaseOrder');

  /// Returns the localized value of text 'receivingNotes'.
  String get receivingNotes => _stringOfLocalizedValue('receivingNotes');

  /// Returns the localized value of text 'noReceivingRecorded'.
  String get noReceivingRecorded =>
      _stringOfLocalizedValue('noReceivingRecorded');

  /// Returns the localized value of text 'impossibleToLoadPurchaseOrderData'.
  String get impossibleToLoadPurchaseOrderData =>
      _stringOfLocalizedValue('impossibleToLoadPurchaseOrderData');

  /// Returns the localized value of text 'impossibleToRecordReceiving'.
  String get impossibleToRecordReceiving =>
      _stringOfLocalizedValue('impossibleToRecordReceiving');

  /// Returns the localized value of text 'receivingRecorded'.
  String get receivingRecorded => _stringOfLocalizedValue('receivingRecorded');

  /// Returns the localized value of text 'impossibleToGenerateBill'.
  String get impossibleToGenerateBill =>
      _stringOfLocalizedValue('impossibleToGenerateBill');

  /// Returns the localized value of text 'billGenerated'.
  String get billGenerated => _stringOfLocalizedValue('billGenerated');

  /// Returns the localized value of text 'impossibleToCancelPurchaseOrder'.
  String get impossibleToCancelPurchaseOrder =>
      _stringOfLocalizedValue('impossibleToCancelPurchaseOrder');

  /// Returns the localized value of text 'purchaseOrderCancelled'.
  String get purchaseOrderCancelled =>
      _stringOfLocalizedValue('purchaseOrderCancelled');

  /// Returns the localized value of text 'impossibleToUpdateStatus'.
  String get impossibleToUpdateStatus =>
      _stringOfLocalizedValue('impossibleToUpdateStatus');

  /// Bill status paid label.
  String get billStatusPaid => _stringOfLocalizedValue('billStatusPaid');

  /// Bill status overdue label.
  String get billStatusOverdue => _stringOfLocalizedValue('billStatusOverdue');

  /// No bills found label.
  String get noBillsFound => _stringOfLocalizedValue('noBillsFound');

  /// No receiving notes found label.
  String get noReceivingNotesFound =>
      _stringOfLocalizedValue('noReceivingNotesFound');

  /// Convert to bill label.
  String get convertToBill => _stringOfLocalizedValue('convertToBill');

  /// Receiving note detail label.
  String get receivingNoteDetail =>
      _stringOfLocalizedValue('receivingNoteDetail');

  /// The amount change given.
  String get given => _stringOfLocalizedValue('given');

  /// The amount change given.
  String get changeGivenMustBeLessThan =>
      _stringOfLocalizedValue('changeGivenMustBeLessThan');

  /// The amount change given.
  String get amountChangeGiven => _stringOfLocalizedValue('amountChangeGiven');

  /// The leave empty if you don't want to give change  .
  String get leaveEmptyIfYouDontWantToGiveChange =>
      _stringOfLocalizedValue('leaveEmptyIfYouDontWantToGiveChange');

  /// The enter reference.
  String get insufficientVoucherAmount =>
      _stringOfLocalizedValue('insufficientVoucherAmount');

  /// The enter reference.
  String get enterReference => _stringOfLocalizedValue('enterReference');

  /// The failed to create sale with voucher.
  String get failedToCreateSaleWithVoucher =>
      _stringOfLocalizedValue('failedToCreateSaleWithVoucher');

  /// The failed to complete sale.
  String get failedToCompleteSale =>
      _stringOfLocalizedValue('failedToCompleteSale');

  /// The inventory available.
  String get invalidPriceForProduct =>
      _stringOfLocalizedValue('invalidPriceForProduct');

  /// The inventory available.
  String get invalidQuantityForProduct =>
      _stringOfLocalizedValue('invalidQuantityForProduct');

  /// The inventory available.
  String get productNotIdentifiedInCart =>
      _stringOfLocalizedValue('productNotIdentifiedInCart');

  /// The inventory available.
  String get validCart => _stringOfLocalizedValue('validCart');

  /// The inventory available.
  String get inventoryAvailable =>
      _stringOfLocalizedValue('inventoryAvailable');

  /// The inventory check failed.
  String get inventoryCheckFailed =>
      _stringOfLocalizedValue('inventoryCheckFailed');

  /// The insufficient stock for.
  String get insufficientStockFor =>
      _stringOfLocalizedValue('insufficientStockFor');

  /// The requested.
  String get requested => _stringOfLocalizedValue('requested');

  /// The sale completed successfully.
  String get saleCompletedSuccessfully =>
      _stringOfLocalizedValue('saleCompletedSuccessfully');

  /// The failed to create cash receipt.
  String get failedToCreateCashReceipt =>
      _stringOfLocalizedValue('failedToCreateCashReceipt');

  /// The store not configured.
  String get storeNotConfigured =>
      _stringOfLocalizedValue('storeNotConfigured');

  /// The voucher code.
  String get voucherCode => _stringOfLocalizedValue('voucherCode');

  /// The invalid or expired voucher code.
  String get invalidOrExpiredVoucherCode =>
      _stringOfLocalizedValue('invalidOrExpiredVoucherCode');

  /// The failed to validate voucher.
  String get failedToValidateVoucher =>
      _stringOfLocalizedValue('failedToValidateVoucher');

  /// The clear.
  String get clear => _stringOfLocalizedValue('clear');

  /// The valid voucher.
  String get validVoucher => _stringOfLocalizedValue('validVoucher');

  /// The code.
  String get code => _stringOfLocalizedValue('code');

  /// The available.
  String get available => _stringOfLocalizedValue('available');

  /// The usable amount.
  String get usableAmount => _stringOfLocalizedValue('usableAmount');

  /// The apply voucher.
  String get applyVoucher => _stringOfLocalizedValue('applyVoucher');

  /// The enter voucher code.
  String get enterVoucherCode => _stringOfLocalizedValue('enterVoucherCode');

  /// The validate.
  String get validate => _stringOfLocalizedValue('validate');

  /// The scan or search for products.
  String get scanOrSearchForProducts =>
      _stringOfLocalizedValue('scanOrSearchForProducts');

  /// The partially used.
  String get partiallyUsed => _stringOfLocalizedValue('partiallyUsed');

  /// The fully used.
  String get fullyUsed => _stringOfLocalizedValue('fullyUsed');

  /// The unpaid.
  String get unpaid => _stringOfLocalizedValue('unpaid');

  /// The partially paid.
  String get partiallyPaid => _stringOfLocalizedValue('partiallyPaid');

  /// The overdue.
  String get overdue => _stringOfLocalizedValue('overdue');

  /// The credited.
  String get credited => _stringOfLocalizedValue('credited');

  /// The mobile money.
  String get mobileMoney => _stringOfLocalizedValue('mobileMoney');

  /// The store credit.
  String get storeCredit => _stringOfLocalizedValue('storeCredit');

  /// The pos.
  String get pos => _stringOfLocalizedValue('pos');

  /// The sales orders.
  String get salesOrders => _stringOfLocalizedValue('salesOrders');

  /// The cash receipts.
  String get cashReceipts => _stringOfLocalizedValue('cashReceipts');

  /// The store postal code.
  String get storePostalCode => _stringOfLocalizedValue('storePostalCode');

  /// The [areYouAbleToGiveChange].
  String get areYouAbleToGiveChange =>
      _stringOfLocalizedValue('areYouAbleToGiveChange');

  /// The [selectedPayments].
  String get selectedPayments => _stringOfLocalizedValue('selectedPayments');

  /// The [viewThePaymentSelected].
  String get viewThePaymentSelected =>
      _stringOfLocalizedValue('viewThePaymentSelected');

  /// The [stillOwe].
  String get stillOwe => _stringOfLocalizedValue('stillOwe');

  /// The [statusWillBePendingRefund].
  String get statusWillBePendingRefund =>
      _stringOfLocalizedValue('statusWillBePendingRefund');

  /// The [willGive].
  String get willGive => _stringOfLocalizedValue('willGive');

  /// The [invalidAmount].
  String get invalidAmount => _stringOfLocalizedValue('invalidAmount');

  /// The [invalidOrExpiredVoucher].
  String get invalidOrExpiredVoucher =>
      _stringOfLocalizedValue('invalidOrExpiredVoucher');

  /// The [invalidPaymentAmount].
  String get invalidPaymentAmount =>
      _stringOfLocalizedValue('invalidPaymentAmount');

  /// The [paymentAmountExceedsRemaining].
  String get paymentAmountExceedsRemaining =>
      _stringOfLocalizedValue('paymentAmountExceedsRemaining');

  /// The [amountExceedsRemaining].
  String get amountExceedsRemaining =>
      _stringOfLocalizedValue('amountExceedsRemaining');

  /// The [completePayment].
  String get completePayment => _stringOfLocalizedValue('completePayment');

  /// The [validedThePayment].
  String get validedThePayment => _stringOfLocalizedValue('validedThePayment');

  /// The [selectPaymentMethod].
  String get selectPaymentMethod =>
      _stringOfLocalizedValue('selectPaymentMethod');

  /// The [totalPaid].
  String get totalPaid => _stringOfLocalizedValue('totalPaid');

  /// The [remaining].
  String get remaining => _stringOfLocalizedValue('remaining');

  /// The [amountToBePaidBack].
  String get amountToBePaidBack =>
      _stringOfLocalizedValue('amountToBePaidBack');

  /// The [insufficientCashInRegister].
  String get insufficientCashInRegister =>
      _stringOfLocalizedValue('insufficientCashInRegister');

  /// The [paymentMethods].
  String get paymentMethods => _stringOfLocalizedValue('paymentMethods');

  /// The [referenceId].
  String get referenceId => _stringOfLocalizedValue('referenceId');

  /// The [processPayment].
  String get processPayment => _stringOfLocalizedValue('processPayment');

  /// The [addProductToCart].
  String get addProductToCart => _stringOfLocalizedValue('addProductToCart');

  /// The printer configuration error.
  String get printerConfigurationError =>
      _stringOfLocalizedValue('printerConfigurationError');

  /// The preview.
  String get preview => _stringOfLocalizedValue('preview');

  /// The printer.
  String get theDevice => _stringOfLocalizedValue('theDevice');

  /// The no device selected.
  String get noDeviceSelected => _stringOfLocalizedValue('noDeviceSelected');

  /// The select one or more printer.
  String get printerNotConnected =>
      _stringOfLocalizedValue('printerNotConnected');

  /// The select one or more printer.
  String get selectOnOrMorePrinter =>
      _stringOfLocalizedValue('selectOnOrMorePrinter');

  /// The subtotal.
  String get subtotal => _stringOfLocalizedValue('subtotal');

  /// The total VAT.
  String get totalVat => _stringOfLocalizedValue('totalVat');

  /// The customer tendered amount.
  String get amountReceived => _stringOfLocalizedValue('amountReceived');

  /// The change given.
  String get changeGiven => _stringOfLocalizedValue('changeGiven');

  /// The balance due.
  String get balance => _stringOfLocalizedValue('balance');

  /// The tax.
  String get tax => _stringOfLocalizedValue('tax');

  /// The contacts.
  String get contacts => _stringOfLocalizedValue('contacts');

  /// The tax payer number.
  String get taxPayerNumber => _stringOfLocalizedValue('taxPayerNumber');

  /// The nui.
  String get nui => _stringOfLocalizedValue('nui');

  /// The by Sabitou.
  String get bySabitou => _stringOfLocalizedValue('bySabitou');

  /// The designation.
  String get designation => _stringOfLocalizedValue('designation');

  /// The quantity.
  String get qte => _stringOfLocalizedValue('qte');

  /// The unit price.
  String get prixUnit => _stringOfLocalizedValue('prixUnit');

  /// The discount.
  String get discount => _stringOfLocalizedValue('discount');

  /// The rest to paid.
  String get restToPaid => _stringOfLocalizedValue('restToPaid');

  /// The stop the present invoice at the sum of.
  String get stopThePresentInvoiceAtTheSumOf =>
      _stringOfLocalizedValue('stopThePresentInvoiceAtTheSumOf');

  /// The thank you for your order.
  String get thankYouForYourOrder =>
      _stringOfLocalizedValue('thankYouForYourOrder');

  /// The add invoice.
  String get addInvoice => _stringOfLocalizedValue('addInvoice');

  /// The expiry date.
  String get expiryDate => _stringOfLocalizedValue('expiryDate');

  /// The redeemed at.
  String get redeemedAt => _stringOfLocalizedValue('redeemedAt');

  /// The redeemed by.
  String get redeemedBy => _stringOfLocalizedValue('redeemedBy');

  /// The invoice.
  String get invoice => _stringOfLocalizedValue('invoice');

  /// The vouchers history.
  String get vouchersHistory => _stringOfLocalizedValue('vouchersHistory');

  /// The issued.
  String get issued => _stringOfLocalizedValue('issued');

  /// The redeemed.
  String get redeemed => _stringOfLocalizedValue('redeemed');

  /// The id.
  String get id => _stringOfLocalizedValue('id');

  /// The payment method.
  String get paymentMethod => _stringOfLocalizedValue('paymentMethod');

  /// The invoice status extension.
  String get paid => _stringOfLocalizedValue('paid');

  /// The invoice status extension.
  String get pendingRefund => _stringOfLocalizedValue('pendingRefund');

  /// The invoice status extension.
  String get refunded => _stringOfLocalizedValue('refunded');

  /// The cash.
  String get cash => _stringOfLocalizedValue('cash');

  /// The card.
  String get card => _stringOfLocalizedValue('card');

  /// The orange money.
  String get orangeMoney => _stringOfLocalizedValue('orangeMoney');
  String get mtnMoMo => _stringOfLocalizedValue('mtnMoMo');
  String get creditCard => _stringOfLocalizedValue('creditCard');
  String get balanceDue => _stringOfLocalizedValue('balanceDue');
  String get newPayment => _stringOfLocalizedValue('newPayment');
  String get createPayment => _stringOfLocalizedValue('createPayment');
  String get payments => _stringOfLocalizedValue('payments');
  String get amountExceedsBalanceDue =>
      _stringOfLocalizedValue('amountExceedsBalanceDue');
  String get paymentMade => _stringOfLocalizedValue('paymentMade');

  /// The mtn money.
  String get mtnMoney => _stringOfLocalizedValue('mtnMoney');

  /// The unknown.
  String get unknown => _stringOfLocalizedValue('unknown');

  /// The search bill.
  String get searchBill => _stringOfLocalizedValue('searchBill');

  /// The select bill.
  String get selectBill => _stringOfLocalizedValue('selectBill');

  /// The click bill to see details.
  String get clickBillToSeeDetails =>
      _stringOfLocalizedValue('clickBillToSeeDetails');

  /// The no bill.
  String get noBill => _stringOfLocalizedValue('noBill');

  /// The bills will appear here.
  String get billsWillAppearHere =>
      _stringOfLocalizedValue('billsWillAppearHere');

  /// The new bill.
  String get newBill => _stringOfLocalizedValue('newBill');

  /// The bill creation description.
  String get billCreationDescription =>
      _stringOfLocalizedValue('billCreationDescription');

  /// The close.
  String get close => _stringOfLocalizedValue('close');

  /// The unknown error.
  String get unknownError => _stringOfLocalizedValue('unknownError');

  /// The impossible to create bill.
  String get impossibleToCreateBill =>
      _stringOfLocalizedValue('impossibleToCreateBill');

  /// The impossible to delete bill.
  String get impossibleToDeleteBill =>
      _stringOfLocalizedValue('impossibleToDeleteBill');

  /// The bill with payments cannot be deleted.
  String get billWithPaymentsCannotBeDeleted =>
      _stringOfLocalizedValue('billWithPaymentsCannotBeDeleted');

  /// The impossible to mark as paid.
  String get impossibleToMarkAsPaid =>
      _stringOfLocalizedValue('impossibleToMarkAsPaid');

  /// The impossible to void bill.
  String get impossibleToVoidBill =>
      _stringOfLocalizedValue('impossibleToVoidBill');

  /// The due date.
  String get dueDate => _stringOfLocalizedValue('dueDate');

  /// The TVA.
  String get tva => _stringOfLocalizedValue('tva');

  // Month getters
  /// The jan.
  String get jan => _stringOfLocalizedValue('jan');

  /// The feb.
  String get feb => _stringOfLocalizedValue('feb');

  /// The mar.
  String get mar => _stringOfLocalizedValue('mar');

  /// The apr.
  String get apr => _stringOfLocalizedValue('apr');

  /// The jun.
  String get jun => _stringOfLocalizedValue('jun');

  /// The jul.
  String get jul => _stringOfLocalizedValue('jul');

  /// The aug.
  String get aug => _stringOfLocalizedValue('aug');

  /// The sep.
  String get sep => _stringOfLocalizedValue('sep');

  /// The oct.
  String get oct => _stringOfLocalizedValue('oct');

  /// The nov.
  String get nov => _stringOfLocalizedValue('nov');

  /// The dec.
  String get dec => _stringOfLocalizedValue('dec');

  /// The invoices history.
  String get invoicesHistory => _stringOfLocalizedValue('invoicesHistory');

  /// The invoices management.
  String get invoicesManagement =>
      _stringOfLocalizedValue('invoicesManagement');

  /// The invoices management description.
  String get invoicesManagementDescription =>
      _stringOfLocalizedValue('invoicesManagementDescription');

  /// The product not found.
  String get productNotFound => _stringOfLocalizedValue('productNotFound');

  /// The adjust stock.
  String get adjustStock => _stringOfLocalizedValue('adjustStock');

  /// The invoice created successfully.
  String get invoiceCreatedSuccessfully =>
      _stringOfLocalizedValue('invoiceCreatedSuccessfully');

  /// The stock adjusted successfully.
  String get stockAdjustedSuccessfully =>
      _stringOfLocalizedValue('stockAdjustedSuccessfully');

  /// The quantity must be positive when customer return.
  String get quantityMustBePositiveWhenCustomerReturn =>
      _stringOfLocalizedValue('quantityMustBePositiveWhenCustomerReturn');

  /// The we can adjust the stock to a negative value.
  String get weCannotAdjustTheStockToANegativeValue =>
      _stringOfLocalizedValue('weCannotAdjustTheStockToANegativeValue');

  /// The auto create refund.
  String get autoCreateRefund => _stringOfLocalizedValue('autoCreateRefund');

  /// The adjustment amount description.
  String get adjustmentAmountDescription =>
      _stringOfLocalizedValue('adjustmentAmountDescription');

  /// The reason.
  String get reason => _stringOfLocalizedValue('reason');

  /// The customer return.
  String get isCustomerReturn => _stringOfLocalizedValue('isCustomerReturn');

  /// The adjustment amount.
  String get adjustmentAmount => _stringOfLocalizedValue('adjustmentAmount');

  /// The adjustment stock.
  String get adjustmentStock => _stringOfLocalizedValue('adjustmentStock');

  /// The restock product description.
  String get restockProductDescription =>
      _stringOfLocalizedValue('restockProductDescription');

  /// The stock inbound saved successfully.
  String get stockInboundSavedSuccessfully =>
      _stringOfLocalizedValue('stockInboundSavedSuccessfully');

  /// The failed to create stock inbound.
  String get failedToCreateStockInbound =>
      _stringOfLocalizedValue('failedToCreateStockInbound');

  /// The sale price.
  String get salePrice => _stringOfLocalizedValue('salePrice');

  /// The unit cost.
  String get unitCost => _stringOfLocalizedValue('unitCost');

  /// The select product.
  String get selectProduct => _stringOfLocalizedValue('selectProduct');

  /// The restock.
  String get restock => _stringOfLocalizedValue('restock');

  /// The optional.
  String get optional => _stringOfLocalizedValue('optional');

  /// The product description.
  String get productDescription =>
      _stringOfLocalizedValue('productDescription');

  /// The enter product description.
  String get enterProductDescription =>
      _stringOfLocalizedValue('enterProductDescription');

  /// The costing method description.
  String get costingMethodDoc => _stringOfLocalizedValue('costingMethodDoc');

  /// The costing method description.
  String get costingMethodDescription =>
      _stringOfLocalizedValue('costingMethodDescription');

  /// The fifo.
  String get fifo => _stringOfLocalizedValue('fifo');

  /// The average.
  String get average => _stringOfLocalizedValue('average');

  /// The costing method.
  String get costingMethod => _stringOfLocalizedValue('costingMethod');

  /// The sales reports.
  String get salesReports => _stringOfLocalizedValue('salesReports');

  /// No store selected message.
  String get noStoreSelected => _stringOfLocalizedValue('noStoreSelected');

  /// The code bar.
  String get codeBar => _stringOfLocalizedValue('codeBar');

  /// The units.
  String get units => _stringOfLocalizedValue('units');

  /// The initiated by.
  String get initiatedBy => _stringOfLocalizedValue('initiatedBy');

  /// The transactions history.
  String get transactionsHistory =>
      _stringOfLocalizedValue('transactionsHistory');

  /// The transactions history description.
  String get transactionsHistoryDescription =>
      _stringOfLocalizedValue('transactionsHistoryDescription');

  /// The search for transaction.
  String get searchForTransaction =>
      _stringOfLocalizedValue('searchForTransaction');

  /// The total refunds.
  String get totalRefunds => _stringOfLocalizedValue('totalRefunds');

  /// The net revenue.
  String get netRevenue => _stringOfLocalizedValue('netRevenue');

  /// The pending transactions.
  String get pendingTransactions =>
      _stringOfLocalizedValue('pendingTransactions');

  /// The pdf.
  String get pdf => _stringOfLocalizedValue('pdf');

  /// The excel.
  String get excel => _stringOfLocalizedValue('excel');

  /// The csv.
  String get csv => _stringOfLocalizedValue('csv');

  /// The monthly cash flow.
  String get monthlyCashFlow => _stringOfLocalizedValue('monthlyCashFlow');

  /// The expenses.
  String get expenses => _stringOfLocalizedValue('expenses');

  /// The revenue.
  String get revenue => _stringOfLocalizedValue('revenue');

  /// The revenue and expenses.
  String get revenueAndExpenses =>
      _stringOfLocalizedValue('revenueAndExpenses');

  /// The stock movement.
  String get stockMovement => _stringOfLocalizedValue('stockMovement');

  /// The stock in out movement.
  String get stockInOutMovement =>
      _stringOfLocalizedValue('stockInOutMovement');

  /// The out of stock items.
  String get outOfStockItems => _stringOfLocalizedValue('outOfStockItems');

  /// The total items in stock.
  String get totalItemsInStock => _stringOfLocalizedValue('totalItemsInStock');

  /// The profit.
  String get profit => _stringOfLocalizedValue('profit');

  /// The units sold.
  String get unitsSold => _stringOfLocalizedValue('unitsSold');

  /// The top performing products.
  String get topPerformingProducts =>
      _stringOfLocalizedValue('topPerformingProducts');

  /// The by quantity sold.
  String get byQuantitySold => _stringOfLocalizedValue('byQuantitySold');

  /// The sales by categories.
  String get salesByCategories => _stringOfLocalizedValue('salesByCategories');

  /// The revenue distribution.
  String get revenueDistribution =>
      _stringOfLocalizedValue('revenueDistribution');

  /// The performance overview.
  String get performanceOverview =>
      _stringOfLocalizedValue('performanceOverview');

  /// The sales profile trend.
  String get salesProfileTrend => _stringOfLocalizedValue('salesProfileTrend');

  /// The net profit.
  String get netProfit => _stringOfLocalizedValue('netProfit');

  /// The average order value.
  String get averageOrderValue => _stringOfLocalizedValue('averageOrderValue');

  /// The sales analytics.
  String get salesAnalytics => _stringOfLocalizedValue('salesAnalytics');

  /// The inventory report.
  String get inventoryReport => _stringOfLocalizedValue('inventoryReport');

  /// The product performance.
  String get productPerformance =>
      _stringOfLocalizedValue('productPerformance');

  /// The financial summary.
  String get financialSummary => _stringOfLocalizedValue('financialSummary');

  /// Returns the localized value of text 'reportAndAnalytics'.
  String get reportAndAnalytics =>
      _stringOfLocalizedValue('reportAndAnalytics');

  /// Returns the localized value of text 'reportAndAnalyticsDescription'.
  String get reportAndAnalyticsDescription =>
      _stringOfLocalizedValue('reportAndAnalyticsDescription');

  /// Returns the localized value of text 'transactions'.
  String get transactions => _stringOfLocalizedValue('transactions');

  /// Returns the localized value of text 'transactionsDescription'.
  String get transactionsDescription =>
      _stringOfLocalizedValue('transactionsDescription');

  /// Returns the localized value of text 'addTransaction'.
  String get addTransaction => _stringOfLocalizedValue('addTransaction');

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

  /// Returns the localized value of text 'quickAddCategory'.
  String get quickAddCategory => _stringOfLocalizedValue('quickAddCategory');

  /// Returns the localized value of text 'hideQuickAdd'.
  String get hideQuickAdd => _stringOfLocalizedValue('hideQuickAdd');

  /// Returns the localized value of text 'enterCategoryName'.
  String get enterCategoryName => _stringOfLocalizedValue('enterCategoryName');

  /// Returns the localized value of text 'englishName'.
  String get englishName => _stringOfLocalizedValue('englishName');

  /// Returns the localized value of text 'frenchName'.
  String get frenchName => _stringOfLocalizedValue('frenchName');

  /// Returns the localized value of text 'tryDifferentSearch'.
  String get tryDifferentSearch =>
      _stringOfLocalizedValue('tryDifferentSearch');

  /// Returns the localized value of text 'noCategoriesMatchFilters'.
  String get noCategoriesMatchFilters =>
      _stringOfLocalizedValue('noCategoriesMatchFilters');

  /// Returns the localized value of text 'confirm'.
  String get confirm => _stringOfLocalizedValue('confirm');

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

  /// Returns the localized value of text 'transaction'.
  String get transaction => _stringOfLocalizedValue('transaction');

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

  /// Returns the localized value of text 'members'.
  String get members => _stringOfLocalizedValue('members');

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

  /// Returns the localized value of text 'asCategory'.
  String get asCategory => _stringOfLocalizedValue('asCategory');

  /// Returns the localized value of text 'selectOption'.
  String get selectOption => _stringOfLocalizedValue('selectOption');

  /// Returns the localized value of text 'typeToSearch'.
  String get typeToSearch => _stringOfLocalizedValue('typeToSearch');

  /// Returns the localized value of text 'update'.
  String get update => _stringOfLocalizedValue('update');

  /// Returns the localized value of text 'description'.
  String get description => _stringOfLocalizedValue('description');

  /// Returns the localized value of text 'price'.
  String get price => _stringOfLocalizedValue('price');

  /// Returns the localized value of text 'supplier'.
  String get supplier => _stringOfLocalizedValue('supplier');

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

  // User Management Module Getters
  /// Returns the localized value of teamManagement.
  String get teamManagement => _stringOfLocalizedValue('teamManagement');

  /// Returns the localized value of manageTeamMembersRolesPermissions.
  String get manageTeamMembersRolesPermissions =>
      _stringOfLocalizedValue('manageTeamMembersRolesPermissions');

  /// Returns the localized value of inviteUser.
  String get inviteUser => _stringOfLocalizedValue('inviteUser');

  /// Returns the localized value of inviteNewTeamMember.
  String get inviteNewTeamMember =>
      _stringOfLocalizedValue('inviteNewTeamMember');

  /// Returns the localized value of sendInvitationEmail.
  String get sendInvitationEmail =>
      _stringOfLocalizedValue('sendInvitationEmail');

  /// Returns the localized value of selectPermissions.
  String get selectPermissions => _stringOfLocalizedValue('selectPermissions');

  /// Returns the localized value of choosePermissionsForUser.
  String get choosePermissionsForUser =>
      _stringOfLocalizedValue('choosePermissionsForUser');

  /// Returns the localized value of sendInvitation.
  String get sendInvitation => _stringOfLocalizedValue('sendInvitation');

  /// Returns the localized value of invitationSentSuccessfully.
  String get invitationSentSuccessfully =>
      _stringOfLocalizedValue('invitationSentSuccessfully');

  /// Returns the localized value of errorSendingInvitation.
  String get errorSendingInvitation =>
      _stringOfLocalizedValue('errorSendingInvitation');

  /// Returns the localized value of allStatus.
  String get allStatus => _stringOfLocalizedValue('allStatus');

  /// Returns the localized value of searchTeamMembersByNameEmailStatus.
  String get searchTeamMembersByNameEmailStatus =>
      _stringOfLocalizedValue('searchTeamMembersByNameEmailStatus');

  /// Returns the localized value of totalMembers.
  String get totalMembers => _stringOfLocalizedValue('totalMembers');

  /// Returns the localized value of activeMembers.
  String get activeMembers => _stringOfLocalizedValue('activeMembers');

  /// Returns the localized value of pendingMembers.
  String get pendingMembers => _stringOfLocalizedValue('pendingMembers');

  /// Returns the localized value of bannedMembers.
  String get bannedMembers => _stringOfLocalizedValue('bannedMembers');

  /// Returns the localized value of banned.
  String get banned => _stringOfLocalizedValue('banned');

  /// Returns the localized value of inactiveMembers.
  String get inactiveMembers => _stringOfLocalizedValue('inactiveMembers');

  /// Returns the localized value of teamMembers.
  String get teamMembers => _stringOfLocalizedValue('teamMembers');

  /// Returns the localized value of awaitingResponse.
  String get awaitingResponse => _stringOfLocalizedValue('awaitingResponse');

  /// Returns the localized value of restrictedAccess.
  String get restrictedAccess => _stringOfLocalizedValue('restrictedAccess');

  /// Returns the localized value of temporarilyDisabled.
  String get temporarilyDisabled =>
      _stringOfLocalizedValue('temporarilyDisabled');

  /// Returns the localized value of joined.
  String get joined => _stringOfLocalizedValue('joined');

  /// Returns the localized value of manageAccess.
  String get manageAccess => _stringOfLocalizedValue('manageAccess');

  /// Returns the localized value of noPermissionsAssigned.
  String get noPermissionsAssigned =>
      _stringOfLocalizedValue('noPermissionsAssigned');

  /// Returns the localized value of thisUserHasNoPermissions.
  String get thisUserHasNoPermissions =>
      _stringOfLocalizedValue('thisUserHasNoPermissions');

  /// Returns the localized value of userPermissions.
  String get userPermissions => _stringOfLocalizedValue('userPermissions');

  /// Returns the localized value of manageUserPermissionsAndStatus.
  String get manageUserPermissionsAndStatus =>
      _stringOfLocalizedValue('manageUserPermissionsAndStatus');

  /// Returns the localized value of memberStatus.
  String get memberStatus => _stringOfLocalizedValue('memberStatus');

  /// Returns the localized value of cannotChangeOwnStatus.
  String get cannotChangeOwnStatus =>
      _stringOfLocalizedValue('cannotChangeOwnStatus');

  /// Returns the localized value of changeUserStatus.
  String get changeUserStatus => _stringOfLocalizedValue('changeUserStatus');

  /// Returns the localized value of permissions.
  String get permissions => _stringOfLocalizedValue('permissions');

  /// Returns the localized value of selectWhatUserCanAccess.
  String get selectWhatUserCanAccess =>
      _stringOfLocalizedValue('selectWhatUserCanAccess');

  /// Returns the localized value of permissionsUpdatedSuccessfully.
  String get permissionsUpdatedSuccessfully =>
      _stringOfLocalizedValue('permissionsUpdatedSuccessfully');

  /// Returns the localized value of errorUpdatingPermissions.
  String get errorUpdatingPermissions =>
      _stringOfLocalizedValue('errorUpdatingPermissions');

  /// Returns the localized value of errorUpdatingStatus.
  String get errorUpdatingStatus =>
      _stringOfLocalizedValue('errorUpdatingStatus');

  /// Returns the localized value of deleteUser.
  String get deleteUser => _stringOfLocalizedValue('deleteUser');

  /// Returns the localized value of userWillBeRemovedPermanently.
  String get userWillBeRemovedPermanently =>
      _stringOfLocalizedValue('userWillBeRemovedPermanently');

  /// Returns the localized value of confirmationRequired.
  String get confirmationRequired =>
      _stringOfLocalizedValue('confirmationRequired');

  /// Returns the localized value of typeToConfirmDeletion.
  String get typeToConfirmDeletion =>
      _stringOfLocalizedValue('typeToConfirmDeletion');

  /// Returns the localized value of deletePermanently.
  String get deletePermanently => _stringOfLocalizedValue('deletePermanently');

  /// Returns the localized value of userDeletedSuccessfully.
  String get userDeletedSuccessfully =>
      _stringOfLocalizedValue('userDeletedSuccessfully');

  /// Returns the localized value of errorDuringDeletion.
  String get errorDuringDeletion =>
      _stringOfLocalizedValue('errorDuringDeletion');

  /// Returns the localized value of noTeamMembersYet.
  String get noTeamMembersYet => _stringOfLocalizedValue('noTeamMembersYet');

  /// Returns the localized value of inviteFirstTeamMember.
  String get inviteFirstTeamMember =>
      _stringOfLocalizedValue('inviteFirstTeamMember');

  /// Returns the localized value of noMembersMatchFilters.
  String get noMembersMatchFilters =>
      _stringOfLocalizedValue('noMembersMatchFilters');

  /// Returns the localized value of tryAdjustingFilters.
  String get tryAdjustingFilters =>
      _stringOfLocalizedValue('tryAdjustingFilters');

  /// Returns the localized value of inviteMember.
  String get inviteMember => _stringOfLocalizedValue('inviteMember');

  /// Returns the localized value of clearFilters.
  String get clearFilters => _stringOfLocalizedValue('clearFilters');

  /// Returns the localized value of somethingWentWrong.
  String get somethingWentWrong =>
      _stringOfLocalizedValue('somethingWentWrong');

  /// Returns the localized value of unableToLoadTeamMembers.
  String get unableToLoadTeamMembers =>
      _stringOfLocalizedValue('unableToLoadTeamMembers');

  /// Returns the localized value of tryAgain.
  String get tryAgain => _stringOfLocalizedValue('tryAgain');

  /// Returns the localized value of viewDashboard.
  String get viewDashboard => _stringOfLocalizedValue('viewDashboard');

  /// Returns the localized value of accessOverviewAndMetrics.
  String get accessOverviewAndMetrics =>
      _stringOfLocalizedValue('accessOverviewAndMetrics');

  /// Returns the localized value of analytics.
  String get analytics => _stringOfLocalizedValue('analytics');

  /// Returns the localized value of viewAnalytics.
  String get viewAnalytics => _stringOfLocalizedValue('viewAnalytics');

  /// Returns the localized value of consultAnalyticalData.
  String get consultAnalyticalData =>
      _stringOfLocalizedValue('consultAnalyticalData');

  /// Returns the localized value of viewReports.
  String get viewReports => _stringOfLocalizedValue('viewReports');

  /// Returns the localized value of accessPerformanceReports.
  String get accessPerformanceReports =>
      _stringOfLocalizedValue('accessPerformanceReports');

  /// Returns the localized value of exportReports.
  String get exportReports => _stringOfLocalizedValue('exportReports');

  /// Returns the localized value of downloadAndExportReportData.
  String get downloadAndExportReportData =>
      _stringOfLocalizedValue('downloadAndExportReportData');

  /// Returns the localized value of deleteReports.
  String get deleteReports => _stringOfLocalizedValue('deleteReports');

  /// Returns the localized value of deleteReportData.
  String get deleteReportData => _stringOfLocalizedValue('deleteReportData');

  /// Returns the localized value of orders.
  String get orders => _stringOfLocalizedValue('orders');

  /// Returns the localized value of orderStatistics.
  String get orderStatistics => _stringOfLocalizedValue('orderStatistics');

  /// Returns the localized value of consultMetricsHistoryAnalytics.
  String get consultMetricsHistoryAnalytics =>
      _stringOfLocalizedValue('consultMetricsHistoryAnalytics');

  /// Returns the localized value of addOrders.
  String get addOrders => _stringOfLocalizedValue('addOrders');

  /// Returns the localized value of createNewOrdersRecordSales.
  String get createNewOrdersRecordSales =>
      _stringOfLocalizedValue('createNewOrdersRecordSales');

  /// Returns the localized value of viewOrders.
  String get viewOrders => _stringOfLocalizedValue('viewOrders');

  /// Returns the localized value of cancelDeleteOrdersPermanently.
  String get cancelDeleteOrdersPermanently =>
      _stringOfLocalizedValue('cancelDeleteOrdersPermanently');

  /// Returns the localized value of viewProducts.
  String get viewProducts => _stringOfLocalizedValue('viewProducts');

  /// Returns the localized value of consultInventoryPricesDetails.
  String get consultInventoryPricesDetails =>
      _stringOfLocalizedValue('consultInventoryPricesDetails');

  /// Returns the localized value of addProducts.
  String get addProducts => _stringOfLocalizedValue('addProducts');

  /// Returns the localized value of createNewProductsWithPrices.
  String get createNewProductsWithPrices =>
      _stringOfLocalizedValue('createNewProductsWithPrices');

  /// Returns the localized value of editProducts.
  String get editProducts => _stringOfLocalizedValue('editProducts');

  /// Returns the localized value of deleteProducts.
  String get deleteProducts => _stringOfLocalizedValue('deleteProducts');

  /// Returns the localized value of removeProductsPermanently.
  String get removeProductsPermanently =>
      _stringOfLocalizedValue('removeProductsPermanently');

  /// Returns the localized value of viewSuppliers.
  String get viewSuppliers => _stringOfLocalizedValue('viewSuppliers');

  /// Returns the localized value of consultSupplierListContactInfo.
  String get consultSupplierListContactInfo =>
      _stringOfLocalizedValue('consultSupplierListContactInfo');

  /// Returns the localized value of editSupplierInformation.
  String get editSupplierInformation =>
      _stringOfLocalizedValue('editSupplierInformation');

  /// Returns the localized value of deleteSuppliers.
  String get deleteSuppliers => _stringOfLocalizedValue('deleteSuppliers');

  /// Returns the localized value of inviteNewMembers.
  String get inviteNewMembers => _stringOfLocalizedValue('inviteNewMembers');

  /// Returns the localized value of updateMembersPermissionsAndStatus.
  String get updateMembersPermissionsAndStatus =>
      _stringOfLocalizedValue('updateMembersPermissionsAndStatus');

  /// Returns the localized value of deleteMembers.
  String get deleteMembers => _stringOfLocalizedValue('deleteMembers');

  /// Returns the localized value of selected.
  String get selected => _stringOfLocalizedValue('selected');

  /// Returns the localized value of editOrderDetailsStatus.
  String get editOrderDetailsStatus =>
      _stringOfLocalizedValue('editOrderDetailsStatus');

  /// Returns the localized value of editProductInformationPriceStock.
  String get editProductInformationPriceStock =>
      _stringOfLocalizedValue('editProductInformationPriceStock');

  /// Returns the localized value of unspecified.
  String get unspecified => _stringOfLocalizedValue('unspecified');

  /// Returns the localized value of userInformation.
  String get userInformation => _stringOfLocalizedValue('userInformation');

  /// Returns the localized value of noCategoriesYet.
  String get noCategoriesYet => _stringOfLocalizedValue('noCategoriesYet');

  /// Returns the localized value of categoryWillBeRemovedPermanently.
  String get categoryWillBeRemovedPermanently =>
      _stringOfLocalizedValue('categoryWillBeRemovedPermanently');

  /// Returns the localized value of deleteCategory.
  String get deleteCategory => _stringOfLocalizedValue('deleteCategory');

  // Category module getters
  /// Returns the localized value of categoryNameTooShort.
  String get categoryNameTooShort =>
      _stringOfLocalizedValue('categoryNameTooShort');

  // Category module getters
  /// Returns the localized value of categoryManagement.
  String get categoryManagement =>
      _stringOfLocalizedValue('categoryManagement');

  /// Returns the localized value of manageCategories.
  String get manageCategories => _stringOfLocalizedValue('manageCategories');

  /// Returns the localized value of editCategory.
  String get editCategory => _stringOfLocalizedValue('editCategory');

  /// Returns the localized value of totalCategories.
  String get totalCategories => _stringOfLocalizedValue('totalCategories');

  /// Returns the localized value of activeCategories.
  String get activeCategories => _stringOfLocalizedValue('activeCategories');

  /// Returns the localized value of inactiveCategories.
  String get inactiveCategories =>
      _stringOfLocalizedValue('inactiveCategories');

  /// Returns the localized value of nameText.
  String get nameText => _stringOfLocalizedValue('nameText');

  /// Returns the localized value of typeText.
  String get typeText => _stringOfLocalizedValue('typeText');

  /// Returns the localized value of addFirstCategory.
  String get addFirstCategory => _stringOfLocalizedValue('addFirstCategory');

  /// Returns the localized value of deleteCategoryConfirm.
  String get deleteCategoryConfirm =>
      _stringOfLocalizedValue('deleteCategoryConfirm');

  /// Returns the localized value of categoryDeletedSuccessfully.
  String get categoryDeletedSuccessfully =>
      _stringOfLocalizedValue('categoryDeletedSuccessfully');

  /// Returns the localized value of addNewCategory.
  String get addNewCategory => _stringOfLocalizedValue('addNewCategory');

  /// Returns the localized value of enterDetailsNewCategory.
  String get enterDetailsNewCategory =>
      _stringOfLocalizedValue('enterDetailsNewCategory');

  /// Returns the localized value of updateCategory.
  String get updateCategory => _stringOfLocalizedValue('updateCategory');

  /// Returns the localized value of categoryNameEnglishVersion.
  String get categoryNameEnglishVersion =>
      _stringOfLocalizedValue('categoryNameEnglishVersion');

  /// Returns the localized value of categoryNameFrenchVersion.
  String get categoryNameFrenchVersion =>
      _stringOfLocalizedValue('categoryNameFrenchVersion');

  /// Returns the localized value of categoryNameEnglishVersionRequired.
  String get categoryNameEnglishVersionRequired =>
      _stringOfLocalizedValue('categoryNameEnglishVersionRequired');

  /// Returns the localized value of categoryNameFrenchVersionRequired.
  String get categoryNameFrenchVersionRequired =>
      _stringOfLocalizedValue('categoryNameFrenchVersionRequired');

  /// Returns the localized value of categoryType.
  String get categoryType => _stringOfLocalizedValue('categoryType');

  /// Returns the localized value of selectType.
  String get selectType => _stringOfLocalizedValue('selectType');

  /// Returns the localized value of storeType.
  String get storeType => _stringOfLocalizedValue('storeType');

  /// Returns the localized value of businessType.
  String get businessType => _stringOfLocalizedValue('businessType');

  /// Returns the localized value of productType.
  String get productType => _stringOfLocalizedValue('productType');

  /// Returns the localized value of categoryStatus.
  String get categoryStatus => _stringOfLocalizedValue('categoryStatus');

  /// Returns the localized value of selectStatus.
  String get selectStatus => _stringOfLocalizedValue('selectStatus');

  /// Returns the localized value of activeStatus.
  String get activeStatus => _stringOfLocalizedValue('activeStatus');

  /// Returns the localized value of inactiveStatus.
  String get inactiveStatus => _stringOfLocalizedValue('inactiveStatus');

  /// Returns the localized value of searchCategories.
  String get searchCategories => _stringOfLocalizedValue('searchCategories');

  /// Returns the localized value of filterByStatus.
  String get filterByStatus => _stringOfLocalizedValue('filterByStatus');

  /// Returns the localized value of filterByType.
  String get filterByType => _stringOfLocalizedValue('filterByType');

  /// Returns the localized value of categoryAddedSuccessfully.
  String get categoryAddedSuccessfully =>
      _stringOfLocalizedValue('categoryAddedSuccessfully');

  /// Returns the localized value of categoryUpdatedSuccessfully.
  String get categoryUpdatedSuccessfully =>
      _stringOfLocalizedValue('categoryUpdatedSuccessfully');

  /// Returns the localized value of failedToSaveCategory.
  String get failedToSaveCategory =>
      _stringOfLocalizedValue('failedToSaveCategory');

  /// Returns the localized value of failedToDeleteCategory.
  String get failedToDeleteCategory =>
      _stringOfLocalizedValue('failedToDeleteCategory');

  /// Returns the localized value of allTypes.
  String get allTypes => _stringOfLocalizedValue('allTypes');

  /// Returns the localized value of totalGlobalProducts.
  String get totalGlobalProducts =>
      _stringOfLocalizedValue('totalGlobalProducts');

  /// Returns the localized value of activeGlobalProducts.
  String get activeGlobalProducts =>
      _stringOfLocalizedValue('activeGlobalProducts');

  /// Returns the localized value of inactiveGlobalProducts.
  String get inactiveGlobalProducts =>
      _stringOfLocalizedValue('inactiveGlobalProducts');

  /// Returns the localized value of globalProductsManagement.
  String get globalProductsManagement =>
      _stringOfLocalizedValue('globalProductsManagement');

  /// Returns the localized value of manageGlobalProducts.
  String get manageGlobalProducts =>
      _stringOfLocalizedValue('manageGlobalProducts');

  /// Returns the localized value of searchProducts.
  String get searchProducts => _stringOfLocalizedValue('searchProducts');

  /// Returns the localized value of noProductsMatchFilters.
  String get noProductsMatchFilters =>
      _stringOfLocalizedValue('noProductsMatchFilters');

  /// Returns the localized value of noProductsYet.
  String get noProductsYet => _stringOfLocalizedValue('noProductsYet');

  /// Returns the localized value of addFirstProduct.
  String get addFirstProduct => _stringOfLocalizedValue('addFirstProduct');

  /// Returns the localized value of productWillBeRemovedPermanently.
  String get productWillBeRemovedPermanently =>
      _stringOfLocalizedValue('productWillBeRemovedPermanently');

  /// Returns the localized value of productAddedSuccessfully.
  String get productAddedSuccessfully =>
      _stringOfLocalizedValue('productAddedSuccessfully');

  /// Returns the localized value of productUpdatedSuccessfully.
  String get productUpdatedSuccessfully =>
      _stringOfLocalizedValue('productUpdatedSuccessfully');

  /// Returns the localized value of failedToSaveProduct.
  String get failedToSaveProduct =>
      _stringOfLocalizedValue('failedToSaveProduct');

  /// Returns the localized value of addNewProduct.
  String get addNewProduct => _stringOfLocalizedValue('addNewProduct');

  /// Returns the localized value of enterDetailsNewProduct.
  String get enterDetailsNewProduct =>
      _stringOfLocalizedValue('enterDetailsNewProduct');

  /// Returns the localized value of updateProduct.
  String get updateProduct => _stringOfLocalizedValue('updateProduct');

  /// Returns the localized value of productDeletedSuccessfully.
  String get productDeletedSuccessfully =>
      _stringOfLocalizedValue('productDeletedSuccessfully');

  /// Returns the localized value of productNameEnglishVersion.
  String get productNameEnglishVersion =>
      _stringOfLocalizedValue('productNameEnglishVersion');

  /// Returns the localized value of productNameFrenchVersion.
  String get productNameFrenchVersion =>
      _stringOfLocalizedValue('productNameFrenchVersion');

  /// Returns the localized value of productNameEnglishVersionRequired.
  String get productNameEnglishVersionRequired =>
      _stringOfLocalizedValue('productNameEnglishVersionRequired');

  /// Returns the localized value of productNameFrenchVersionRequired.
  String get productNameFrenchVersionRequired =>
      _stringOfLocalizedValue('productNameFrenchVersionRequired');

  /// Returns the localized value of productDescriptionEnglishVersion.
  String get productDescriptionEnglishVersion =>
      _stringOfLocalizedValue('productDescriptionEnglishVersion');

  /// Returns the localized value of productDescriptionFrenchVersion.
  String get productDescriptionFrenchVersion =>
      _stringOfLocalizedValue('productDescriptionFrenchVersion');

  /// Returns the localized value of productDescriptionEnglishVersionRequired.
  String get productDescriptionEnglishVersionRequired =>
      _stringOfLocalizedValue('productDescriptionEnglishVersionRequired');

  /// Returns the localized value of productDescriptionFrenchVersionRequired.
  String get productDescriptionFrenchVersionRequired =>
      _stringOfLocalizedValue('productDescriptionFrenchVersionRequired');

  /// Returns the localized value of productNameTooShort.
  String get productNameTooShort =>
      _stringOfLocalizedValue('productNameTooShort');

  /// Returns the localized value of productDescriptionTooShort.
  String get productDescriptionTooShort =>
      _stringOfLocalizedValue('productDescriptionTooShort');

  /// Returns the localized value of globalProducts.
  String get globalProducts => _stringOfLocalizedValue('globalProducts');

  /// Returns the localized value of searchSuppliers.
  String get searchSuppliers => _stringOfLocalizedValue('searchSuppliers');

  /// Returns the localized value of noSuppliersMatchFilters.
  String get noSuppliersMatchFilters =>
      _stringOfLocalizedValue('noSuppliersMatchFilters');

  /// Returns the localized value of invoices.
  String get invoices => _stringOfLocalizedValue('invoices');

  /// Returns the localized value of invite.
  String get invite => _stringOfLocalizedValue('invite');

  /// Returns the localized value of read.
  String get read => _stringOfLocalizedValue('read');

  /// Returns the localized value of create.
  String get create => _stringOfLocalizedValue('create');

  /// Returns the localized value of viewInvoices.
  String get viewInvoices => _stringOfLocalizedValue('viewInvoices');

  /// Returns the localized value of createInvoices.
  String get createInvoices => _stringOfLocalizedValue('createInvoices');

  /// Returns the localized value of viewTransactions.
  String get viewTransactions => _stringOfLocalizedValue('viewTransactions');

  /// Returns the localized value of text 'editBill'.
  String get editBill => _stringOfLocalizedValue('editBill');

  /// Returns the localized value of text 'fromPurchaseOrder'.
  String get fromPurchaseOrder => _stringOfLocalizedValue('fromPurchaseOrder');

  /// Returns the localized value of text 'generalInfo'.
  String get generalInfo => _stringOfLocalizedValue('generalInfo');

  /// Returns the localized value of text 'purchaseOrderRef'.
  String get purchaseOrderRef => _stringOfLocalizedValue('purchaseOrderRef');

  /// Returns the localized value of text 'purchaseOrderRefHint'.
  String get purchaseOrderRefHint =>
      _stringOfLocalizedValue('purchaseOrderRefHint');

  /// Returns the localized value of text 'supplierIdHint'.
  String get supplierIdHint => _stringOfLocalizedValue('supplierIdHint');

  /// Returns the localized value of text 'supplierRequired'.
  String get supplierRequired => _stringOfLocalizedValue('supplierRequired');

  /// Returns the localized value of text 'lockedFromPO'.
  String get lockedFromPO => _stringOfLocalizedValue('lockedFromPO');

  /// Returns the localized value of text 'billDate'.
  String get billDate => _stringOfLocalizedValue('billDate');

  /// Returns the localized value of text 'atLeastOneItemRequired'.
  String get atLeastOneItemRequired =>
      _stringOfLocalizedValue('atLeastOneItemRequired');

  /// Returns the localized value of text 'invalidQuantity'.
  String get invalidQuantity => _stringOfLocalizedValue('invalidQuantity');

  /// Returns the localized value of text 'invalidPrice'.
  String get invalidPrice => _stringOfLocalizedValue('invalidPrice');

  /// Returns the localized value of text 'unitPrice'.
  String get unitPrice => _stringOfLocalizedValue('unitPrice');

  /// Returns the localized value of text 'taxAbbr'.
  String get taxAbbr => _stringOfLocalizedValue('taxAbbr');

  /// Returns the localized value of text 'subTotal'.
  String get subTotal => _stringOfLocalizedValue('subTotal');

  /// Returns the localized value of text 'taxTotal'.
  String get taxTotal => _stringOfLocalizedValue('taxTotal');

  /// Returns the localized value of text 'notesHint'.
  String get notesHint => _stringOfLocalizedValue('notesHint');

  /// Returns the localized value of text 'searchProductHint'.
  String get searchProductHint => _stringOfLocalizedValue('searchProductHint');

  /// Returns the localized value of text 'failedToCreateBill'.
  String get failedToCreateBill =>
      _stringOfLocalizedValue('failedToCreateBill');

  /// Returns the localized value of text 'failedToUpdateBill'.
  String get failedToUpdateBill =>
      _stringOfLocalizedValue('failedToUpdateBill');

  /// Returns the localized value of createTransactions.
  String get createTransactions =>
      _stringOfLocalizedValue('createTransactions');

  /// Returns the localized value of editTransactions.
  String get editTransactions => _stringOfLocalizedValue('editTransactions');

  /// Returns the localized value of text 'receptions'.
  String get receptions => _stringOfLocalizedValue('receptions');

  /// Returns the localized value of text 'readOnly'.
  String get readOnly => _stringOfLocalizedValue('readOnly');

  /// Returns the localized value of text 'conformes'.
  String get conformes => _stringOfLocalizedValue('conformes');

  /// Returns the localized value of text 'ecarts'.
  String get ecarts => _stringOfLocalizedValue('ecarts');

  /// Returns the localized value of text 'compliant'.
  String get compliant => _stringOfLocalizedValue('compliant');

  /// Returns the localized value of text 'withIssues'.
  String get withIssues => _stringOfLocalizedValue('withIssues');

  /// Returns the localized value of text 'searchReceivingNoteHint'.
  String get searchReceivingNoteHint =>
      _stringOfLocalizedValue('searchReceivingNoteHint');

  /// Returns the localized value of text 'selectAReceivingNote'.
  String get selectAReceivingNote =>
      _stringOfLocalizedValue('selectAReceivingNote');

  /// Returns the localized value of text 'clickOnReceivingNoteForDetails'.
  String get clickOnReceivingNoteForDetails =>
      _stringOfLocalizedValue('clickOnReceivingNoteForDetails');

  /// Returns the localized value of text 'modifyFiltersForMoreResults'.
  String get modifyFiltersForMoreResults =>
      _stringOfLocalizedValue('modifyFiltersForMoreResults');

  /// Returns the localized value of text 'receivingNotesCreatedFromPos'.
  String get receivingNotesCreatedFromPos =>
      _stringOfLocalizedValue('receivingNotesCreatedFromPos');

  /// Returns the localized value of text 'receivedItems'.
  String get receivedItems => _stringOfLocalizedValue('receivedItems');

  /// Returns the localized value of text 'receivedPlural'.
  String get receivedPlural => _stringOfLocalizedValue('receivedPlural');

  /// Returns the localized value of text 'rejectedPlural'.
  String get rejectedPlural => _stringOfLocalizedValue('rejectedPlural');

  /// Returns the localized value of text 'lines'.
  String get lines => _stringOfLocalizedValue('lines');

  /// Returns the localized value of text 'receptionDate'.
  String get receptionDate => _stringOfLocalizedValue('receptionDate');

  /// Returns the localized value of text 'creationDate'.
  String get creationDate => _stringOfLocalizedValue('creationDate');

  /// Returns the localized value of text 'receivedBy'.
  String get receivedBy => _stringOfLocalizedValue('receivedBy');

  /// Returns the localized value of text 'linkedPurchaseOrder'.
  String get linkedPurchaseOrder =>
      _stringOfLocalizedValue('linkedPurchaseOrder');

  /// Returns the localized value of text 'expirationAbbr'.
  String get expirationAbbr => _stringOfLocalizedValue('expirationAbbr');

  /// Returns the localized value of text 'batchAbbr'.
  String get batchAbbr => _stringOfLocalizedValue('batchAbbr');

  /// Returns the localized value of text 'percentReceived'.
  String get percentReceived => _stringOfLocalizedValue('percentReceived');

  /// Returns the localized value of text 'receivingNoteNotFound'.
  String get receivingNoteNotFound =>
      _stringOfLocalizedValue('receivingNoteNotFound');

  /// Returns the localized value of text 'backToSignIn'.
  String get backToSignIn => _stringOfLocalizedValue('backToSignIn');

  /// Returns the localized value of text 'pleaseSignInAgain'.
  String get pleaseSignInAgain => _stringOfLocalizedValue('pleaseSignInAgain');

  /// Returns the localized value of text 'sessionExpired'.
  String get sessionExpired => _stringOfLocalizedValue('sessionExpired');

  /// Returns the localized value of text 'noUserFound'.
  String get noUserFound => _stringOfLocalizedValue('noUserFound');

  /// Returns the localized value of text 'onboardingType'.
  String get onboardingType => _stringOfLocalizedValue('onboardingType');

  /// Returns the localized value of text 'onboardingTypeDirect'.
  String get onboardingTypeDirect =>
      _stringOfLocalizedValue('onboardingTypeDirect');

  /// Returns the localized value of text 'onboardingTypeInvite'.
  String get onboardingTypeInvite =>
      _stringOfLocalizedValue('onboardingTypeInvite');

  /// Returns the localized value of text 'onboardingTypeDirectDescription'.
  String get onboardingTypeDirectDescription =>
      _stringOfLocalizedValue('onboardingTypeDirectDescription');

  /// Returns the localized value of text 'onboardingTypeInviteDescription'.
  String get onboardingTypeInviteDescription =>
      _stringOfLocalizedValue('onboardingTypeInviteDescription');

  /// Returns the localized value of text 'temporaryPassword'.
  String get temporaryPassword => _stringOfLocalizedValue('temporaryPassword');

  /// Returns the localized value of text 'forcePasswordChangeOnFirstLogin'.
  String get forcePasswordChangeOnFirstLogin =>
      _stringOfLocalizedValue('forcePasswordChangeOnFirstLogin');

  /// Returns the localized value of text 'createUser'.
  String get createUser => _stringOfLocalizedValue('createUser');

  /// Returns the localized value of text 'userCreatedSuccessfully'.
  String get userCreatedSuccessfully =>
      _stringOfLocalizedValue('userCreatedSuccessfully');

  /// Returns the localized value of text 'errorCreatingUser'.
  String get errorCreatingUser => _stringOfLocalizedValue('errorCreatingUser');

  /// Returns the localized value of text 'userAlreadyExists'.
  String get userAlreadyExists => _stringOfLocalizedValue('userAlreadyExists');

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
    final _storage = const FlutterSecureStorage();
    unawaited(_storage.write(key: _key, value: jsonEncode(local)));
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
