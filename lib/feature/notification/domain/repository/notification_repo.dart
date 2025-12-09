import 'package:boardingweek/core/utility/failures.dart';
import 'package:boardingweek/feature/notification/domain/entities/paginated_notification.dart';
import 'package:dart_either/dart_either.dart';

abstract class NotificationRepository {
  Future<Either<Failure, PaginatedNotifications>> fetchNotifications({
    required int page,
    required int pageSize,
  });
}
