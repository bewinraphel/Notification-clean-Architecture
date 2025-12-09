import 'package:boardingweek/core/dio/dioclient.dart';
import 'package:boardingweek/feature/notification/data/datasource/notification_datasoure.dart';
import 'package:boardingweek/feature/notification/data/repository/notificatiuon_respo_impli.dart';
import 'package:boardingweek/feature/notification/domain/repository/notification_repo.dart';
import 'package:boardingweek/feature/notification/domain/usecase/notification_usecase.dart';
import 'package:boardingweek/feature/notification/presentation/blocs/notification_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  sl.registerSingleton(DioClient().dio);

  sl.registerLazySingleton(() => NotificationRemoteDataSource(sl()));
  sl.registerLazySingleton<NotificationRepository>(
    () => NotificationRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => GetNotifications(sl()));

  sl.registerFactory<NotificationBloc>(() => NotificationBloc(sl()));
}
