 

import 'package:boardingweek/feature/notification/data/model/notification_dtos.dart';
import 'package:boardingweek/feature/notification/domain/entities/paginated_notification.dart';

class PaginatedNotificationDto {
  final List<NotificationDto> items;
  final bool hasMore;
  final int nextPage;

  PaginatedNotificationDto({
    required this.items,
    required this.hasMore,
    required this.nextPage,
  });

  factory PaginatedNotificationDto.fromJson(Map<String, dynamic> json) {
    return PaginatedNotificationDto(
      items: (json['data'] as List)
          .map((e) => NotificationDto.fromJson(e))
          .toList(),
      hasMore: json['hasMore'],
      nextPage: json['nextPage'],
    );
  }

  PaginatedNotifications toDomain() {
    return PaginatedNotifications(
      items: items.map((e) => e.toDomain()).toList(),
      hasMore: hasMore,
      nextPage: nextPage,
    );
  }
}
