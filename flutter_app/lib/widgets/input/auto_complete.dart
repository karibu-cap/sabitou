import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../services/internationalization/internationalization.dart';

/// A customizable autocomplete widget using ShadSelectFormField with search functionality.
/// This is an improved version that uses the built-in shadcn select component.
class AutoComplete<T> extends StatefulWidget {
  /// The label displayed above the input field.
  final Widget? label;

  /// The placeholder text shown in the input field.
  final String? placeholder;

  /// A callback that fetches selectable options based on the current input.
  final Future<List<T>> Function(String) optionsBuilder;

  /// A callback to validate the selected option. Returns an error message if invalid, or null if valid.
  final String? Function(T?)? validator;

  /// Converts an option to its display string for the input field.
  final String Function(T) displayStringForOption;

  /// Custom option display.
  final Widget Function(T)? optionViewBuilder;

  /// Whether the input field is enabled.
  final bool enabled;

  /// The initial value of the input field.
  final String? initialValue;

  /// Custom onSelected callback that receives the selected option.
  final void Function(T)? onSelected;

  /// Whether to set the input text to the display string when an option is selected.
  final bool setTextOnSelection;

  /// A trailing widget to display in the input field.
  final Widget? trailing;

  /// A leading widget to display in the input field.
  final Widget? leading;

  /// Callback when the input text changes.
  final void Function(String)? onChanged;

  /// The search placeholder text.
  final String? searchPlaceholder;

  /// Minimum width for the select dropdown.
  final double? minWidth;

  /// Maximum width for the select dropdown.
  final double? maxWidth;

  /// Can return info when empty.
  final bool canReturnDataWhenEmpty;

  /// Constructor for [AutoComplete].
  const AutoComplete({
    super.key,
    this.label,
    this.placeholder,
    required this.optionsBuilder,
    required this.displayStringForOption,
    this.validator,
    this.initialValue,
    this.enabled = true,
    this.onSelected,
    this.setTextOnSelection = true,
    this.trailing,
    this.leading,
    this.onChanged,
    this.searchPlaceholder,
    this.minWidth,
    this.maxWidth,
    this.optionViewBuilder,
    this.canReturnDataWhenEmpty = false,
  });

  @override
  State<AutoComplete<T>> createState() => _AutoCompleteState<T>();
}

class _AutoCompleteState<T> extends State<AutoComplete<T>> {
  /// The controller for the search input.
  final TextEditingController _searchController = TextEditingController();

  /// The currently selected value.
  T? _selectedValue;

  /// Tracks the current fetch operation to prevent async race conditions.
  int _fetchId = 0;

  @override
  void initState() {
    super.initState();
    _searchController.text = widget.initialValue ?? '';
    _searchController.addListener(_onSearchChanged);
  }

  /// Handles changes to the search input.
  void _onSearchChanged() {
    widget.onChanged?.call(_searchController.text);
  }

  Future<List<T>> _fetchOptions(String searchText) async {
    if (searchText.isEmpty && !widget.canReturnDataWhenEmpty) {
      return [];
    }

    final currentFetchId = ++_fetchId;
    try {
      final result = await widget.optionsBuilder(searchText);
      if (_fetchId == currentFetchId) {
        return result;
      }
    } catch (e) {
      return [];
    }

    return [];
  }

  /// Handles when an option is selected.
  void _onOptionSelected(T value) {
    setState(() {
      _selectedValue = value;
    });

    if (widget.setTextOnSelection) {
      _searchController.text = widget.displayStringForOption(value);
    }

    widget.onSelected?.call(value);
  }

  @override
  void didUpdateWidget(AutoComplete<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue) {
      _searchController.text = widget.initialValue ?? '';
    }
  }

  @override
  void dispose() {
    _searchController
      ..removeListener(_onSearchChanged)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            if (widget.label != null) ...[
              widget.label ?? const SizedBox(),
              const SizedBox(height: 8),
            ],
            ValueListenableBuilder(
              valueListenable: _searchController,
              builder: (context, searchValue, child) {
                return FutureBuilder<List<T>>(
                  future: _fetchOptions(searchValue.text),
                  builder: (context, asyncSnapshot) {
                    return ShadSelectFormField<T>.withSearch(
                      minWidth: widget.minWidth ?? constraints.maxWidth,
                      maxWidth: widget.maxWidth,
                      trailing: widget.trailing,
                      search: widget.leading,
                      placeholder: Text(widget.placeholder ?? 'Select option'),
                      onSearchChanged: (value) =>
                          _searchController.text = value,
                      searchPlaceholder: Text(
                        widget.searchPlaceholder ?? Intls.to.searchAndFilter,
                      ),
                      initialValue: _selectedValue,
                      onChanged: (value) {
                        if (value != null) {
                          _onOptionSelected(value);
                        }
                      },
                      options: [
                        if (searchValue.text.isNotEmpty &&
                            (asyncSnapshot.data?.isEmpty ?? true))
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: Text(Intls.to.noDataFound),
                          ),
                        ...?asyncSnapshot.data?.map((option) {
                          return Offstage(
                            offstage:
                                !(asyncSnapshot.data?.contains(option) ??
                                    false),
                            child: ShadOption(
                              value: option,
                              child:
                                  widget.optionViewBuilder?.call(option) ??
                                  Text(widget.displayStringForOption(option)),
                            ),
                          );
                        }),
                      ],
                      selectedOptionBuilder: (context, value) =>
                          Text(widget.displayStringForOption(value)),
                      validator: widget.validator,
                      enabled: widget.enabled,
                    );
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}
