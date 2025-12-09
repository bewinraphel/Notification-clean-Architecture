 import 'package:boardingweek/feature/notification/domain/entities/notification.dart';

class PaginatedNotifications {
  final List<NotificationEntity> items;
  final bool hasMore;
  final int nextPage;

  PaginatedNotifications({
    required this.items,
    required this.hasMore,
    required this.nextPage,
  });
}
