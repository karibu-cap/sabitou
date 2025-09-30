// import 'package:connectrpc/connect.dart' as connect;
// import 'package:sabitou_rpc/sabitou_rpc.dart';

// import '../../utils/logger.dart';

// /// The remote inventory repository.
// class RemoteInventoryRepository {
//   final _logger = LoggerApp('RemoteInventoryRepository');

//   /// The inventory service client.
//   final InventoryServiceClient inventoryServiceClient;

//   /// Constructs a new [RemoteInventoryRepository].
//   RemoteInventoryRepository({required connect.Transport transport})
//     : inventoryServiceClient = InventoryServiceClient(transport);

//   /// Gets the inventory levels of a product.
//   Future<List<InventoryLevel>> getProductInventoryLevels(
//     String productId,
//   ) async {
//     try {
//       final request = GetProductInventoryLevelsRequest(productId: productId);
//       final response = await inventoryServiceClient.getProductInventoryLevels(
//         request,
//       );

//       return response.levels;
//     } on Exception catch (e) {
//       _logger.severe('getProductInventoryLevels Error: $e');

//       return [];
//     }
//   }

//   /// Checks if a product is available in a warehouse.
//   Future<CheckProductAvailabilityResponse> checkProductAvailability(
//     CheckProductAvailabilityRequest request,
//   ) async {
//     try {
//       final response = await inventoryServiceClient.checkProductAvailability(
//         request,
//       );

//       return response;
//     } on Exception catch (e) {
//       _logger.severe('checkProductAvailability Error: $e');

//       return CheckProductAvailabilityResponse();
//     }
//   }

//   /// Gets low stock items for a store.
//   Future<GetLowStockItemsResponse> getLowStockItems(
//     GetLowStockItemsRequest request,
//   ) async {
//     try {
//       final response = await inventoryServiceClient.getLowStockItems(request);

//       return response;
//     } on Exception catch (e) {
//       _logger.severe('getLowStockItems Error: $e');

//       return GetLowStockItemsResponse();
//     }
//   }

//   /// Lists products with pagination and filters.
//   Future<ListProductsResponse> listProducts(ListProductsRequest request) async {
//     try {
//       final response = await inventoryServiceClient.listProducts(request);

//       return response;
//     } on Exception catch (e) {
//       _logger.severe('listProducts Error: $e');

//       return ListProductsResponse();
//     }
//   }

//   /// Gets a snapshot of store inventory.
//   Future<GetStoreInventoryResponse> getStoreInventory(
//     GetStoreInventoryRequest request,
//   ) async {
//     try {
//       final response = await inventoryServiceClient.getStoreInventory(request);

//       return response;
//     } on Exception catch (e) {
//       _logger.severe('getStoreInventory Error: $e');

//       return GetStoreInventoryResponse();
//     }
//   }

//   /// Gets recent inventory transactions for a store.
//   Future<GetRecentInventoryTransactionsResponse> getRecentInventoryTransactions(
//     GetRecentInventoryTransactionsRequest request,
//   ) async {
//     try {
//       final response = await inventoryServiceClient
//           .getRecentInventoryTransactions(request);

//       return response;
//     } on Exception catch (e) {
//       _logger.severe('getRecentInventoryTransactions Error: $e');

//       return GetRecentInventoryTransactionsResponse();
//     }
//   }
// }
