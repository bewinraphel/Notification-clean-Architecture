import 'package:boardingweek/core/config/enum/notification_type.dart';
import 'package:boardingweek/feature/notification/domain/entities/notification.dart';

class NotificationDto {
  final String image;
  final String title;
  final String body;
  final String timestamp;

  NotificationDto({
    required this.image,
    required this.title,
    required this.body,
    required this.timestamp,
  });

  factory NotificationDto.fromJson(Map<String, dynamic> json) {
    return NotificationDto(
      image: json['image'],
      title: json['title'],
      body: json['body'],
      timestamp: json['timestamp'],
    );
  }

  NotificationEntity toDomain() {
    final typeString = image.split('.').first;
    return NotificationEntity(
      image: image,
      title: title,
      body: body,
      timestamp: timestamp,
      type: NotificationType.fromString(typeString)
    );
  }
}
