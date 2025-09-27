import '../../services/internationalization/internationalization.dart';
import '../utils.dart';

/// Validation form utils
class ValidationFormUtils {
  static final _intl = AppInternationalizationService.to;

  /// Validates the user name field.
  static String? validateUserName([String? value]) {
    final userName = value?.trim() ?? '';
    if (userName.isEmpty) {
      return _intl.userNameRequired;
    }

    return null;
  }

  /// Validates the email field.
  static String? validateEmail([String? value]) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) {
      return _intl.emailRequired;
    }
    if (!AppUtils.isEmail(email)) {
      return _intl.emailInvalid;
    }

    return null;
  }

  /// Validates the email field, email can be empty
  static String? validateEmailV2([String? value]) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) {
      return null;
    }
    if (!AppUtils.isEmail(email)) {
      return _intl.emailInvalid;
    }

    return null;
  }

  /// Validates the phone number field.
  static String? validatePhoneNumber([String? value]) {
    final phoneNumber = value?.trim() ?? '';
    if (phoneNumber.isEmpty) {
      return _intl.phoneNumberRequired;
    }

    // Validate using GetUtils for phone number format.
    if (!AppUtils.isPhoneNumber(phoneNumber)) {
      return _intl.phoneNumberInvalidFormat;
    }

    // Additional validation for Cameroon phone numbers (9 digits starting with 6).
    if (phoneNumber.length != 9 || !phoneNumber.startsWith('6')) {
      return _intl.phoneNumberInvalidCameroon;
    }

    return null;
  }

  /// Validates the first name field.
  static String? validateFirstName([String? value]) {
    final firstName = value?.trim() ?? '';
    if (firstName.isEmpty) {
      return _intl.firstNameRequired;
    }

    return null;
  }

  /// Validates the last name field.
  static String? validateLastName([String? value]) {
    final lastName = value?.trim() ?? '';
    if (lastName.isEmpty) {
      return _intl.lastNameRequired;
    }

    return null;
  }

  /// Validates the password field.
  static String? validatePassword([String? value]) {
    final password = value?.trim() ?? '';
    if (password.isEmpty) {
      return _intl.passwordRequired;
    }
    if (password.length < 6) {
      return _intl.passwordLength;
    }

    return null;
  }

  /// Validates the confirm password field.
  static String? validateConfirmPassword([String? value, String? password]) {
    final confirmPassword = value?.trim() ?? '';
    if (confirmPassword.isEmpty) {
      return _intl.confirmPasswordRequired;
    }
    if (confirmPassword != password) {
      return _intl.passwordsDoNotMatch;
    }

    return null;
  }

  /// Validates the address.
  static String? validateAddress([String? value]) {
    final address = value?.trim() ?? '';
    if (address.isEmpty) {
      return _intl.addressRequired;
    }
    if (address.trim().length < 5) {
      return _intl.addressTooShort;
    }

    return null;
  }

  /// Validates the address.
  static String? validateCompanyName([String? value]) {
    final companyName = value?.trim() ?? '';
    if (companyName.isEmpty) {
      return _intl.companyNameRequired;
    }
    if (companyName.trim().length < 3) {
      return _intl.companyNameTooShort;
    }

    return null;
  }

  /// Validates the category name english version.
  static String? validateCategoryNameEnglishVersion([String? value]) {
    final categoryName = value?.trim() ?? '';
    if (categoryName.isEmpty) {
      return _intl.categoryNameEnglishVersionRequired;
    }
    if (categoryName.trim().length < 3) {
      return _intl.categoryNameTooShort;
    }

    return null;
  }

  /// Validates the category name french version.
  static String? validateCategoryNameFrenchVersion([String? value]) {
    final categoryName = value?.trim() ?? '';
    if (categoryName.isEmpty) {
      return _intl.categoryNameFrenchVersionRequired;
    }
    if (categoryName.trim().length < 3) {
      return _intl.categoryNameTooShort;
    }

    return null;
  }

  /// Validates the product name english version.
  static String? validateProductNameEnglishVersion([String? value]) {
    final productName = value?.trim() ?? '';
    if (productName.isEmpty) {
      return _intl.productNameEnglishVersionRequired;
    }
    if (productName.trim().length < 3) {
      return _intl.productNameTooShort;
    }

    return null;
  }

  /// Validates the product name french version.
  static String? validateProductNameFrenchVersion([String? value]) {
    final productName = value?.trim() ?? '';
    if (productName.isEmpty) {
      return _intl.productNameFrenchVersionRequired;
    }
    if (productName.trim().length < 3) {
      return _intl.productNameTooShort;
    }

    return null;
  }

  /// Validates the product description english version.
  static String? validateProductDescriptionEnglishVersion([String? value]) {
    final productDescription = value?.trim() ?? '';
    if (productDescription.isEmpty) {
      return _intl.productDescriptionEnglishVersionRequired;
    }
    if (productDescription.trim().length < 3) {
      return _intl.productDescriptionTooShort;
    }

    return null;
  }

  /// Validates the product description french version.
  static String? validateProductDescriptionFrenchVersion([String? value]) {
    final productDescription = value?.trim() ?? '';
    if (productDescription.isEmpty) {
      return _intl.productDescriptionFrenchVersionRequired;
    }
    if (productDescription.trim().length < 3) {
      return _intl.productDescriptionTooShort;
    }

    return null;
  }
}
