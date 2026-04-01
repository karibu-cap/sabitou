import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../core/database/query/sql_condition.dart';
import '../../../repositories/bill_repository.dart';
import '../../../repositories/payments_repository.dart';
import '../../../repositories/suppliers_repository.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../services/powersync/schema.dart';

/// The payment form controller.
class PaymentFormController extends ChangeNotifier {
  /// Constructor of new [PaymentFormController].
  PaymentFormController({
    required this.storeId,
    required this.userId,
    this.bill,
  }) {
    _init();
  }

  String _errorMessage = '';
  bool _isLoading = false;
  double? _amount;

  /// The selected supplier id.
  String? selectedSupplierId;

  /// The store id.
  final String storeId;

  /// The currently logged in user id.
  final String userId;

  /// The bill object if opened from a specific bill context.
  final Bill? bill;

  /// The selected payment method.
  PaymentMethod? selectedPaymentMethod;

  /// The payment date.
  DateTime paymentDate = DateTime.now();

  /// The reference number.
  String referenceNumber = '';

  /// The notes.
  String notes = '';

  /// The [targetBillsAmounts].
  Map<String, double> targetBillsAmounts = {};

  /// State for multiple bills
  List<Bill> _supplierBills = [];
  List<Bill> get supplierBills => List.unmodifiable(_supplierBills);

  /// Loading state.
  bool get isLoading => _isLoading;

  /// Error message state.
  String get errorMessage => _errorMessage;

  /// Known constraint.
  bool get isBillKnown => bill != null;

  /// Returns the selected payment amount.
  double? get amount {
    if (isBillKnown) return _amount;
    final sum = targetBillsAmounts.values.fold(0.0, (a, b) => a + b);

    return sum > 0 ? sum : null;
  }

  Future<void> _init() async {
    _setLoading(true);

    if (isBillKnown) {
      selectedSupplierId = bill?.supplierId;
      _amount = bill?.balanceDue;
    }

    _setLoading(false);
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// Selects the supplier and fetches their unpaid bills.
  Future<void> selectSupplier(String supplierId) async {
    selectedSupplierId = supplierId;
    _setLoading(true);

    try {
      final bills = await BillRepository.instance.filteBills([
        SqlQuery.equals(BillsFields.supplierId, supplierId),
        SqlQuery.equals(BillsFields.storeId, storeId),
        SqlQuery.whereIn(BillsFields.status, [
          BillStatus.BILL_STATUS_OPEN.name,
          BillStatus.BILL_STATUS_OVERDUE.name,
          BillStatus.BILL_STATUS_PARTIALLY_PAID.name,
        ]),
      ]);
      _supplierBills = bills;
      targetBillsAmounts.clear();
      notifyListeners();
    } catch (e) {
      _errorMessage = Intls.to.unknownError;
    }

    _setLoading(false);
  }

  /// Query the suppliers.
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

  /// Updates the payment amount exclusively for a
  /// single bill when unknown context.
  void setBillPaymentAmount(String billId, double value) {
    if (value <= 0) {
      targetBillsAmounts.remove(billId);
    } else {
      targetBillsAmounts[billId] = value;
    }
    // notifyListeners();
  }

  /// Selects the payment method.
  void selectPaymentMethod(PaymentMethod method) {
    selectedPaymentMethod = method;
    notifyListeners();
  }

  /// Sets the payment amount. (Only used if the bill is known)
  void setAmount(double value) {
    _amount = value;
    notifyListeners();
  }

  /// Sets the payment date.
  void setPaymentDate(DateTime date) {
    paymentDate = date;
    notifyListeners();
  }

  /// Clears error message.
  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }

  /// Validates and saves the payment.
  Future<bool?> save() async {
    if (selectedSupplierId == null || selectedSupplierId?.isEmpty == true) {
      _errorMessage = Intls.to.requiredField;
      notifyListeners();

      return null;
    }

    if (amount == null || (amount ?? 0) <= 0) {
      _errorMessage = Intls.to.validationFailed;
      notifyListeners();

      return null;
    }

    if (selectedPaymentMethod == null ||
        selectedPaymentMethod == PaymentMethod.PAYMENT_METHOD_UNSPECIFIED) {
      _errorMessage = Intls.to.requiredField;
      notifyListeners();

      return null;
    }
    final bill = this.bill;

    if (isBillKnown && bill != null) {
      if ((amount ?? 0) > (bill.balanceDue)) {
        _errorMessage = Intls.to.amountExceedsBalanceDue;
        notifyListeners();

        return null;
      }
    }

    _setLoading(true);

    // Build the relatedDocs list from the bill allocations
    final relatedDocs = isBillKnown && bill != null
        ? [PaymentRelatedDoc(docId: bill.refId, amount: (amount ?? 0))]
        : targetBillsAmounts.entries
              .map((e) => PaymentRelatedDoc(docId: e.key, amount: e.value))
              .toList();

    // Create Payment object
    final payment = Payment(
      payerId: storeId,
      receiverRef: selectedSupplierId,
      amount: amount,
      paymentMethod: selectedPaymentMethod,
      status: selectedPaymentMethod == PaymentMethod.PAYMENT_METHOD_CASH
          ? PaymentStatus.PAYMENT_STATUS_COMPLETED
          : PaymentStatus.PAYMENT_STATUS_PENDING,
      paymentDate: Timestamp.fromDateTime(paymentDate),
      referenceNumber: referenceNumber,
      warehouseId: storeId,
      currency: 'XAF',
      createdByUserId: userId,
      notes: notes,
      relatedDocs: relatedDocs,
    );

    try {
      final createdPayment = await PaymentsRepository.instance.createPayment(
        payment,
      );

      if (createdPayment != null) {
        if (isBillKnown && bill != null) {
          final success = await BillRepository.instance.applyPayment(
            bill.refId,
            createdPayment,
          );
          _setLoading(false);

          return success;
        } else {
          bool allSuccess = true;
          // applyPayment now reads the amount from createdPayment.relatedDocs
          for (final billId in targetBillsAmounts.keys) {
            final success = await BillRepository.instance.applyPayment(
              billId,
              createdPayment,
            );
            if (!success) allSuccess = false;
          }
          _setLoading(false);

          return allSuccess;
        }
      }

      _setLoading(false);

      return createdPayment != null;
    } catch (e) {
      _errorMessage = Intls.to.unknownError;
      _setLoading(false);

      return false;
    }
  }
}
