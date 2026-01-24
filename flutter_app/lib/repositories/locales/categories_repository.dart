// import 'package:get_it/get_it.dart';
// import 'package:isar_community/isar.dart';
// import 'package:sabitou_rpc/models.dart';

// import '../../local_model/inventory/category.dart';
// import '../../utils/logger.dart';

// /// The categories repository.
// class LocalCategoriesRepository {
//   final _logger = LoggerApp('LocalCategoriesRepository');

//   /// The instance of [Isar].
//   final _isar = GetIt.I.get<Isar>();

//   /// Constructs a new [LocalCategoriesRepository].
//   LocalCategoriesRepository();

//   /// Gets all categories base on business Id.
//   Future<List<Category>> getCategoriesByBusinessId(String businessId) async {
//     try {
//       final isarCategories = await _isar.localCategorys
//           .filter()
//           .businessIdEqualTo(businessId)
//           .findAll();

//       _logger.info('Found ${isarCategories.length} categories in Isar');

//       return isarCategories.map((isar) => isar.toProto()).toList();
//     } on Exception catch (e) {
//       _logger.severe('getCategoriesByBusinessId Error: $e');

//       return [];
//     }
//   }

//   /// Streams the categories change.
//   Stream<List<Category>> streamCategories() {
//     final Stream<void> userChanged = _isar.localCategorys.watchLazy();

//     return userChanged.asyncMap((_) async {
//       final categories = await _isar.localCategorys.where().findAll();

//       return categories.map((e) => e.toProto()).toList();
//     });
//   }

//   /// Gets a category by ref.
//   Future<Category?> getCategoryByRefId(String refId) async {
//     try {
//       final response = await _isar.localCategorys
//           .filter()
//           .refIdEqualTo(refId)
//           .findFirst();

//       return response?.toProto();
//     } on Exception catch (e) {
//       _logger.severe('getCategoryByRefId Error: $e');

//       return null;
//     }
//   }

//   /// Adds a new product category.
//   Future<bool> createCategories(List<Category> categories) async {
//     try {
//       final isarCategories = categories.map(LocalCategory.fromProto).toList();
//       await _isar.writeTxn(() async {
//         await _isar.localCategorys.putAll(isarCategories);
//       });

//       return true;
//     } on Exception catch (e) {
//       _logger.severe('CreateCategoryRequest Error: $e');

//       return false;
//     }
//   }

//   /// Updates a product category.
//   Future<bool> updateCategory(UpdateCategoryRequest request) async {
//     try {
//       await _isar.writeTxn(() async {
//         final existingCategory = await _isar.localCategorys
//             .filter()
//             .refIdEqualTo(request.category.refId)
//             .findFirst();
//         if (existingCategory == null) {
//           _logger.severe(
//             'Category not found for update: ${request.category.refId}',
//           );

//           return false;
//         }

//         existingCategory
//           ..name?.en = request.category.name.en
//           ..name?.fr = request.category.name.fr
//           ..status = LocalCategoryStatus.values[request.category.status.value]
//           ..type = LocalCategoryType.values[request.category.type.value]
//           ..updatedAt = DateTime.now();

//         await _isar.localCategorys.put(existingCategory);
//       });

//       _logger.info('Saved ${request.category.refId} categories to Isar');

//       return true;
//     } on Exception catch (e) {
//       _logger.severe('updateProductCategory Error: $e');

//       return false;
//     }
//   }

//   /// Deletes a product category.
//   Future<bool> deleteProductCategory(DeleteCategoryRequest request) async {
//     try {
//       await _isar.writeTxn(() async {
//         await _isar.localCategorys
//             .filter()
//             .refIdEqualTo(request.categoryId)
//             .deleteAll();
//       });

//       return true;
//     } on Exception catch (e) {
//       _logger.severe('deleteProductCategory Error: $e');

//       return false;
//     }
//   }
// }
