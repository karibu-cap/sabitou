//
//  Generated code. Do not modify.
//  source: audits/v1/audits.proto
//

import "package:connectrpc/connect.dart" as connect;
import "audits.pb.dart" as auditsv1audits;
import "audits.connect.spec.dart" as specs;

extension type AuditsServiceClient (connect.Transport _transport) {
  Future<auditsv1audits.GetInventoryTransactionAuditLogsResponse> getInventoryTransactionAuditLogs(
    auditsv1audits.GetInventoryTransactionAuditLogsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.AuditsService.getInventoryTransactionAuditLogs,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  Future<auditsv1audits.GetVoucherTransactionAuditLogsResponse> getVoucherTransactionAuditLogs(
    auditsv1audits.GetVoucherTransactionAuditLogsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.AuditsService.getVoucherTransactionAuditLogs,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
