 import 'package:boardingweek/core/config/enum/notification_type.dart';

class NotificationEntity {
 
  final String image;
  final String title;
  final String body;
  final String timestamp;
final NotificationType type;
  NotificationEntity({
         required this.type,
    required this.image,
    required this.title,
    required this.body,
    required this.timestamp,
  });
}