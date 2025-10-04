//
//  Generated code. Do not modify.
//  source: audits/v1/audits.proto
//

import "package:connectrpc/connect.dart" as connect;
import "audits.pb.dart" as auditsv1audits;

abstract final class AuditsService {
  /// Fully-qualified name of the AuditsService service.
  static const name = 'audits.v1.AuditsService';

  static const getInventoryTransactionAuditLogs = connect.Spec(
    '/$name/GetInventoryTransactionAuditLogs',
    connect.StreamType.unary,
    auditsv1audits.GetInventoryTransactionAuditLogsRequest.new,
    auditsv1audits.GetInventoryTransactionAuditLogsResponse.new,
  );

  static const getVoucherTransactionAuditLogs = connect.Spec(
    '/$name/GetVoucherTransactionAuditLogs',
    connect.StreamType.unary,
    auditsv1audits.GetVoucherTransactionAuditLogsRequest.new,
    auditsv1audits.GetVoucherTransactionAuditLogsResponse.new,
  );
}
