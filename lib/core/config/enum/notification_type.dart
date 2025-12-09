 import 'package:boardingweek/core/constants/appconstants.dart';
import 'package:flutter/material.dart';

enum NotificationType {
  orderAssigned,
  orderDelivered,
  orderCancelled,
  itemUnavailable,
  sale,
  cashback,
  support,
  unknown;

  /// Data-only: No UI-specific logic
  String get assetName {
    switch (this) {
      case NotificationType.orderAssigned:
        return Appconstants.orderAssigned;
      case NotificationType.orderDelivered:
        return Appconstants.orderDelivered;
      case NotificationType.orderCancelled:
        return Appconstants.orderCancelled;
      case NotificationType.itemUnavailable:
        return Appconstants.itemUnavailable;
      case NotificationType.sale:
        return Appconstants.sale;
      case NotificationType.cashback:
        return Appconstants.cashback;
      case NotificationType.support:
        return Appconstants.support;
      case NotificationType.unknown:
        return Appconstants.itemUnavailable;
    }
  }

  /// Pure data color (no widget)
  Color get color {
    switch (this) {
      case NotificationType.orderAssigned:
        return Colors.blue;
      case NotificationType.orderDelivered:
        return Colors.green;
      case NotificationType.orderCancelled:
        return Colors.red;
      case NotificationType.itemUnavailable:
        return Colors.orange;
      case NotificationType.sale:
        return Colors.purple;
      case NotificationType.cashback:
        return Colors.teal;
      case NotificationType.support:
        return Colors.indigo;
      case NotificationType.unknown:
        return Colors.grey;
    }
  }

  /// Dropdown-friendly label
  String get label {
    switch (this) {
      case NotificationType.orderAssigned:
        return "Order Assigned";
      case NotificationType.orderDelivered:
        return "Order Delivered";
      case NotificationType.orderCancelled:
        return "Order Cancelled";
      case NotificationType.itemUnavailable:
        return "Item Unavailable";
      case NotificationType.sale:
        return "Sale";
      case NotificationType.cashback:
        return "Cashback";
      case NotificationType.support:
        return "Support";
      case NotificationType.unknown:
        return "Unknown";
    }
  }

  /// Mapping from string (API) → enum
  static NotificationType fromString(String value) {
    final key = value.trim().toLowerCase();
    switch (key) {
      case "order_assigned":
        return NotificationType.orderAssigned;
      case "order_delivered":
        return NotificationType.orderDelivered;
      case "order_cancelled":
        return NotificationType.orderCancelled;
      case "item_unavailable":
        return NotificationType.itemUnavailable;
      case "sale":
        return NotificationType.sale;
      case "cashback":
        return NotificationType.cashback;
      case "support":
        return NotificationType.support;
      default:
        return NotificationType.unknown;
    }
  }
}
