import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// A reusable input field component with icon and error handling
class InputField extends StatelessWidget {
  /// Creates an input field
  const InputField({
    super.key,
    required this.controller,
    required this.placeholder,
    required this.icon,
    this.error,
    this.keyboardType,
    this.inputFormatters,
  });

  /// Controller for the input field text editing
  final TextEditingController controller;

  /// Placeholder text to display when field is empty
  final String placeholder;

  /// Icon to display in the trailing position
  final IconData icon;

  /// Optional error message to display below the field
  final String? error;

  /// Keyboard type for text input (defaults to TextInputType.text)
  final TextInputType? keyboardType;

  /// Input formatters to apply to the text input
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShadInputFormField(
          controller: controller,
          placeholder: Text(placeholder),
          trailing: Icon(icon),
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
        ),
        if (error?.isNotEmpty ?? false) ErrorText(error: error),
      ],
    );
  }
}

/// A reusable password field component with visibility toggle
class PasswordField extends StatelessWidget {
  /// Creates a password field
  const PasswordField({
    super.key,
    required this.controller,
    required this.placeholder,
    required this.isVisible,
    required this.onToggle,
    required this.error,
  });

  /// Controller for the password field text editing
  final TextEditingController controller;

  /// Placeholder text to display when field is empty
  final String placeholder;

  /// Whether the password text is currently visible
  final bool isVisible;

  /// Callback function to toggle password visibility
  final VoidCallback onToggle;

  /// Optional error message to display below the field
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShadInputFormField(
          controller: controller,
          placeholder: Text(placeholder),
          obscureText: !isVisible,
          trailing: GestureDetector(
            onTap: onToggle,
            child: Icon(isVisible ? LucideIcons.eye400 : LucideIcons.eyeOff400),
          ),
        ),
        if (error?.isNotEmpty ?? false) ErrorText(error: error),
      ],
    );
  }
}

/// A reusable error text widget that follows the app theme
class ErrorText extends StatelessWidget {
  /// Creates an error text widget
  const ErrorText({super.key, required this.error});

  /// The error to display.
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Builder(
          builder: (context) {
            final theme = ShadTheme.of(context);

            return Text(
              error ?? '',
              style: theme.textTheme.p.copyWith(
                color: theme.colorScheme.destructive,
                fontSize: 12,
              ),
            );
          },
        ),
      ),
    );
  }
}
