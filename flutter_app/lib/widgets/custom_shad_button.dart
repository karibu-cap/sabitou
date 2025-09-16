import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../utils/button_state.dart';
import 'loading.dart';

/// The custom button widget.
final class CustomShadButton extends StatelessWidget {
  /// The button text.
  final String text;

  /// The button onPressed callback.
  final Future<void> Function()? onPressed;

  /// The button enabled state.
  final bool enabled;

  /// The button type.
  final ShadButtonVariant buttonType;

  /// The button expands state.
  final bool expands;

  /// The button state.
  final ValueNotifier<ButtonState> buttonState = ValueNotifier(
    ButtonState.initial,
  );

  /// The button leading icon.
  final Widget? leading;

  /// Constructor of new [CustomShadButton].
  CustomShadButton({
    required this.text,
    this.onPressed,
    this.enabled = true,
    this.buttonType = ShadButtonVariant.primary,
    this.expands = false,
    this.leading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: buttonState,
      builder: (context, value, child) {
        return ShadButton.raw(
          onPressed: buttonState.value == ButtonState.loading
              ? null
              : () async {
                  buttonState.value = ButtonState.loading;
                  await onPressed?.call();
                  buttonState.value = ButtonState.initial;
                },
          enabled: enabled && buttonState.value != ButtonState.loading,
          variant: buttonType,
          expands: expands,
          child: Text(text),
          leading: leading,
          trailing: buttonState.value == ButtonState.loading
              ? const Loading.button()
              : null,
        );
      },
    );
  }
}
