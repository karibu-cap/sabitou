// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';
// import 'package:shadcn_ui/shadcn_ui.dart';

// import '../../../services/sync_control/sync_control_service.dart';

// /// A button that provides PowerSync sync controls (stop, resync, refresh)
// class SyncControlButton extends StatelessWidget {
//   const SyncControlButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final syncService = context.watch<SyncControlService>();
//     final theme = ShadTheme.of(context);
//     final cs = theme.colorScheme;

//     return PopupMenuButton<String>(
//       icon: Icon(
//         _getSyncIcon(syncService),
//         size: 18,
//         color: _getSyncIconColor(syncService, cs),
//       ),
//       tooltip: 'Sync Controls',
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(Radius.circular(8)),
//       ),
//       elevation: 8,
//       itemBuilder: (context) => [
//         PopupMenuItem<String>(
//           value: 'stop',
//           enabled: syncService.isSyncing && !syncService.isReconnecting,
//           child: Row(
//             children: [
//               Icon(
//                 LucideIcons.square,
//                 size: 16,
//                 color: syncService.isSyncing && !syncService.isReconnecting
//                     ? cs.foreground
//                     : cs.mutedForeground,
//               ),
//               const SizedBox(width: 8),
//               Text(
//                 'Stop Sync',
//                 style: TextStyle(
//                   color: syncService.isSyncing && !syncService.isReconnecting
//                       ? cs.foreground
//                       : cs.mutedForeground,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         PopupMenuItem<String>(
//           value: 'resync',
//           enabled: !syncService.isReconnecting,
//           child: Row(
//             children: [
//               Icon(
//                 LucideIcons.refreshCw,
//                 size: 16,
//                 color: syncService.isReconnecting ? cs.mutedForeground : cs.foreground,
//               ),
//               const SizedBox(width: 8),
//               Row(
//                 children: [
//                   Text(
//                     'Resync Database',
//                     style: TextStyle(
//                       color: syncService.isReconnecting ? cs.mutedForeground : cs.foreground,
//                     ),
//                   ),
//                   if (syncService.isReconnecting) ...[
//                     const SizedBox(width: 8),
//                     SizedBox(
//                       width: 12,
//                       height: 12,
//                       child: CircularProgressIndicator(
//                         strokeWidth: 2,
//                         valueColor: AlwaysStoppedAnimation<Color>(cs.mutedForeground),
//                       ),
//                     ),
//                   ],
//                 ],
//               ),
//             ],
//           ),
//         ),
//         const PopupMenuItem<String>(
//           value: 'refresh',
//           child: Row(
//             children: [
//               Icon(
//                 LucideIcons.rotateCcw,
//                 size: 16,
//               ),
//               SizedBox(width: 8),
//               Text('Refresh Page'),
//             ],
//           ),
//         ),
//       ],
//       onSelected: (value) async {
//         switch (value) {
//           case 'stop':
//             await _handleStopSync(context, syncService);
//             break;
//           case 'resync':
//             await _handleResyncDatabase(context, syncService);
//             break;
//           case 'refresh':
//             _handleRefreshPage(context);
//             break;
//         }
//       },
//     );
//   }

//   IconData _getSyncIcon(SyncControlService syncService) {
//     if (syncService.isReconnecting) {
//       return LucideIcons.refreshCw;
//     } else if (syncService.isSyncing) {
//       return LucideIcons.wifi;
//     } else {
//       return LucideIcons.wifiOff;
//     }
//   }

//   Color _getSyncIconColor(SyncControlService syncService, ShadColorScheme cs) {
//     if (syncService.isReconnecting) {
//       return cs.primary;
//     } else if (syncService.isSyncing) {
//       return cs.foreground;
//     } else {
//       return cs.mutedForeground;
//     }
//   }

//   Future<void> _handleStopSync(BuildContext context, SyncControlService syncService) async {
//     try {
//       await syncService.stopSync();
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Sync stopped'),
//             duration: Duration(seconds: 2),
//           ),
//         );
//       }
//     } catch (e) {
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Failed to stop sync: $e'),
//             backgroundColor: ShadTheme.of(context).colorScheme.destructive,
//           ),
//         );
//       }
//     }
//   }

//   Future<void> _handleResyncDatabase(BuildContext context, SyncControlService syncService) async {
//     try {
//       await syncService.resyncDatabase();
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Database resynchronized successfully'),
//             duration: Duration(seconds: 2),
//           ),
//         );
//       }
//     } catch (e) {
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Failed to resync database: $e'),
//             backgroundColor: ShadTheme.of(context).colorScheme.destructive,
//           ),
//         );
//       }
//     }
//   }

//   void _handleRefreshPage(BuildContext context) {
//     // This will trigger a page refresh by navigating to the same route
//     final router = GoRouter.of(context);
//     final currentLocation = router.routeInformationProvider.value.location;
//     router.go(currentLocation);

//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text('Page refreshed'),
//         duration: Duration(seconds: 1),
//       ),
//     );
//   }
// }
