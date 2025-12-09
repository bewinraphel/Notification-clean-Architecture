import 'package:boardingweek/core/config/router.dart';

import 'package:boardingweek/core/constants/typogrqaphy.dart';
import 'package:boardingweek/core/injection/injection.dart';
import 'package:boardingweek/feature/notification/presentation/blocs/notification_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NotificationBloc>(),
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: TextTheme(
            headlineSmall: AppTextStyle.headlingsmall,
            headlineLarge: AppTextStyle.headlineLarge,
            headlineMedium: AppTextStyle.headlineMedium,
          ),
          fontFamily: 'Quicksand',
        ),
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
