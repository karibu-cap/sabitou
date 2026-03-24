import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../repositories/bill_repository.dart';
import '../../../utils/logger.dart';

/// View model for bill detail screen.
class BillDetailViewModel {
  final LoggerApp _logger = LoggerApp('BillDetailViewModel');

  /// The bill ID to fetch.
  final String billId;

  /// Gets the bill item subject.
  final _billItemSubject = BehaviorSubject<Bill?>.seeded(null);

  /// Gets the error subject.
  final _errorSubject = BehaviorSubject<String>.seeded('');

  /// Gets the completer.
  final Completer<bool> completer = Completer<bool>();

  /// Gets the bill item stream.
  BehaviorSubject<Bill?> get billItemStream => _billItemSubject;

  /// Gets the error stream.
  Stream<String> get errorStream => _errorSubject.stream;

  /// Constructor of [BillDetailViewModel].
  BillDetailViewModel({required this.billId}) {
    _initData();
  }

  /// Initializes the data by fetching the specific product.
  Future<void> _initData() async {
    try {
      _logger.info('Fetching bill details for: $billId');

      final bill = await BillRepository.instance.getBill(billId);

      _billItemSubject.add(bill);
    } on Exception catch (e) {
      _logger.severe('Error loading product details: $e');
      _errorSubject.add(e.toString());
    } finally {
      if (!completer.isCompleted) {
        completer.complete(true);
      }
    }
  }

  /// Refreshes the product data.
  Future<void> refresh() async {
    await _initData();
  }

  /// Disposes the view model.
  void dispose() {
    _errorSubject.close();
  }
}
