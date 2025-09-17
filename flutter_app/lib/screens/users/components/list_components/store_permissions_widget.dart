import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// A widget that displays store permissions in a human-readable format,
/// grouped by theme with an attractive design.
class StorePermissionsWidget extends StatelessWidget {
  /// The list of store permissions to display.
  final List<StorePermission> permissions;

  /// Creates a new StorePermissionsWidget.
  const StorePermissionsWidget({super.key, required this.permissions});

  Widget _buildPermissionGroup(
    ShadThemeData theme,
    StoreResourceType resourceType,
    List<ResourceActionType> actions,
  ) {
    final resourceInfo = _getResourceInfo(resourceType);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: resourceInfo.color.withValues(alpha: 0.05),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: resourceInfo.color.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(resourceInfo.icon, size: 16, color: resourceInfo.color),
              const SizedBox(width: 8),
              Text(
                resourceInfo.name,
                style: theme.textTheme.p.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: resourceInfo.color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 6,
            runSpacing: 4,
            children: actions
                .map(
                  (action) =>
                      _buildActionChip(theme, action, resourceInfo.color),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildActionChip(
    ShadThemeData theme,
    ResourceActionType action,
    Color color,
  ) {
    final actionInfo = _getActionInfo(action);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 0.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(actionInfo.icon, size: 10, color: color),
          const SizedBox(width: 4),
          Text(
            actionInfo.name,
            style: theme.textTheme.p.copyWith(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  /// Groups permissions by resource type.
  Map<StoreResourceType, List<ResourceActionType>>
  _groupPermissionsByResource() {
    final Map<StoreResourceType, List<ResourceActionType>> grouped = {};

    for (final permission in permissions) {
      if (!grouped.containsKey(permission.resourceType)) {
        grouped[permission.resourceType] = [];
      }
      grouped[permission.resourceType]!.add(permission.actionType);
    }

    return grouped;
  }

  /// Gets human-readable information for a resource type.
  _ResourceInfo _getResourceInfo(StoreResourceType resourceType) {
    switch (resourceType) {
      case StoreResourceType.STORE_RESOURCE_TYPE_STORE:
        return const _ResourceInfo(
          name: 'Magasin',
          icon: Icons.store,
          color: Color(0xFF3B82F6), // Blue
        );
      case StoreResourceType.STORE_RESOURCE_TYPE_INVOICE:
        return const _ResourceInfo(
          name: 'Factures',
          icon: Icons.description,
          color: Color(0xFF10B981), // Green
        );
      case StoreResourceType.STORE_RESOURCE_TYPE_ORDER:
        return const _ResourceInfo(
          name: 'Commandes',
          icon: Icons.shopping_cart,
          color: Color(0xFF8B5CF6), // Purple
        );
      case StoreResourceType.STORE_RESOURCE_TYPE_SUPPLIER_ORDER:
        return const _ResourceInfo(
          name: 'Commandes Fournisseurs',
          icon: Icons.local_shipping,
          color: Color(0xFFF59E0B), // Amber
        );
      case StoreResourceType.STORE_RESOURCE_TYPE_PRODUCT:
        return const _ResourceInfo(
          name: 'Produits',
          icon: Icons.inventory,
          color: Color(0xFFEF4444), // Red
        );
      default:
        return const _ResourceInfo(
          name: 'Autre',
          icon: Icons.help_outline,
          color: Colors.grey,
        );
    }
  }

  /// Gets human-readable information for an action type.
  _ActionInfo _getActionInfo(ResourceActionType actionType) {
    switch (actionType) {
      case ResourceActionType.RESOURCE_ACTION_TYPE_READ:
        return const _ActionInfo(name: 'Voir', icon: LucideIcons.eye);
      case ResourceActionType.RESOURCE_ACTION_TYPE_ADD:
        return const _ActionInfo(name: 'Ajouter', icon: LucideIcons.plus);
      case ResourceActionType.RESOURCE_ACTION_TYPE_UPDATE:
        return const _ActionInfo(name: 'Modifier', icon: LucideIcons.pencil);
      case ResourceActionType.RESOURCE_ACTION_TYPE_REMOVE:
        return const _ActionInfo(name: 'Supprimer', icon: LucideIcons.trash);
      default:
        return const _ActionInfo(name: 'Autre', icon: LucideIcons.handHelping);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final groupedPermissions = _groupPermissionsByResource();

    if (groupedPermissions.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.textTheme.muted.color?.withValues(alpha: 0.1),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.fromBorderSide(
            BorderSide(
              color:
                  theme.textTheme.muted.color?.withValues(alpha: 0.3) ??
                  Colors.transparent,
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(Icons.shield, size: 16, color: theme.textTheme.muted.color),
            const SizedBox(width: 8),
            Text(
              'Aucune permission assignée',
              style: theme.textTheme.muted.copyWith(fontSize: 12),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...groupedPermissions.entries.map(
          (entry) => _buildPermissionGroup(theme, entry.key, entry.value),
        ),
      ],
    );
  }
}

/// Information about a resource type.
class _ResourceInfo {
  final String name;
  final IconData icon;
  final Color color;

  const _ResourceInfo({
    required this.name,
    required this.icon,
    required this.color,
  });
}

/// Information about an action type.
class _ActionInfo {
  final String name;
  final IconData icon;

  const _ActionInfo({required this.name, required this.icon});
}
