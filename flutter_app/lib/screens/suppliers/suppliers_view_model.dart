import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../repositories/suppliers_repository.dart';

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

  /// Gets the completer.
  final Completer<bool> completer = Completer<bool>();

  /// The suppliers repository instance.
  final SuppliersRepository _suppliersRepository = SuppliersRepository.instance;

  /// Gets the search query.
  BehaviorSubject<String> get searchQuery => _searchQuerySubject;

  /// Gets the selected status.
  BehaviorSubject<SupplierStatus?> get selectedStatus => _selectedStatusSubject;

  /// Stream of suppliers for reactive UI updates.
  Stream<List<Supplier>> get suppliersStream =>
      _suppliersRepository.streamStoreSuppliers(storeId);

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
    final supplierId = await _suppliersRepository.createSupplier(supplier);
    if (supplierId == null) {
      return false;
    }

    return true;
  }

  /// Updates an existing supplier.
  Future<bool> updateSupplier(Supplier supplier) async {
    await _suppliersRepository.updateSupplier(supplier);

    return true;
  }

  /// Deletes a supplier by ID.
  Future<bool> deleteSupplier(String supplierId) async {
    return await _suppliersRepository.deleteSupplier(supplierId);
  }

  /// Disposes the view model.
  void dispose() {
    _searchQuerySubject.close();
    _selectedStatusSubject.close();
  }
}
