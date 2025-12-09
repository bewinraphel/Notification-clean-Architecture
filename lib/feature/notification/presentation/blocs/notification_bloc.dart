import 'package:boardingweek/feature/notification/domain/entities/notification.dart';
import 'package:boardingweek/feature/notification/domain/usecase/notification_usecase.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'notification_event.dart';
import 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final GetNotifications getNotifications;

  int page = 1;
  final List<NotificationEntity> masterList = []; // Internal storage
  bool isFetching = false;

  NotificationBloc(this.getNotifications) : super(NotificationInitial()) {
    on<LoadNotifications>((event, emit) async {
      if (isFetching) return;
      isFetching = true;

      // Only show full screen loading for the very first page
      if (page == 1) emit(NotificationLoading());

      // print("DEBUG: Fetching page $page with size 15");

      final result = await getNotifications(page: page, pageSize: 15);

      result.fold(
        ifLeft: (failure) {
          isFetching = false;
          emit(NotificationError(failure.message));
        },
        ifRight: (success) {
          isFetching = false;

          if (success.items.isNotEmpty) {
            masterList.addAll(success.items);
            page++; // Only increment if we actually got data
          }

          // print("DEBUG: New List Size: ${masterList.length}, HasMore: ${success.hasMore}");

          emit(
            NotificationLoaded(
              list: List.from(
                masterList,
              ), // <--- Create NEW list copy to force rebuild
              hasMore: success.hasMore,
            ),
          );
        },
      );
    });
  }
}
