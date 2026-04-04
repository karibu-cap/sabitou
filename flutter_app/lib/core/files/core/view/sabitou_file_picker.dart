import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../../themes/app_theme.dart';
import '../../sabitou_file_manager.dart';

/// The universal file picker entry-point.
///
/// Call [SabitouFilePicker.show] from any screen to trigger the full flow:
/// pick → compress → queue upload → call [onComplete] with resource link IDs.
///
/// ```dart
/// SabitouFilePicker.show(
///   context: context,
///   category: FileCategory.product,
///   allowMultiple: true,
///   limit: 4,
///   onComplete: (List<String> resourceLinkIds) {
///     viewModel.updateImages(productId, resourceLinkIds);
///   },
/// );
/// ```
class SabitouFilePicker {
  SabitouFilePicker._();

  /// Shows the picker bottom-sheet (or dialog on wide screens).
  ///
  /// [onComplete] is called with the list of `ResourceLink.ref_id`s once all
  /// selected files have been processed. The IDs are ready to persist even
  /// if the upload is still in progress.
  static Future<void> show({
    required BuildContext context,
    required FileCategory category,
    required Future<bool> Function(List<PendingFileItem> filesItems) onComplete,
    bool allowMultiple = false,
    int limit = 5,
    bool? forceGrayscale,
  }) async {
    final isWide = MediaQuery.sizeOf(context).width >= 820;

    if (isWide) {
      await showDialog<void>(
        context: context,
        builder: (_) => Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(40),
          child: _FilePickerSheet(
            category: category,
            allowMultiple: allowMultiple,
            limit: limit,
            forceGrayscale: forceGrayscale,
            onComplete: onComplete,
            isDialog: true,
          ),
        ),
      );
    } else {
      await showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => _FilePickerSheet(
          category: category,
          allowMultiple: allowMultiple,
          limit: limit,
          forceGrayscale: forceGrayscale,
          onComplete: onComplete,
          isDialog: false,
        ),
      );
    }
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// The sheet / dialog content
// ─────────────────────────────────────────────────────────────────────────────

class _FilePickerSheet extends StatefulWidget {
  final FileCategory category;
  final bool allowMultiple;
  final int limit;
  final bool? forceGrayscale;
  final Future<bool> Function(List<PendingFileItem> filesItems) onComplete;
  final bool isDialog;

  const _FilePickerSheet({
    required this.category,
    required this.allowMultiple,
    required this.limit,
    this.forceGrayscale,
    required this.onComplete,
    required this.isDialog,
  });

  @override
  State<_FilePickerSheet> createState() => _FilePickerSheetState();
}

class _FilePickerSheetState extends State<_FilePickerSheet> {
  final _imagePicker = ImagePicker();
  final List<PendingFileItem> _pending = [];
  bool _processing = false;
  String? _error;

  // ─────────────────────────────────────────────────────────────────────────
  // Pick sources
  // ─────────────────────────────────────────────────────────────────────────

  Future<void> _pickFromGallery() async {
    try {
      setState(() => _error = null);

      if (widget.allowMultiple) {
        final images = await _imagePicker.pickMultiImage(limit: widget.limit);
        await _processXFiles(images);
      } else {
        final image = await _imagePicker.pickImage(source: ImageSource.gallery);
        if (image != null) await _processXFiles([image]);
      }
    } catch (e) {
      setState(() => _error = 'Gallery error: $e');
    }
  }

  Future<void> _pickFromCamera() async {
    try {
      setState(() => _error = null);
      final image = await _imagePicker.pickImage(source: ImageSource.camera);
      if (image != null) await _processXFiles([image]);
    } catch (e) {
      setState(() => _error = 'Camera error: $e');
    }
  }

  Future<void> _pickFromFiles() async {
    try {
      setState(() => _error = null);
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: widget.allowMultiple,
        allowedExtensions: widget.category.allowedExtensions,
        type: FileType.custom,
        withData: true,
      );
      if (result != null) {
        final xFiles = result.files
            .where((f) => f.path != null)
            .map((f) => XFile(f.path ?? '', bytes: f.bytes))
            .toList();
        await _processXFiles(xFiles);
      }
    } catch (e) {
      setState(() => _error = 'File picker error: $e');
    }
  }

  Future<void> _processXFiles(List<XFile> xFiles) async {
    if (xFiles.isEmpty) return;

    // Enforce limit.
    final remaining = widget.limit - _pending.length;
    final toProcess = xFiles.take(remaining).toList();

    setState(() => _processing = true);

    try {
      for (final xFile in toProcess) {
        // Use prepareOnly - upload happens only on confirm.
        final result = await SabitouFileManager.instance.prepareOnly(
          xFile,
          widget.category,
          forceGrayscale: widget.forceGrayscale,
        );

        setState(() {
          _pending.add(
            PendingFileItem(
              localPath: result.localPath,
              resourceLinkId: result.resourceLinkId,
              futureRemoteUrl: result.futureRemoteUrl,
            ),
          );
        });
      }
    } catch (e) {
      setState(() => _error = 'Processing failed: $e');
    } finally {
      setState(() => _processing = false);
    }
  }

  void _removePending(int index) {
    final removed = _pending.removeAt(index);
    // Cancel the pending upload so it doesn't get uploaded on confirm.
    SabitouFileManager.instance.cancelPending([removed.resourceLinkId]);
    setState(() {});
  }

  Future<void> _confirm() async {
    try {
      final ids = _pending.map((p) => p.resourceLinkId).toList();
      // Trigger the actual upload to MinIO.
      await SabitouFileManager.instance.confirmUpload(ids);
      final result = await widget.onComplete(_pending);
      if (result) {
        Navigator.of(context).pop();
      } else {
        setState(() => _error = 'Processing failed');
      }
    } catch (e) {
      setState(() => _error = 'Processing failed: $e');
    }
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Build
  // ─────────────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;
    final isWide = MediaQuery.sizeOf(context).width >= 820;

    final content = Container(
      decoration: BoxDecoration(
        color: cs.background,
        borderRadius: widget.isDialog
            ? BorderRadius.circular(AppTheme.radiusSm.toDouble())
            : const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.85,
        maxWidth: widget.isDialog ? 560 : double.infinity,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Header(category: widget.category, theme: theme),
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Source buttons.
                  _SourceButtons(
                    category: widget.category,
                    isImageOnly: widget.category.isImageOnly,
                    onGallery: _pickFromGallery,
                    onCamera: _pickFromCamera,
                    onFiles: widget.category.isImageOnly
                        ? null
                        : _pickFromFiles,
                    theme: theme,
                  ),
                  const SizedBox(height: 20),

                  // Processing indicator.
                  if (_processing) ...[
                    LinearProgressIndicator(
                      backgroundColor: cs.muted,
                      valueColor: const AlwaysStoppedAnimation(
                        SabitouColors.accent,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(2)),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      Intls.to.processingFiles,
                      style: theme.textTheme.muted,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                  ],

                  // Error.
                  if (_error != null) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: SabitouColors.dangerSoft,
                        borderRadius: BorderRadius.circular(
                          AppTheme.radiusSm.toDouble(),
                        ),
                        border: Border.all(
                          color: SabitouColors.danger.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Text(
                        _error ?? '',
                        style: theme.textTheme.small.copyWith(
                          color: SabitouColors.dangerForeground,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],

                  // Preview grid.
                  if (_pending.isNotEmpty) ...[
                    Row(
                      children: [
                        Text(
                          '${_pending.length} ${Intls.to.file}${_pending.length == 1 ? '' : 's'} ${Intls.to.selected}',
                          style: theme.textTheme.small.copyWith(
                            color: cs.mutedForeground,
                          ),
                        ),
                        const Spacer(),
                        if (_pending.length < widget.limit)
                          Text(
                            '${widget.limit - _pending.length} ${Intls.to.moreAllowed}',
                            style: theme.textTheme.muted,
                          ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    FilePreviewGrid(
                      files: _pending,
                      category: widget.category,
                      onRemove: _removePending,
                      cellSize: isWide ? 110 : 90,
                    ),
                    const SizedBox(height: 20),
                  ],
                ],
              ),
            ),
          ),

          // Action bar.
          _ActionBar(
            canConfirm: _pending.isNotEmpty && !_processing,
            onCancel: () => Navigator.of(context).pop(),
            onConfirm: _confirm,
            theme: theme,
          ),
        ],
      ),
    );

    return widget.isDialog ? content : SafeArea(child: content);
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Sub-widgets
// ─────────────────────────────────────────────────────────────────────────────

class _Header extends StatelessWidget {
  final FileCategory category;
  final ShadThemeData theme;

  const _Header({required this.category, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 16, 16),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              color: SabitouColors.accentSoft,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: const Icon(
              Icons.attach_file_rounded,
              color: SabitouColors.accent,
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${Intls.to.attach} ${category.label}',
                  style: theme.textTheme.h3,
                ),
                Text(
                  category.allowedExtensions
                      .map((e) => e.toUpperCase())
                      .join(', '),
                  style: theme.textTheme.muted,
                ),
              ],
            ),
          ),
          ShadIconButton.ghost(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close_rounded, size: 18),
          ),
        ],
      ),
    );
  }
}

class _SourceButtons extends StatelessWidget {
  final FileCategory category;
  final bool isImageOnly;
  final VoidCallback onGallery;
  final VoidCallback onCamera;
  final VoidCallback? onFiles;
  final ShadThemeData theme;

  const _SourceButtons({
    required this.category,
    required this.isImageOnly,
    required this.onGallery,
    required this.onCamera,
    this.onFiles,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final onFiles = this.onFiles;

    return Row(
      children: [
        Expanded(
          child: _SourceTile(
            icon: Icons.photo_library_rounded,
            label: Intls.to.gallery,
            onTap: onGallery,
            theme: theme,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _SourceTile(
            icon: Icons.camera_alt_rounded,
            label: Intls.to.camera,
            onTap: onCamera,
            theme: theme,
          ),
        ),
        if (onFiles != null) ...[
          const SizedBox(width: 8),
          Expanded(
            child: _SourceTile(
              icon: Icons.folder_open_rounded,
              label: Intls.to.files,
              onTap: onFiles,
              theme: theme,
            ),
          ),
        ],
      ],
    );
  }
}

class _SourceTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final ShadThemeData theme;

  const _SourceTile({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final cs = theme.colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: cs.muted,
          borderRadius: BorderRadius.circular(AppTheme.radiusSm.toDouble()),
          border: Border.fromBorderSide(BorderSide(color: cs.border)),
        ),
        child: Column(
          children: [
            Icon(icon, color: cs.foreground, size: 22),
            const SizedBox(height: 6),
            Text(
              label,
              style: theme.textTheme.small.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionBar extends StatelessWidget {
  final bool canConfirm;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;
  final ShadThemeData theme;

  const _ActionBar({
    required this.canConfirm,
    required this.onCancel,
    required this.onConfirm,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: theme.colorScheme.border)),
      ),
      child: Row(
        children: [
          Expanded(
            child: ShadButton.outline(
              onPressed: onCancel,
              child: Text(Intls.to.cancel),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ShadButton(
              enabled: canConfirm,
              onPressed: canConfirm ? onConfirm : null,
              child: Text(Intls.to.confirm),
            ),
          ),
        ],
      ),
    );
  }
}
