 

import 'package:boardingweek/core/utility/failures.dart';
import 'package:boardingweek/feature/notification/domain/entities/paginated_notification.dart';
import 'package:boardingweek/feature/notification/domain/repository/notification_repo.dart';
import 'package:dart_either/dart_either.dart';

class GetNotifications {
  final NotificationRepository repository;
  GetNotifications(this.repository);

    Future<Either<Failure, PaginatedNotifications>>  call({
    required int page,
    required int pageSize,
  }) {
    return repository.fetchNotifications(page: page, pageSize: pageSize);
  }
}
