import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../services/internationalization/internationalization.dart';
import '../../themes/app_theme.dart';

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
  final T? initialValue;

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

  /// Whether to only perform the search when the user types a query.
  final bool onlyPerformTheSearch;

  /// Whether to allow multiple selection.
  final bool multiSelect;

  /// Currently selected values for multi-select mode.
  final List<T> selectedValues;

  /// Callback when selection changes in multi-select mode.
  final void Function(List<T>)? onMultiSelectChanged;

  /// Callback when search returns no results. Provides the search text and a callback to add it.
  final void Function(String, VoidCallback)? onNotFound;

  /// Label for the add button when not found.
  final String? addButtonLabel;

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
    this.onlyPerformTheSearch = false,
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
    this.multiSelect = false,
    this.selectedValues = const [],
    this.onMultiSelectChanged,
    this.onNotFound,
    this.addButtonLabel,
  });

  @override
  State<AutoComplete<T>> createState() => _AutoCompleteState<T>();
}

class _AutoCompleteState<T> extends State<AutoComplete<T>> {
  /// The controller for the search input.
  final TextEditingController _searchController = TextEditingController();

  /// The currently selected value for single select.
  T? _selectedValue;

  /// Currently selected values for multi-select.
  final List<T> _selectedValues = [];

  /// Tracks the current fetch operation to prevent async race conditions.
  int _fetchId = 0;

  @override
  void initState() {
    super.initState();
    _searchController.text = '';
    _searchController.addListener(_onSearchChanged);
    _selectedValues.addAll(widget.selectedValues);
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

  /// Handles when an option is selected (single select).
  void _onOptionSelected(T value) {
    if (widget.onlyPerformTheSearch) {
      return;
    }

    setState(() {
      _selectedValue = value;
    });

    if (widget.setTextOnSelection) {
      _searchController.text = widget.displayStringForOption(value);
    }

    widget.onSelected?.call(value);
  }

  /// Handles when an option is toggled (multi-select).
  void _onOptionToggled(T value) {
    setState(() {
      if (_selectedValues.contains(value)) {
        _selectedValues.remove(value);
      } else {
        _selectedValues.add(value);
      }
    });
    widget.onMultiSelectChanged?.call(List.unmodifiable(_selectedValues));
  }

  /// Checks if a value is selected (for multi-select).
  bool _isSelected(T value) {
    return _selectedValues.contains(value);
  }

  /// Handles adding the not-found item.
  void _handleAddNotFound() {
    widget.onNotFound?.call(_searchController.text, _searchController.clear);
  }

  @override
  void didUpdateWidget(AutoComplete<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue) {
      _searchController.text = '';
    }
    if (widget.selectedValues != oldWidget.selectedValues) {
      _selectedValues
        ..clear()
        ..addAll(widget.selectedValues);
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
    final intl = AppInternationalizationService.to;
    final theme = ShadTheme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.label != null) ...[
              widget.label ?? const SizedBox(),
              const SizedBox(height: 8),
            ],

            // Multi-select chips display
            if (widget.multiSelect && _selectedValues.isNotEmpty) ...[
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _selectedValues
                    .map(
                      (v) => Chip(
                        label: Text(widget.displayStringForOption(v)),
                        onDeleted: () => _onOptionToggled(v),
                        backgroundColor: theme.colorScheme.accent,
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 8),
            ],

            ValueListenableBuilder(
              valueListenable: _searchController,
              builder: (context, searchValue, child) {
                return FutureBuilder<List<T>>(
                  future: _fetchOptions(searchValue.text),
                  builder: (context, asyncSnapshot) {
                    final options = asyncSnapshot.data ?? [];
                    final searchText = searchValue.text;
                    // Compute showAddButton directly from snapshot data
                    final showAddButton =
                        searchText.isNotEmpty &&
                        options.isEmpty &&
                        widget.onNotFound != null;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShadSelectFormField<T>.withSearch(
                          minWidth: widget.minWidth ?? constraints.maxWidth,
                          maxWidth: widget.maxWidth,
                          trailing: widget.trailing,
                          search: widget.leading,
                          placeholder: Text(
                            widget.placeholder ?? intl.selectOption,
                          ),
                          onSearchChanged: (value) {
                            _searchController.text = value;
                          },
                          searchPlaceholder: Text(
                            widget.searchPlaceholder ?? intl.searchAndFilter,
                          ),
                          initialValue: widget.multiSelect
                              ? null
                              : widget.initialValue,
                          onChanged: (value) {
                            if (value != null) {
                              if (widget.multiSelect) {
                                _onOptionToggled(value);
                              } else {
                                _onOptionSelected(value);
                              }
                            }
                          },
                          options: [
                            // Not found state with add button
                            if (showAddButton)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 12,
                                ),
                                child: ShadButton.outline(
                                  onPressed: _handleAddNotFound,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(LucideIcons.plus, size: 16),
                                      const SizedBox(width: 8),
                                      Flexible(
                                        child: Text(
                                          widget.addButtonLabel ??
                                              '${intl.add} "$searchText" ${intl.asCategory}?',
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            // Empty state (no search text or no results without add callback)
                            if (searchText.isNotEmpty &&
                                options.isEmpty &&
                                widget.onNotFound == null)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 24,
                                ),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Icon(
                                        LucideIcons.searchX,
                                        size: 32,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary
                                            .withValues(alpha: 0.4),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(intl.noDataFound),
                                    ],
                                  ),
                                ),
                              ),

                            // Available options
                            ...options.map((option) {
                              final isSelected = _isSelected(option);

                              return ShadOption(
                                value: option,
                                child: Row(
                                  children: [
                                    if (widget.multiSelect) ...[
                                      Icon(
                                        isSelected
                                            ? LucideIcons.squareCheck
                                            : LucideIcons.square,
                                        size: 16,
                                        color: isSelected
                                            ? SabitouColors.infoText
                                            : null,
                                      ),
                                      const SizedBox(width: 8),
                                    ],
                                    Expanded(
                                      child:
                                          widget.optionViewBuilder?.call(
                                            option,
                                          ) ??
                                          Text(
                                            widget.displayStringForOption(
                                              option,
                                            ),
                                          ),
                                    ),
                                    if (isSelected && !widget.multiSelect)
                                      const Icon(
                                        LucideIcons.check,
                                        size: 16,
                                        color: SabitouColors.infoText,
                                      ),
                                  ],
                                ),
                              );
                            }),
                          ],
                          selectedOptionBuilder: (context, value) =>
                              widget.multiSelect
                              ? Text(
                                  '${_selectedValues.length} ${intl.selected}',
                                )
                              : Text(widget.displayStringForOption(value)),
                          validator: widget.validator,
                          enabled: widget.enabled,
                        ),
                      ],
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
