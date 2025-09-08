import 'dart:async';

import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../repositories/products_repository.dart';
import '../../../repositories/suppliers_repository.dart';

/// ViewModel for suppliers management.
class SuppliersViewModel {
  /// The business id.
  final String businessId;

  /// The suppliers repository instance.
  final SuppliersRepository _suppliersRepository = SuppliersRepository.instance;

  /// The products repository instance.
  final ProductsRepository _productsRepository = ProductsRepository.instance;

  /// Stream of suppliers for reactive UI updates.
  Stream<List<Supplier>> get suppliersStream =>
      _suppliersRepository.streamBusinessSuppliers(
        GetBusinessSuppliersRequest(businessId: businessId),
      );

  /// Stream of products for reactive UI updates.
  Stream<List<BusinessProduct>> get productsStream =>
      _productsRepository.streamBusinessProducts(
        StreamBusinessProductsRequest(businessId: businessId),
      );

  /// Construts a new SuppliersViewModel.
  SuppliersViewModel({required this.businessId});

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

  /// Deletes a supplier by ID.
  Future<bool> deleteSupplier(String supplierId) async {
    return await _suppliersRepository.deleteSupplier(
      DeleteSupplierRequest(supplierId: supplierId),
    );
  }
}
