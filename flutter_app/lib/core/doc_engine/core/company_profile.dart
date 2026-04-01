import 'dart:typed_data';

/// Branding & legal info derived from a [Store].
/// Pass this into any [DocumentTemplate] for consistent headers/footers.
class CompanyProfile {
  /// Store display name.
  final String name;

  /// Physical address (street, city, region).
  final String? address;

  /// Contact phone number.
  final String? phone;

  /// Contact email.
  final String? email;

  /// Tax payer identifier (NUI).
  final String? taxPayerNumber;

  /// Unique Identification Number.
  final String? nui;

  /// Postal box.
  final String? postalBox;

  /// ISO 4217 currency code (e.g. "XAF").
  final String currency;

  /// Tax rate as a decimal (e.g. 0.1925 for 19.25%).
  final double taxRate;

  /// Raw bytes of the store logo image (PNG/JPEG).
  final Uint8List? logoBytes;

  const CompanyProfile({
    required this.name,
    required this.currency,
    this.address,
    this.phone,
    this.email,
    this.taxPayerNumber,
    this.nui,
    this.postalBox,
    this.taxRate = 0.1925, // Cameroonian default TVA
    this.logoBytes,
  });

  /// Convenience factory from a proto-like Store map.
  /// Use this in your ViewModel when you have the Store object loaded.
  factory CompanyProfile.fromStore({
    required String name,
    required String currency,
    String? street,
    String? city,
    String? region,
    String? phone,
    String? email,
    String? taxPayerNumber,
    String? nui,
    String? postalBox,
    double taxRate = 0.1925,
    Uint8List? logoBytes,
  }) {
    final addressParts = [street, city, region].whereType<String>();
    return CompanyProfile(
      name: name,
      currency: currency,
      address: addressParts.isNotEmpty ? addressParts.join(', ') : null,
      phone: phone,
      email: email,
      taxPayerNumber: taxPayerNumber,
      nui: nui,
      postalBox: postalBox,
      taxRate: taxRate,
      logoBytes: logoBytes,
    );
  }
}
