import 'package:boardingweek/core/utility/failures.dart';
import 'package:boardingweek/feature/notification/data/datasource/notification_datasoure.dart';
import 'package:boardingweek/feature/notification/data/model/notification_dtos.dart';
import 'package:boardingweek/feature/notification/domain/entities/paginated_notification.dart';
import 'package:boardingweek/feature/notification/domain/repository/notification_repo.dart';
import 'package:dart_either/dart_either.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource remote;

  // Cache to store the downloaded data so we don't re-download it
  List<NotificationDto>? _cachedData;

  NotificationRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, PaginatedNotifications>> fetchNotifications({
    required int page,
    required int pageSize,
  }) async {
    try {
      print("REPO DEBUG: Requesting Page $page with Size $pageSize");
      // 1. If we haven't downloaded data yet, get it ALL once
      if (_cachedData == null) {
        final rawMapList = await remote.getAll();
        _cachedData = rawMapList
            .map((e) => NotificationDto.fromJson(e))
            .toList();
        print("REPO DEBUG: Total Items Downloaded: ${_cachedData!.length}");
      }

      final totalItems = _cachedData!;

      //  Calculate the "Slice" of data to show
      final start = (page - 1) * pageSize;
      var end = start + pageSize;

      // If we are past the end of the list, return empty
      if (start >= totalItems.length) {
        return Right(
          PaginatedNotifications(items: [], hasMore: false, nextPage: page),
        );
      }

      // Cap the end index so it doesn't crash
      if (end > totalItems.length) end = totalItems.length;

      // Slice the list
      final slicedDtos = totalItems.sublist(start, end);
      print("REPO DEBUG: Returning slice of ${slicedDtos.length} items");
      final entityList = slicedDtos.map((e) => e.toDomain()).toList();
      await Future.delayed(const Duration(seconds: 2));
      return Right(
        PaginatedNotifications(
          items: entityList,
          // If end < total, we still have more data to show -> Spinner Visible
          hasMore: end < totalItems.length,
          nextPage: page + 1,
        ),
      );
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
