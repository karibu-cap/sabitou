import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../themes/app_theme.dart';
import '../../common/file_category.dart';
import '../engine/upload_queue.dart';
import 'sabitou_file_preview.dart';

/// A responsive thumbnail grid that shows [PendingFileItem]s before they are
/// confirmed and uploaded.
///
/// Each cell has an ✕ delete button. A progress overlay is shown while the
/// upload is in flight (driven by [UploadQueue.events]).
///
/// Usage:
/// ```dart
/// FilePreviewGrid(
///   files: _pendingFiles,
///   category: FileCategory.product,
///   onRemove: (index) => setState(() => _pendingFiles.removeAt(index)),
/// )
/// ```
class FilePreviewGrid extends StatefulWidget {
  /// The files to be displayed.
  final List<PendingFileItem> files;

  /// The category of the files.
  final FileCategory category;

  /// Callback to be called when a file is removed.
  final void Function(int index) onRemove;

  /// Number of columns on mobile. Desktop adapts automatically.
  final int mobileColumns;

  /// Cell size in pixels.
  final double cellSize;

  /// Constructs a new [FilePreviewGrid].
  const FilePreviewGrid({
    super.key,
    required this.files,
    required this.category,
    required this.onRemove,
    this.mobileColumns = 3,
    this.cellSize = 100,
  });

  @override
  State<FilePreviewGrid> createState() => _FilePreviewGridState();
}

class _FilePreviewGridState extends State<FilePreviewGrid> {
  // Maps resourceLinkId → upload progress (0.0–1.0).
  final Map<String, double> _progress = {};

  @override
  void initState() {
    super.initState();
    UploadQueue.instance.events.listen(_handleQueueEvent);
  }

  void _handleQueueEvent(UploadQueueEvent event) {
    if (!mounted) return;
    if (event is UploadProgress) {
      final item = widget.files.firstWhere(
        (f) => f.resourceLinkId == event.id,
        orElse: () => const PendingFileItem(
          localPath: '',
          resourceLinkId: '',
          futureRemoteUrl: '',
        ),
      );
      if (item.resourceLinkId.isEmpty) return;
      setState(() => _progress[event.id] = event.progress);
    } else if (event is UploadDone) {
      setState(() => _progress.remove(event.item.resourceLinkId));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.files.isEmpty) return const SizedBox.shrink();

    final theme = ShadTheme.of(context);

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (int i = 0; i < widget.files.length; i++)
          _FileCell(
            item: widget.files[i],
            category: widget.category,
            size: widget.cellSize,
            progress: _progress[widget.files[i].resourceLinkId],
            onRemove: () => widget.onRemove(i),
            theme: theme,
          ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Single cell
// ─────────────────────────────────────────────────────────────────────────────

class _FileCell extends StatelessWidget {
  final PendingFileItem item;
  final FileCategory category;
  final double size;
  final double? progress;
  final VoidCallback onRemove;
  final ShadThemeData theme;

  const _FileCell({
    required this.item,
    required this.category,
    required this.size,
    this.progress,
    required this.onRemove,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppTheme.radiusSm.toDouble()),
            child: SabitouFilePreview(
              remoteUrl: item.futureRemoteUrl.isNotEmpty
                  ? item.futureRemoteUrl
                  : null,
              localPath: item.localPath.isNotEmpty ? item.localPath : null,
              category: category,
              width: size,
              height: size,
            ),
          ),

          // Upload progress overlay.
          if (progress != null)
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  AppTheme.radiusSm.toDouble(),
                ),
                child: Container(
                  color: Colors.black.withValues(alpha: 0.45),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: size * 0.6,
                        child: LinearProgressIndicator(
                          value: progress,
                          backgroundColor: Colors.white.withValues(alpha: 0.3),
                          valueColor: const AlwaysStoppedAnimation(
                            SabitouColors.accent,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${((progress ?? 0) * 100).toStringAsFixed(0)}%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          // Delete button (top-right).
          Positioned(
            top: -6,
            right: -6,
            child: GestureDetector(
              onTap: onRemove,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: SabitouColors.danger,
                  shape: BoxShape.circle,
                  border: const Border.fromBorderSide(
                    BorderSide(color: Colors.white, width: 1.5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                  size: 11,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Represents a file that has been picked but not yet confirmed by the user.
class PendingFileItem {
  /// The original picked file path (used for local display before upload).
  final String localPath;

  /// The ResourceLink ID created optimistically in the local DB.
  final String resourceLinkId;

  /// The MinIO URL that will be available once upload completes.
  final String futureRemoteUrl;

  /// Constructs a new [PendingFileItem].
  const PendingFileItem({
    required this.localPath,
    required this.resourceLinkId,
    required this.futureRemoteUrl,
  });
}
