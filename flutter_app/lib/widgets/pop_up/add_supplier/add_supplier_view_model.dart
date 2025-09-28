import 'dart:async';

import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../repositories/suppliers_repository.dart';
import '../../../services/rpc/fake_transport/supplier.dart';

/// ViewModel for add supplier management.
class AddSupplierViewModel {
  /// The suppliers repository instance.
  final SuppliersRepository _suppliersRepository = SuppliersRepository(
    transport: supplierFakeTransport,
  );

  /// Constructors a new AddSupplierViewModel.
  AddSupplierViewModel();

  /// Add a new supplier
  Future<bool> addSupplier(Supplier supplier) async {
    final request = CreateSupplierRequest(supplier: supplier);
    final supplierId = await _suppliersRepository.createSupplier(request);
    if (supplierId == null) {
      return false;
    }

    return true;
  }

  /// Updates an existing supplier.
  Future<bool> updateSupplier(Supplier supplier) async {
    final request = UpdateSupplierRequest(supplier: supplier);
    final updatedSupplier = await _suppliersRepository.updateSupplier(request);
    if (updatedSupplier == null) {
      return false;
    }

    return true;
  }
}
