import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/app_colors.dart';

/// The loading button state.
enum LoadingButtonState {
  /// The initial state.
  loading,

  /// The initial state.
  initialStatus,

  /// The success state.
  successStatus,

  /// The failed state.
  failedStatus,
}

/// A loading button.
final class LoadingButtonWAtom extends GetView<LoadingButtonController> {
  /// Constructs a loading button.
  LoadingButtonWAtom({
    super.key,
    required this.onSubmit,
    this.buttonColor,
    required this.label,
    this.textStyle,
    this.successColor,
    this.failedColor,
    this.failedText,
    this.successText,
    this.animationDuration = 600,
    this.initialWidth = 170,
  }) {
    Get.put(LoadingButtonController());
  }

  /// On submit callback function.
  final Function(LoadingButtonController buttonController) onSubmit;

  /// The initial button color.
  final Color? buttonColor;

  /// The success color.
  final Color? successColor;

  /// The failed color.
  final Color? failedColor;

  /// The animation duration.
  final int animationDuration;

  /// The text to show.
  final String label;

  /// The failed text style.
  final String? failedText;

  /// The success text.
  final String? successText;

  /// The text style.
  final TextStyle? textStyle;

  /// The initial width.
  final double initialWidth;

  @override
  Widget build(BuildContext context) {
    return Obx(
      (() {
        Color? color = buttonColor;
        String text = label;

        if (controller.state.value == LoadingButtonState.successStatus) {
          color = successColor ?? buttonColor;
          text = successText ?? label;
        }
        if (controller.state.value == LoadingButtonState.failedStatus) {
          color = failedColor ?? buttonColor;
          text = failedText ?? label;
        }

        return InkWell(
          onTap: () => onSubmit(controller),
          child: AnimatedContainer(
            duration: Duration(milliseconds: animationDuration),
            width: controller.state.value == LoadingButtonState.loading
                ? 50
                : initialWidth,
            height: 50,
            padding: controller.state.value == LoadingButtonState.loading
                ? const EdgeInsets.all(5)
                : const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  controller.state.value == LoadingButtonState.loading
                      ? 60
                      : 10,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.grey400.withAlpha(0x1F),
                  offset: const Offset(5, 8),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Center(
              child: controller.state.value == LoadingButtonState.loading
                  ? const CircularProgressIndicator(
                      color: AppColors.grey0,
                    )
                  : Text(
                      text,
                      style: textStyle,
                    ),
            ),
          ),
        );
      }),
    );
  }
}

/// The loading button controller.
class LoadingButtonController extends GetxController {
  /// The state of the button.
  final Rx<LoadingButtonState> state = LoadingButtonState.initialStatus.obs;

  /// Sets the loading state.
  void setLoading() => state.value = LoadingButtonState.loading;

  /// Sets the initial state.
  void setInitial() => state.value = LoadingButtonState.initialStatus;

  /// Sets the success state.
  void setSuccess() => state.value = LoadingButtonState.successStatus;

  /// Sets the failed state.
  void setFailed() => state.value = LoadingButtonState.failedStatus;
}
