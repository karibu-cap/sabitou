import 'package:flutter/material.dart';
import 'package:sabitou_rpc/models.dart';

import '../core/files/sabitou_file_manager.dart';
import '../repositories/resource_link_repository.dart';
import '../themes/app_theme.dart';

/// Widget that takes a `ResourceLink.ref_id` and renders the associated image.
/// Resolves the remote URL through [ResourceLinkRepository] then falls back
/// to local cache if offline.
class ResourceLinkImage extends StatelessWidget {
  /// The resource link id.
  final String resourceLinkId;

  /// The size of the image.
  final double size;

  /// Called when the image is removed from the cache.
  final Function(String resourceLinkId, String remoteUrl)? onRemove;

  /// Creates a new instance of [ResourceLinkImage].
  const ResourceLinkImage({
    super.key,
    required this.resourceLinkId,
    this.size = 60,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ResourceLink?>(
      future: ResourceLinkRepository.instance.getResourceLink(resourceLinkId),
      builder: (context, snapshot) {
        final link = snapshot.data;

        final Widget preview = link != null
            ? SabitouFilePreview(
                remoteUrl: link.targetUri,
                category: FileCategory.product,
                width: size,
                height: size,
              )
            : ShimmerFileBox(width: size, height: size);

        if (onRemove == null) {
          return preview;
        }

        return Stack(
          clipBehavior: Clip.none,
          children: [
            preview,
            Positioned(
              top: -6,
              right: -6,
              child: GestureDetector(
                onTap: () =>
                    onRemove?.call(resourceLinkId, link?.targetUri ?? ''),
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: SabitouColors.danger,
                    shape: BoxShape.circle,
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
        );
      },
    );
  }
}
