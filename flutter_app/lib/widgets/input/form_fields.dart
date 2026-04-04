import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// A reusable input field component with icon and error handling
class InputField extends StatelessWidget {
  /// Creates an input field
  const InputField({
    super.key,
    this.controller,
    required this.placeholder,
    this.icon,
    this.label,
    this.description,
    this.keyboardType,
    this.inputFormatters,
    this.id,
    this.validator,
    this.maxLines,
    this.initialValue,
    this.onChanged,
  });

  /// Controller for the input field text editing.
  final TextEditingController? controller;

  /// Placeholder text to display when field is empty.
  final String placeholder;

  /// Label text to display above the field.
  final String? label;

  /// The max lines.
  final int? maxLines;

  /// Description text to display below the field.
  final String? description;

  /// Icon to display in the trailing position.
  final IconData? icon;

  /// Keyboard type for text input (defaults to TextInputType.text).
  final TextInputType? keyboardType;

  /// Input formatters to apply to the text input.
  final List<TextInputFormatter>? inputFormatters;

  /// Optional ID for the input field (used for accessibility/testing).
  final String? id;

  /// Optional validator function for the input field.
  final FormFieldValidator<String>? validator;

  /// Initial value for the input field.
  final String? initialValue;

  /// Callback when the input text changes.
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final style = theme.textTheme.h4;
    final stylePlaceholder = theme.textTheme.muted;

    return ShadInputFormField(
      controller: controller,
      initialValue: initialValue,
      placeholder: Text(placeholder, style: stylePlaceholder),
      trailing: Icon(icon, color: theme.colorScheme.primary, size: 16),
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      id: id,
      validator: validator,
      onChanged: onChanged,
      description: description != null
          ? Text(description ?? '', style: style)
          : null,
      label: label != null ? Text(label ?? '', style: style) : null,
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
    this.id,
    this.validator,
    this.label,
    this.description,
  });

  /// Controller for the password field text editing
  final TextEditingController controller;

  /// Placeholder text to display when field is empty
  final String placeholder;

  /// Whether the password text is currently visible
  final ValueNotifier<bool> isVisible;

  /// Callback function to toggle password visibility
  final VoidCallback onToggle;

  /// Optional ID for the input field (used for accessibility/testing)
  final String? id;

  /// Optional validator function for the input field
  final FormFieldValidator<String>? validator;

  /// Label text to display above the field
  final String? label;

  /// Description text to display below the field
  final String? description;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: isVisible,
      builder: (context, child) => ShadInputFormField(
        controller: controller,
        placeholder: Text(placeholder),
        obscureText: !isVisible.value,
        leading: const Icon(LucideIcons.lock, size: 16),
        trailing: GestureDetector(
          onTap: onToggle,
          child: Icon(
            isVisible.value ? LucideIcons.eye400 : LucideIcons.eyeOff400,
            size: 16,
          ),
        ),
        id: id,
        validator: validator,
        description: description != null
            ? Text(
                description ?? '',
                style: Theme.of(context).textTheme.bodySmall,
              )
            : null,
        label: label != null
            ? Text(label ?? '', style: ShadTheme.of(context).textTheme.h4)
            : null,
      ),
    );
  }
}
