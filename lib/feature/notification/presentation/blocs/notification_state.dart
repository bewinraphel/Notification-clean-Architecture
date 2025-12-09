import 'package:boardingweek/feature/notification/domain/entities/notification.dart';

 

abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final List<NotificationEntity> list;
  final bool hasMore;
  NotificationLoaded({required this.list, required this.hasMore});
}

class NotificationError extends NotificationState {
  final String msg;
  NotificationError(this.msg);
}
