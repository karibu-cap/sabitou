// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shadcn_ui/shadcn_ui.dart';

// import '../../../../../services/internationalization/internationalization.dart';
// import '../../../../../themes/app_colors.dart' show AppColors;
// import '../../../../../utils/extensions/category_extension.dart';
// import '../../add_global_product_controller.dart';
// import 'select_categories_controller.dart';

// /// Opens the modal bottom sheet responsible for displaying the category selector.
// Future<void> showSelectCategoriesSheet(
//   BuildContext context,
//   AddGlobalProductController controller,
// ) {
//   return showModalBottomSheet<void>(
//     context: context,
//     isScrollControlled: true,
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
//     ),
//     builder: (sheetContext) {
//       return ChangeNotifierProvider<SelectCategoriesController>(
//         create: (_) =>
//             SelectCategoriesController(addGlobalProductController: controller),
//         child: const SelectCategoriesSheet(),
//       );
//     },
//   );
// }

// /// Stateless widget representing the body of the category selection sheet.
// class SelectCategoriesSheet extends StatelessWidget {
//   /// Constructs a new SelectCategoriesSheet.
//   const SelectCategoriesSheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final intl = AppInternationalizationService.to;
//     final theme = ShadTheme.of(context);
//     final controller = context.watch<SelectCategoriesController>();
//     final categories = controller.filteredCategories;

//     return Padding(
//       padding: EdgeInsets.only(
//         bottom: MediaQuery.of(context).viewInsets.bottom,
//       ),
//       child: FractionallySizedBox(
//         heightFactor: 0.85,
//         child: Column(
//           children: [
//             const SizedBox(height: 8),
//             Container(
//               width: 40,
//               height: 4,
//               decoration: const BoxDecoration(
//                 color: AppColors.primary100,
//                 borderRadius: BorderRadius.all(Radius.circular(4)),
//               ),
//             ),
//             const SizedBox(height: 12),
//             _SheetHeader(intl: intl),
//             const SizedBox(height: 12),

//             // Quick Add Category Section (expandable)
//             _QuickAddCategorySection(intl: intl),
//             const SizedBox(height: 8),
//             const Divider(height: 1),

//             // Categories List
//             Expanded(
//               child: controller.isLoading
//                   ? const Center(child: CircularProgressIndicator())
//                   : categories.isEmpty
//                   ? _EmptyState(intl: intl)
//                   : ListView.separated(
//                       padding: const EdgeInsets.symmetric(horizontal: 8),
//                       itemCount: categories.length,
//                       separatorBuilder: (_, __) => const Divider(height: 0),
//                       itemBuilder: (_, index) {
//                         final category = categories[index];
//                         final isSelected = controller.isCategorySelected(
//                           category,
//                         );

//                         return CheckboxListTile(
//                           value: isSelected,
//                           onChanged: (_) => controller.toggleCategory(category),
//                           title: Text(category.label),
//                           subtitle: category.name.en != category.name.fr
//                               ? Text(
//                                   '${category.name.en} / ${category.name.fr}',
//                                   style: theme.textTheme.muted.copyWith(
//                                     fontSize: 11,
//                                   ),
//                                 )
//                               : null,
//                           controlAffinity: ListTileControlAffinity.leading,
//                           contentPadding: const EdgeInsets.symmetric(
//                             horizontal: 12,
//                             vertical: 6,
//                           ),
//                           secondary: isSelected
//                               ? const Icon(
//                                   LucideIcons.circleCheck400,
//                                   color: AppColors.purple,
//                                   size: 20,
//                                 )
//                               : null,
//                         );
//                       },
//                     ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: ShadButton.outline(
//                       onPressed: () => Navigator.of(context).pop(),
//                       child: Text(intl.cancel),
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: ShadButton(
//                       onPressed: () => Navigator.of(context).pop(),
//                       child: Text(
//                         '${intl.confirm} (${controller.selectedCount})',
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _SheetHeader extends StatelessWidget {
//   const _SheetHeader({required this.intl});

//   final AppInternationalizationService intl;

//   @override
//   Widget build(BuildContext context) {
//     final theme = ShadTheme.of(context);
//     final controller = context.watch<SelectCategoriesController>();

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: Text(
//                   intl.selectCategory,
//                   style: theme.textTheme.h1.copyWith(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               IconButton(
//                 onPressed: () => Navigator.of(context).pop(),
//                 icon: Icon(Icons.close, color: theme.colorScheme.primary),
//               ),
//             ],
//           ),
//           const SizedBox(height: 8),
//           Row(
//             children: [
//               Expanded(
//                 child: ShadInput(
//                   controller: controller.searchController,
//                   placeholder: Text(intl.searchCategory),
//                   trailing: const Icon(LucideIcons.search, size: 16),
//                   // onChanged: controller.updateSearchQuery,
//                 ),
//               ),
//               if (controller.selectedCount > 0) ...[
//                 const SizedBox(width: 12),
//                 ShadBadge(child: Text('${controller.selectedCount}')),
//               ],
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// /// Quick add category expandable section
// class _QuickAddCategorySection extends StatelessWidget {
//   const _QuickAddCategorySection({required this.intl});
//   final AppInternationalizationService intl;

//   @override
//   Widget build(BuildContext context) {
//     final theme = ShadTheme.of(context);
//     final controller = context.watch<SelectCategoriesController>();

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ShadButton.outline(
//             onPressed: controller.toggleQuickAdd,
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(
//                   controller.isQuickAddExpanded
//                       ? LucideIcons.minus
//                       : LucideIcons.plus,
//                   size: 16,
//                 ),
//                 const SizedBox(width: 8),
//                 Text(
//                   controller.isQuickAddExpanded
//                       ? intl.hideQuickAdd
//                       : intl.quickAddCategory,
//                 ),
//               ],
//             ),
//           ),
//           if (controller.isQuickAddExpanded) ...[
//             const SizedBox(height: 12),
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: theme.colorScheme.secondary.withValues(alpha: 0.04),
//                 borderRadius: const BorderRadius.all(Radius.circular(8)),
//                 border: Border.all(
//                   color: theme.colorScheme.primary.withValues(alpha: 0.1),
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     intl.enterCategoryName,
//                     style: theme.textTheme.p.copyWith(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   ShadInput(
//                     controller: controller.quickAddEnController,
//                     placeholder: Text(intl.englishName),
//                     trailing: const Icon(LucideIcons.languages, size: 16),
//                   ),
//                   const SizedBox(height: 8),
//                   ShadInput(
//                     controller: controller.quickAddFrController,
//                     placeholder: Text(intl.frenchName),
//                     trailing: const Icon(LucideIcons.languages, size: 16),
//                   ),
//                   const SizedBox(height: 12),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: ShadButton(
//                           onPressed: controller.canQuickAdd
//                               ? () => controller.quickAddCategory(context)
//                               : null,
//                           enabled:
//                               controller.canQuickAdd &&
//                               !controller.isQuickAddLoading,
//                           trailing: controller.isQuickAddLoading
//                               ? const SizedBox(
//                                   width: 16,
//                                   height: 16,
//                                   child: CircularProgressIndicator(
//                                     strokeWidth: 2,
//                                   ),
//                                 )
//                               : null,
//                           child: Text(intl.addCategory),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ],
//       ),
//     );
//   }
// }

// /// Empty state widget when no categories match the search
// class _EmptyState extends StatelessWidget {
//   const _EmptyState({required this.intl});
//   final AppInternationalizationService intl;
//   @override
//   Widget build(BuildContext context) {
//     final theme = ShadTheme.of(context);
//     return Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(
//             LucideIcons.searchX,
//             size: 48,
//             color: theme.colorScheme.primary.withValues(alpha: 0.3),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             intl.noCategoriesMatchFilters,
//             style: theme.textTheme.p,
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 8),
//           Text(
//             intl.tryDifferentSearch,
//             style: theme.textTheme.muted.copyWith(fontSize: 12),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }
