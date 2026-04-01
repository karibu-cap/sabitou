import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../repositories/purchase_order_repository.dart';
import '../../../repositories/store_products_repository.dart';
import '../../../repositories/suppliers_repository.dart';
import '../../../services/internationalization/internationalization.dart';

/// A draft representation of a purchase order item.
class PurchaseOrderLineItemDraft {
  /// Create a new draft item.
  PurchaseOrderLineItemDraft({
    required this.productId,
    required this.globalProduct,
    this.quantity = 1,
    this.unitPrice = 0.0,
  });

  /// The product ref ID.
  final String productId;

  /// The global product name.
  final GlobalProduct globalProduct;

  /// The quantity to order.
  final int quantity;

  /// The unit price of the product.
  final double unitPrice;

  /// The total price of this line item.
  double get total => quantity * unitPrice;
}

/// The controller managing the state of the purchase order form.
class PurchaseOrderFormController extends ChangeNotifier {
  /// Create a new controller.
  PurchaseOrderFormController({required this.storeId});

  /// The store ID for the current purchase order.
  final String storeId;

  /// Supplier ID text controller.
  final supplierIdController = TextEditingController();

  /// Supplier Name text controller.
  final supplierNameController = TextEditingController();

  /// Destination Address text controller.
  final destinationAddressController = TextEditingController();

  /// Notes text controller.
  final notesController = TextEditingController();

  /// The expected delivery date.
  DateTime expectedDeliveryDate = DateTime.now().add(const Duration(days: 7));

  final List<PurchaseOrderLineItemDraft> _items = [];
  bool _isLoading = false;
  String _errorMessage = '';

  /// Ensure items are unmodifiable.
  List<PurchaseOrderLineItemDraft> get items => List.unmodifiable(_items);

  /// Is the form in a loading state.
  bool get isLoading => _isLoading;

  /// Any user validation error message.
  String get errorMessage => _errorMessage;

  /// Compute total amount from items.
  double get totalAmount => _items.fold(0, (sum, item) => sum + item.total);

  /// Change the local expected delivery date.
  void setDeliveryDate(DateTime date) {
    expectedDeliveryDate = date;
    notifyListeners();
  }

  /// Add a new item to the order draft.
  void addItem(PurchaseOrderLineItemDraft item) {
    _items.add(item);
    notifyListeners();
  }

  /// Update a specific item in the draft list.
  void updateItem(int index, PurchaseOrderLineItemDraft item) {
    _items[index] = item;
    notifyListeners();
  }

  /// Remove an item from the draft list by index.
  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  /// Fetch a list of suppliers via the name query.
  Future<List<Supplier>> searchSuppliers(String query) async {
    if (query.isEmpty) {
      return SuppliersRepository.instance.getSuppliersByStore(storeId);
    }

    return SuppliersRepository.instance.searchSuppliers(
      query: query,
      storeId: storeId,
    );
  }

  /// Fetch a list of products via the name query.
  Future<List<StoreProductWithGlobalProduct>> searchProducts({
    required String name,
  }) async {
    final response = await StoreProductsRepository.instance.searchProducts(
      SearchStoreProductsRequest(searchQuery: name, storeId: storeId),
    );

    return response;
  }

  /// Reset current err message to empty string.
  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }

  /// Validate the items and form entries before submission.
  bool validate() {
    if (supplierIdController.text.isEmpty) {
      _errorMessage = Intls.to.isRequiredField.trParams({
        'field': Intls.to.supplier,
      });
      notifyListeners();

      return false;
    }
    if (_items.isEmpty) {
      _errorMessage = Intls.to.atLeastOneItemRequired;
      notifyListeners();

      return false;
    }
    _errorMessage = '';
    notifyListeners();

    return true;
  }

  /// Convert the draft objects into protobuf domain objects for RPC usage.
  List<PurchaseOrderLineItems> buildProtoItems() {
    return _items.map((draft) {
      return PurchaseOrderLineItems(
        productId: draft.productId,
        productName: draft.globalProduct.name,
        quantityOrdered: draft.quantity,
        unitPrice: draft.unitPrice,
        total: draft.total,
        storeId: storeId,
      );
    }).toList();
  }

  Future<String?> createPurchaseOrder({
    required String supplierId,
    required String supplierName,
    required String storeName,
    required String storeId,
    required String createdByUserId,
    required List<PurchaseOrderLineItems> items,
    required DateTime expectedDeliveryDate,
    String notes = '',
    String destinationAddress = '',
  }) async {
    _setLoading(true);
    clearError();

    double totalAmount = 0.0;
    double subTotal = 0.0;
    double taxTotal = 0.0;

    for (final item in items) {
      subTotal += item.total;
      taxTotal += item.taxAmount;
      totalAmount += item.total + item.taxAmount;
    }

    final request = PurchaseOrder(
      supplierId: supplierId,
      storeId: storeId,
      items: items,
      expectedDeliveryDate: Timestamp.fromDateTime(expectedDeliveryDate),
      createdByUserId: createdByUserId,
      notes: notes,
      destinationAddress: destinationAddress,
      createdAt: Timestamp.fromDateTime(DateTime.now()),
      orderDate: Timestamp.fromDateTime(DateTime.now()),
      supplierName: supplierName,
      storeName: storeName,
      subTotal: subTotal,
      totalAmount: totalAmount,
      taxTotal: taxTotal,
      status: PurchaseOrderStatus.PO_STATUS_PENDING,
      currency: 'XAF',
    );

    final response = await PurchaseOrderRepository.instance.createPurchaseOrder(
      request,
    );

    _setLoading(false);

    return response;
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  @override
  void dispose() {
    supplierIdController.dispose();
    supplierNameController.dispose();
    destinationAddressController.dispose();
    notesController.dispose();
    super.dispose();
  }
}
