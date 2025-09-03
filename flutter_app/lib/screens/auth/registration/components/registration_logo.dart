import 'package:flutter/material.dart';

/// Widget for registration logo/icon
class RegistrationLogo extends StatelessWidget {
  /// Constructs a [RegistrationLogo] widget
  const RegistrationLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF10B981),
            Color(0xFF059669),
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: const Icon(
        Icons.person_add_alt_1,
        size: 40,
        color: Colors.white,
      ),
    );
  }
}
