import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../themes/app_theme.dart';
import '../../common/file_cache_manager.dart';
import '../../common/file_category.dart';

/// A plug-and-play widget that displays any Sabitou file by its remote URL.
///
/// - **Images**: displayed using [CachedNetworkImage] with shimmer skeleton.
/// - **PDFs / Documents**: shows an icon card with file info.
/// - **Local-only** (file not yet uploaded): accepts a [localFile] fallback.
///
/// The widget automatically downloads missing files via [FileCacheManager].
///
/// Usage:
/// ```dart
/// SabitouFilePreview(
///   remoteUrl: product.imageUrl,
///   category: FileCategory.product,
///   width: 80,
///   height: 80,
///   borderRadius: BorderRadius.circular(8),
/// )
/// ```
class SabitouFilePreview extends StatelessWidget {
  /// The remote URL of the file.
  final String? remoteUrl;

  /// The local file path to be displayed (used for immediate preview).
  final String? localPath;

  /// The category of the file.
  final FileCategory category;

  /// The width of the preview.
  final double? width;

  /// The height of the preview.
  final double? height;

  /// The fit of the preview.
  final BoxFit fit;

  /// The border radius of the preview.
  final BorderRadius? borderRadius;

  /// The placeholder widget to be displayed while the file is loading.
  final Widget? placeholder;

  /// The error widget to be displayed if the file fails to load.
  final Widget? errorWidget;

  /// Constructs a new [SabitouFilePreview].
  const SabitouFilePreview({
    super.key,
    this.remoteUrl,
    this.localPath,
    required this.category,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.placeholder,
    this.errorWidget,
  }) : assert(
         remoteUrl != null || localPath != null,
         'Provide either remoteUrl or localPath.',
       );

  bool _isPdf(String url) => url.toLowerCase().endsWith('.pdf');

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final radius =
        borderRadius ?? BorderRadius.circular(AppTheme.radiusSm.toDouble());
    final localPath = this.localPath;
    final remoteUrl = this.remoteUrl;

    // Local file takes priority (used right after pick, before upload done).
    if (localPath != null && localPath.isNotEmpty) {
      return _LocalImagePreview(
        path: localPath,
        width: width,
        height: height,
        fit: fit,
        radius: radius,
      );
    }

    if (remoteUrl != null) {
      final url = remoteUrl;
      final isPdf = _isPdf(url);

      if (isPdf) {
        return _PdfPreviewCard(
          url: url,
          width: width,
          height: height,
          radius: radius,
          theme: theme,
        );
      }

      return _NetworkImagePreview(
        url: url,
        localPath: localPath,
        width: width,
        height: height,
        fit: fit,
        radius: radius,
        theme: theme,
        placeholder: placeholder,
        errorWidget: errorWidget,
      );
    }

    return const SizedBox.shrink();
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Network image with shimmer skeleton
// ─────────────────────────────────────────────────────────────────────────────

class _NetworkImagePreview extends StatelessWidget {
  final String url;
  final String? localPath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius radius;
  final ShadThemeData theme;
  final Widget? placeholder;
  final Widget? errorWidget;

  const _NetworkImagePreview({
    required this.url,
    this.localPath,
    this.width,
    this.height,
    required this.fit,
    required this.radius,
    required this.theme,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius,
      child: CachedNetworkImage(
        imageUrl: url,
        width: width,
        height: height,
        fit: fit,
        placeholder: (_, __) =>
            placeholder ?? ShimmerFileBox(width: width, height: height),
        errorWidget: (_, __, ___) =>
            errorWidget ??
            _ErrorBox(width: width, height: height, theme: theme),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Local File image
// ─────────────────────────────────────────────────────────────────────────────

class _LocalImagePreview extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius radius;

  const _LocalImagePreview({
    required this.path,
    this.width,
    this.height,
    required this.fit,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    // For Flutter Web, use Image.network with blob URLs
    // For mobile/desktop, use Image.file
    final imageWidget = kIsWeb
        ? Image.network(
            path,
            width: width,
            height: height,
            fit: fit,
            errorBuilder: (_, error, stackTrace) {
              debugPrint('Image.network error for blob URL: $path');
              debugPrint('Error: $error');
              return _ErrorBox(
                width: width,
                height: height,
                theme: ShadTheme.of(context),
              );
            },
          )
        : Image.file(
            File(path),
            width: width,
            height: height,
            fit: fit,
            errorBuilder: (_, error, stackTrace) {
              debugPrint('Image.file error for path: $path');
              return _ErrorBox(
                width: width,
                height: height,
                theme: ShadTheme.of(context),
              );
            },
          );

    return ClipRRect(borderRadius: radius, child: imageWidget);
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// PDF icon card
// ─────────────────────────────────────────────────────────────────────────────

class _PdfPreviewCard extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BorderRadius radius;
  final ShadThemeData theme;

  const _PdfPreviewCard({
    required this.url,
    this.width,
    this.height,
    required this.radius,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: SabitouColors.dangerSoft,
        borderRadius: radius,
        border: Border.all(
          color: SabitouColors.dangerForeground.withValues(alpha: 0.15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.picture_as_pdf_rounded,
            color: SabitouColors.danger,
            size: (width ?? 60) * 0.4,
          ),
          if ((height ?? 0) > 50) ...[
            const SizedBox(height: 4),
            Text('PDF', style: theme.textTheme.muted),
          ],
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Shimmer skeleton
// ─────────────────────────────────────────────────────────────────────────────

/// The width of the box.
class ShimmerFileBox extends StatefulWidget {
  /// The width of the box.
  final double? width;

  /// The height of the box.
  final double? height;

  /// Creates a new instance of [ShimmerFileBox].
  const ShimmerFileBox({super.key, this.width, this.height});

  @override
  State<ShimmerFileBox> createState() => _ShimmerFileBoxState();
}

class _ShimmerFileBoxState extends State<ShimmerFileBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _animation = Tween<double>(
      begin: 0.4,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, __) => Container(
        width: widget.width,
        height: widget.height,
        color: SabitouColors.shimmerBase.withValues(alpha: _animation.value),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Error box
// ─────────────────────────────────────────────────────────────────────────────

class _ErrorBox extends StatelessWidget {
  final double? width;
  final double? height;
  final ShadThemeData theme;

  const _ErrorBox({this.width, this.height, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: theme.colorScheme.muted,
      child: Icon(
        Icons.broken_image_outlined,
        color: theme.colorScheme.mutedForeground,
        size: 20,
      ),
    );
  }
}
