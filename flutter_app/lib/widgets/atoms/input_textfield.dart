import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/app_theme_service.dart';
import '../../themes/app_colors.dart';

/// The input textfield.
final class InputWAtom extends StatelessWidget {
  /// The input validator.
  final String? Function(String?)? validator;

  /// The input validator.
  final String? Function(String?)? onChanged;

  /// The input initial value.
  final String? initialValue;

  /// Whether the input should be obscured.
  final bool obscureText;

  /// The input label text.
  final String labelText;

  /// Constructor of new [InputWAtom].
  const InputWAtom({
    super.key,
    required this.labelText,
    this.validator,
    this.initialValue,
    this.onChanged,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final addHiddenTextIcon = obscureText;
    final RxBool rxObscureText = obscureText.obs;

    return Obx(
      () => TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          floatingLabelStyle: TextStyle(
            color: theme.primaryColor,
          ),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(
              color: theme.primaryColor,
              width: 2.0,
            ),
          ),
          suffixIcon: switch (addHiddenTextIcon) {
            true => IconButton(
                icon: Icon(
                  rxObscureText.value ? Icons.visibility_off : Icons.visibility,
                  color: AppThemeService.to.isDarkMode
                      ? AppColors.darkBorder
                      : AppColors.lightBorder,
                ),
                onPressed: () => rxObscureText.value = !rxObscureText.value,
              ),
            _ => null,
          },
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(
              color: theme.primaryColor,
              width: 2.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(
              color: AppThemeService.to.isDarkMode
                  ? AppColors.darkBorder
                  : AppColors.lightBorder,
            ),
          ),
        ),
        cursorColor: Colors.blueAccent,
        validator: validator,
        initialValue: initialValue,
        obscureText: rxObscureText.value,
        onChanged: onChanged,
      ),
    );
  }
}
