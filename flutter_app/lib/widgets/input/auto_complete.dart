// ignore_for_file: member-ordering
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../themes/app_colors.dart';
import '../loading.dart';

/// A customizable autocomplete widget that displays a text input and a dropdown
/// of suggestions based on user input, with support for asynchronous option fetching.
class CustomAutoComplete<T> extends StatefulWidget {
  /// The label displayed above the input field.
  final Widget? label;

  /// The placeholder text shown in the input field.
  final String? placeholder;

  /// A callback that fetches selectable options based on the current input.
  final Future<Iterable<T>> Function(TextEditingController) optionsBuilder;

  /// A callback to validate the input text. Returns an error message if invalid, or null if valid.
  final String? Function(String)? inputValidator;

  /// Converts an option to its display string for the input field.
  final String Function(T) displayStringForOption;

  /// Whether the input field is enabled.
  final bool enabled;

  /// Builds the dropdown widget for the selectable options.
  final Widget Function({
    required BuildContext context,
    required void Function(T) onSelected,
    required Iterable<T> options,
  })
  optionsViewBuilder;

  /// The initial value of the input field.
  final String? initialValue;

  /// Constructor for [CustomAutoComplete].
  const CustomAutoComplete({
    super.key,
    this.label,
    this.placeholder,
    required this.optionsBuilder,
    required this.optionsViewBuilder,
    required this.displayStringForOption,
    this.inputValidator,
    this.initialValue,
    this.enabled = true,
  });

  @override
  State<CustomAutoComplete<T>> createState() => _CustomAutoCompleteState<T>();
}

class _CustomAutoCompleteState<T> extends State<CustomAutoComplete<T>> {
  /// The list of available options.
  final ValueNotifier<Iterable<T>> _options = ValueNotifier([]);

  /// Whether the options are being fetched.
  final ValueNotifier<bool> _isLoading = ValueNotifier(false);

  /// The controller for the input field.
  final TextEditingController _inputController = TextEditingController();

  /// The focus node for the input field.
  final FocusNode _focusNode = FocusNode();

  /// The layer link for positioning the dropdown.
  final LayerLink _layerLink = LayerLink();

  /// The overlay entry for the dropdown.
  OverlayEntry? _overlayEntry;

  /// Debounce timer for input changes.
  Timer? _debounce;

  /// Flag to track programmatic text changes.
  bool _isUserInput = true;

  @override
  void initState() {
    super.initState();
    _inputController.text = widget.initialValue ?? '';
    _inputController.addListener(_onControllerChanged);
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void didUpdateWidget(CustomAutoComplete<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue) {
      _isUserInput = false;
      _inputController.text = widget.initialValue ?? '';
      _isUserInput = true;
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _inputController.removeListener(_onControllerChanged);
    _focusNode.removeListener(_onFocusChanged);
    _hideOverlayEntry();
    _options.dispose();
    _isLoading.dispose();
    super.dispose();
  }

  /// Fetches options based on the current input with error handling.
  Future<void> _fetchOptions() async {
    if (!mounted) return;

    _isLoading.value = true;
    try {
      final result = await widget.optionsBuilder(_inputController);
      if (!mounted) return;
      _options.value = result;

      if (result.isNotEmpty && _focusNode.hasFocus) {
        _showOverlay();
      } else {
        _hideOverlayEntry();
      }
    } on Exception catch (e) {
      if (!mounted) return;
      _options.value = [];
      _hideOverlayEntry();
    } finally {
      if (mounted) {
        _isLoading.value = false;
      }
    }
  }

  /// Handles changes to the input controller with debouncing.
  void _onControllerChanged() {
    if (!_isUserInput || _inputController.text.isEmpty) return;

    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), _fetchOptions);
  }

  /// Handles focus changes to show/hide the dropdown.
  void _onFocusChanged() {
    if (_focusNode.hasFocus && _options.value.isNotEmpty) {
      _showOverlay();
    }
  }

  /// Hides the dropdown overlay.
  void _hideOverlayEntry() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  /// Shows the dropdown overlay with the suggestions.
  void _showOverlay() {
    _hideOverlayEntry();

    final overlayState = Overlay.of(context);
    if (!mounted) return;

    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: const Offset(0.0, 65),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.sizeOf(context).height * 0.4,
            ),
            child: Material(
              color: AppColors.grey0,
              elevation: 5,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ShadDecorator(
                decoration: ShadTheme.of(context).inputTheme.decoration,
                child: widget.optionsViewBuilder(
                  context: context,
                  onSelected: (value) {
                    _isUserInput = false;
                    _inputController.text = widget.displayStringForOption(
                      value,
                    );
                    _isUserInput = true;
                    _hideOverlayEntry();
                    _focusNode.unfocus();
                  },
                  options: _options.value,
                ),
              ),
            ),
          ),
        ),
      ),
    );
    _overlayEntry = overlayEntry;
    overlayState.insert(overlayEntry);
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: ValueListenableBuilder<bool>(
        valueListenable: _isLoading,
        builder: (context, isLoading, _) {
          return ShadInputFormField(
            id: widget.label.toString(),
            label: widget.label,
            placeholder: Text(widget.placeholder ?? ''),
            controller: _inputController,
            focusNode: _focusNode,
            validator: widget.inputValidator,
            enabled: widget.enabled,
            trailing: isLoading
                ? Loading.button(
                    color: ShadTheme.of(context).colorScheme.primary,
                  )
                : null,
          );
        },
      ),
    );
  }
}
