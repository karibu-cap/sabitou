import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../repositories/bill_repository.dart';
import '../../../repositories/suppliers_repository.dart';
import '../../../services/internationalization/internationalization.dart';

/// A single mutable line item inside the bill form.
class BillLineItemDraft {
  /// Constructs a [BillLineItemDraft].
  BillLineItemDraft({
    required this.productId,
    required this.description,
    required this.quantity,
    required this.unitPrice,
    this.taxRate = 0.0,
  });

  /// Constructs a [BillLineItemDraft] from a [BillLineItem] proto.
  factory BillLineItemDraft.fromBillLineItem(BillLineItem item) {
    final subtotal = item.quantity * item.unitPrice;
    final rate = subtotal > 0 ? (item.taxAmount / subtotal) * 100 : 0.0;

    return BillLineItemDraft(
      productId: item.productId,
      description: item.description,
      quantity: item.quantity,
      unitPrice: item.unitPrice,
      taxRate: rate,
    );
  }

  /// Constructs a [BillLineItemDraft] from a [PurchaseOrderLineItems] proto.
  factory BillLineItemDraft.fromPoLineItem(PurchaseOrderLineItems item) {
    final name = item.productName.fr.isNotEmpty
        ? item.productName.fr
        : item.productName.en;
    final subtotal = item.quantityOrdered * item.unitPrice;
    final rate = subtotal > 0 ? (item.taxAmount / subtotal) * 100 : 0.0;

    return BillLineItemDraft(
      productId: item.productId,
      description: name,
      quantity: item.quantityOrdered,
      unitPrice: item.unitPrice,
      taxRate: rate,
    );
  }

  /// Constructs a [BillLineItemDraft] from a [PurchaseOrderLineItems] proto
  /// using the full ordered quantity (for yet-to-receive mode billing).
  factory BillLineItemDraft.fromPoLineItemYetToReceive(
    PurchaseOrderLineItems item,
  ) {
    final name = item.productName.fr.isNotEmpty
        ? item.productName.fr
        : item.productName.en;
    final remaining = item.quantityOrdered - item.quantityReceived;
    final subtotal = remaining * item.unitPrice;
    final rate = subtotal > 0 ? (item.taxAmount / subtotal) * 100 : 0.0;

    return BillLineItemDraft(
      productId: item.productId,
      description: name,
      quantity: remaining,
      unitPrice: item.unitPrice,
      taxRate: rate,
    );
  }

  /// The product identifier.
  final String productId;

  /// Display name / description for the line.
  String description;

  /// Quantity ordered (or received, depending on context).
  int quantity;

  /// Unit price (purchase cost price by default).
  double unitPrice;

  /// Tax rate as a percentage (e.g. 19.25 for Cameroon TVA).
  double taxRate;

  /// Sub-total before tax for this line.
  double get subtotal => quantity * unitPrice;

  /// Tax amount for this line.
  double get taxAmount => subtotal * (taxRate / 100);

  /// Total including tax for this line.
  double get total => subtotal + taxAmount;

  /// Converts this draft back to a [BillLineItem] proto.
  BillLineItem toProto() => BillLineItem(
    productId: productId,
    description: description,
    quantity: quantity,
    unitPrice: unitPrice,
    taxAmount: taxAmount,
    total: total,
  );
}

/// Controller that owns all mutable state for the bill create / edit form.
class BillFormController extends ChangeNotifier {
  /// Constructs a [BillFormController].
  ///
  /// Exactly one initialisation path should be used per instance:
  ///
  /// * [purchaseOrder] **only** → full PO quantities, editable.
  /// * [purchaseOrder] + [yetToReceiveMode] → only unreceived items, editable.
  /// * [purchaseOrder] + [receivingNotes] → items from the selected receives,
  ///   [quantityLocked] = `true`.
  /// * [existingBill] → edit mode.
  BillFormController({
    required this.storeId,
    PurchaseOrder? purchaseOrder,
    Bill? existingBill,
    List<ReceivingNote>? receivingNotes,
    bool yetToReceiveMode = false,
  }) : _isEditMode = existingBill != null {
    supplierIdController = TextEditingController();
    supplierNameController = TextEditingController();
    poRefController = TextEditingController();
    notesController = TextEditingController();
    currencyController = TextEditingController(text: 'XAF');

    if (receivingNotes != null && purchaseOrder != null) {
      _initFromReceivingNotes(receivingNotes, purchaseOrder);
    } else if (purchaseOrder != null) {
      _initFromPurchaseOrder(purchaseOrder, yetToReceive: yetToReceiveMode);
    } else if (existingBill != null) {
      _initFromBill(existingBill);
    }
  }

  /// The store identifier used when saving.
  final String storeId;

  final bool _isEditMode;

  /// When `true`, the quantity field on each line item is read-only.
  ///
  /// Set automatically when the form is initialised from receiving notes so
  /// the user cannot change quantities that were physically counted on receipt.
  bool quantityLocked = false;

  final _repo = BillRepository.instance;

  /// Controller for the supplier ID field.
  late TextEditingController supplierIdController;

  /// Controller for the supplier name display field.
  late final TextEditingController supplierNameController;

  /// Controller for the related purchase order ref field.
  late final TextEditingController poRefController;

  /// Controller for the notes field.
  late final TextEditingController notesController;

  /// Controller for the currency selector.
  late final TextEditingController currencyController;

  String? _editingBillRefId;

  /// Bill date (defaults to today).
  DateTime billDate = DateTime.now();

  /// Due date (defaults to today + 30 days).
  DateTime dueDate = DateTime.now().add(const Duration(days: 30));

  /// `true` when the supplier field is locked (pre-filled from a PO).
  bool supplierLocked = false;

  /// `true` when the purchase field is locked (pre-filled from a PO).
  bool poLocked = false;

  /// Current list of line items in the form.
  final List<BillLineItemDraft> items = [];

  bool _isLoading = false;
  String _errorMessage = '';

  /// `true` when editing an existing bill.
  bool get isEditMode => _isEditMode;

  /// `true` while a save operation is in progress.
  bool get isLoading => _isLoading;

  /// The last error message from a failed save.
  String get errorMessage => _errorMessage;

  /// Sum of all line subtotals before tax.
  double get subTotal => items.fold(0, (sum, i) => sum + i.subtotal);

  /// Sum of all tax amounts across all lines.
  double get taxTotal => items.fold(0, (sum, i) => sum + i.taxAmount);

  /// Grand total including tax.
  double get totalAmount => subTotal + taxTotal;

  void _initFromPurchaseOrder(PurchaseOrder po, {bool yetToReceive = false}) {
    poRefController.text = po.refId;
    supplierIdController.text = po.supplierId;
    supplierNameController.text = po.supplierName;
    supplierLocked = true;
    poLocked = true;
    if ((po.currency).isNotEmpty) {
      currencyController.text = po.currency;
    }

    for (final line in po.items) {
      if (yetToReceive) {
        // Include all items, but use remaining quantity (ordered - received)
        items.add(BillLineItemDraft.fromPoLineItemYetToReceive(line));
      } else {
        items.add(BillLineItemDraft.fromPoLineItem(line));
      }
    }
  }

  /// Initialises from [receivingNotes], creating separate line items for each
  /// receiving note item. Sets [quantityLocked] = `true`.
  void _initFromReceivingNotes(
    List<ReceivingNote> receivingNotes,
    PurchaseOrder po,
  ) {
    poRefController.text = po.refId;
    supplierIdController.text = po.supplierId;
    supplierNameController.text = po.supplierName;
    supplierLocked = true;
    if ((po.currency).isNotEmpty) {
      currencyController.text = po.currency;
    }

    // Create separate line items for each receiving note item
    for (final note in receivingNotes) {
      for (final lineItem in note.items) {
        if (lineItem.quantityReceived <= 0) continue;

        // Resolve product name from the PO
        final poItem = po.items.cast<PurchaseOrderLineItems?>().firstWhere(
          (i) => i?.productId == lineItem.productId,
          orElse: () => null,
        );
        final name = poItem != null
            ? (poItem.productName.fr.isNotEmpty
                  ? poItem.productName.fr
                  : poItem.productName.en)
            : lineItem.productId;

        // Calculate tax rate based on PO item or default to 0
        final taxRate = poItem != null && poItem.quantityOrdered > 0
            ? (poItem.taxAmount / (poItem.quantityOrdered * poItem.unitPrice)) *
                  100
            : 0.0;

        items.add(
          BillLineItemDraft(
            productId: lineItem.productId,
            description: name,
            quantity: lineItem.quantityReceived.toInt(),
            unitPrice: lineItem.purchasePrice,
            taxRate: taxRate,
          ),
        );
      }
    }

    quantityLocked = true;
    poLocked = true;
  }

  void _initFromBill(Bill bill) {
    _editingBillRefId = bill.refId;
    poRefController.text = bill.relatedPurchaseOrderId;
    supplierIdController.text = bill.supplierId;
    supplierNameController.text = bill.supplierId;
    billDate = bill.billDate.toDateTime().toLocal();
    dueDate = bill.dueDate.toDateTime().toLocal();
    currencyController.text = bill.currency.isNotEmpty ? bill.currency : 'XAF';
    notesController.text = bill.notes;
    for (final item in bill.items) {
      items.add(BillLineItemDraft.fromBillLineItem(item));
    }
  }

  /// Appends [item] to the items list.
  void addItem(BillLineItemDraft item) {
    items.add(item);
    notifyListeners();
  }

  /// Removes the item at [index].
  void removeItem(int index) {
    if (index >= 0 && index < items.length) {
      items.removeAt(index);
      notifyListeners();
    }
  }

  /// Replaces the item at [index] with [updated].
  void updateItem(int index, BillLineItemDraft updated) {
    if (index >= 0 && index < items.length) {
      items[index] = updated;
      notifyListeners();
    }
  }

  /// Updates [billDate] and notifies listeners.
  void setBillDate(DateTime date) {
    billDate = date;
    notifyListeners();
  }

  /// Updates [dueDate] and notifies listeners.
  void setDueDate(DateTime date) {
    dueDate = date;
    notifyListeners();
  }

  /// Returns an error message string, or `null` when the form is valid.
  String? validate() {
    if (supplierIdController.text.trim().isEmpty) {
      return Intls.to.supplierRequired;
    }
    if (items.isEmpty) {
      return Intls.to.atLeastOneItemRequired;
    }
    for (final item in items) {
      if (item.quantity <= 0) return Intls.to.invalidQuantity;
      if (item.unitPrice < 0) return Intls.to.invalidPrice;
    }

    return null;
  }

  /// Searches suppliers by [name] within [storeId].
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

  /// Creates or updates the bill.
  ///
  /// Returns `true` on success, `null` when validation fails, and does not
  /// return `false` (failures set [errorMessage] and return `null`).
  Future<bool?> save() async {
    final validationError = validate();
    if (validationError != null) {
      _errorMessage = validationError;
      notifyListeners();

      return null;
    }

    _setLoading(true);

    final protoItems = items.map((i) => i.toProto()).toList();
    final currency = currencyController.text.trim().isNotEmpty
        ? currencyController.text.trim()
        : 'XAF';

    if (_isEditMode && _editingBillRefId != null) {
      final ok = await _repo.updateBill(
        Bill(
          refId: _editingBillRefId ?? '',
          supplierId: supplierIdController.text.trim(),
          relatedPurchaseOrderId: poRefController.text.trim(),
          items: protoItems,
          subTotal: subTotal,
          taxTotal: taxTotal,
          totalAmount: totalAmount,
          balanceDue: totalAmount,
          currency: currency,
          billDate: Timestamp.fromDateTime(billDate),
          dueDate: Timestamp.fromDateTime(dueDate),
          notes: notesController.text.trim(),
        ),
      );
      _setLoading(false);
      if (!ok) {
        _errorMessage = Intls.to.failedToUpdateBill;
        notifyListeners();

        return null;
      }

      return true;
    }

    final ok = await _repo.createBill(
      Bill(
        storeId: storeId,
        supplierId: supplierIdController.text.trim(),
        relatedPurchaseOrderId: poRefController.text.trim(),
        items: protoItems,
        subTotal: subTotal,
        taxTotal: taxTotal,
        totalAmount: totalAmount,
        balanceDue: totalAmount,
        currency: currency,
        billDate: Timestamp.fromDateTime(billDate),
        dueDate: Timestamp.fromDateTime(dueDate),
        notes: notesController.text.trim(),
        status: BillStatus.BILL_STATUS_OPEN,
      ),
    );

    _setLoading(false);

    return ok ? true : null;
  }

  /// Clears the current error message.
  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }

  void _setLoading(bool v) {
    _isLoading = v;
    notifyListeners();
  }

  @override
  void dispose() {
    supplierIdController.dispose();
    supplierNameController.dispose();
    poRefController.dispose();
    notesController.dispose();
    currencyController.dispose();
    super.dispose();
  }
}
