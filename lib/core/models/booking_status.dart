import 'package:flutter/material.dart';
import 'package:medi_link/generated/l10n.dart';

enum BookingStatus {
  pending,
  approved,
  rejected, 
  completed,
  cancelled, 
}

class BookingStatusHelper {
  static BookingStatus fromString(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return BookingStatus.pending;
      case 'approved':
        return BookingStatus.approved;
      case 'rejected':
        return BookingStatus.rejected;
      case 'completed':
        return BookingStatus.completed;
      case 'cancelled':
        return BookingStatus.cancelled;
      default:
        return BookingStatus.pending;
    }
  }

  static String statusToString(BookingStatus status) {
    return status.name;
  }

  static String getLocalizedStatus(BuildContext context, String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return S.of(context).pending; 
      case 'approved':
        return S.of(context).approve; 
      case 'rejected':
        return S.of(context).reject; 
      case 'completed':
        return S.of(context).completed;
      case 'cancelled':
        return S.of(context).cancelled; 
      default:
        return S.of(context).pending;
    }
  }

  static Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'approved':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      case 'completed':
        return Colors.blue;
      case 'cancelled':
        return Colors.grey;
      default:
        return Colors.orange;
    }
  }

  static IconData getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Icons.hourglass_empty;
      case 'approved':
        return Icons.check_circle;
      case 'rejected':
        return Icons.cancel;
      case 'completed':
        return Icons.task_alt;
      case 'cancelled':
        return Icons.block;
      default:
        return Icons.hourglass_empty;
    }
  }

  static bool canChangeStatus(
    String currentStatus,
    String newStatus,
    bool isDoctor,
  ) {
    final current = fromString(currentStatus);
    final newSt = fromString(newStatus);

    if (isDoctor) {
      switch (current) {
        case BookingStatus.pending:
          return newSt == BookingStatus.approved ||
              newSt == BookingStatus.rejected;
        case BookingStatus.approved:
          return newSt == BookingStatus.completed;
        default:
          return false;
      }
    } else {
      switch (current) {
        case BookingStatus.pending:
        case BookingStatus.approved:
          return newSt == BookingStatus.cancelled;
        default:
          return false;
      }
    }
  }
}
