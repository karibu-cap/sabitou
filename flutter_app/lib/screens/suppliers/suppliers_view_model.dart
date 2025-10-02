import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../repositories/suppliers_repository.dart';
import '../../repositories/inventory_repository.dart';
import '../../services/rpc/fake_transport/supplier.dart';

/// ViewModel for suppliers management.
class SuppliersViewModel {
  /// The store id.
  final String storeId;

  /// Gets the filtered status.
  bool isFiltered = false;

  /// Gets the search query subject.
  final _searchQuerySubject = BehaviorSubject<String>.seeded('');

  /// Gets the selected status subject.
  final _selectedStatusSubject = BehaviorSubject<SupplierStatus?>.seeded(null);

  /// The suppliers repository instance.
  final SuppliersRepository _suppliersRepository = SuppliersRepository(
    transport: supplierFakeTransport,
  );

  /// Gets the search query.
  BehaviorSubject<String> get searchQuery => _searchQuerySubject;

  /// Gets the selected status.
  BehaviorSubject<SupplierStatus?> get selectedStatus => _selectedStatusSubject;

  /// Stream of suppliers for reactive UI updates.
  Stream<List<Supplier>> get suppliersStream => _suppliersRepository
      .streamStoreSuppliers(StreamStoreSuppliersRequest(storeId: storeId));

  /// Constructors a new SuppliersViewModel.
  SuppliersViewModel({required this.storeId});

  /// Gets the filtered suppliers stream.
  Stream<List<Supplier>> get filteredSuppliersStream => Rx.combineLatest3(
    suppliersStream,
    _searchQuerySubject.stream,
    _selectedStatusSubject.stream,
    (suppliers, searchQuery, status) {
      var filtered = suppliers.toList();
      if (searchQuery.isNotEmpty) {
        isFiltered = true;
        filtered = filtered
            .where(
              (c) => c.name.toLowerCase().contains(searchQuery.toLowerCase()),
            )
            .toList();
      }
      if (status != null) {
        isFiltered = true;
        filtered = filtered.where((c) => c.status == status).toList();
      }
      if (status == null && searchQuery.isEmpty) {
        isFiltered = false;
      }

      return filtered;
    },
  );

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

  /// Disposes the view model.
  void dispose() {
    _searchQuerySubject.close();
    _selectedStatusSubject.close();
  }

  /// Gets products for a specific supplier.
  Future<List<ProductBySupplier>> getProductsForSupplier(
    String supplierRefId,
    String? storeId,
  ) async {
    final response = await InventoryRepository.instance.getProductsForSupplier(
      supplierRefId,
      storeId,
    );

    return response;
  }
}
