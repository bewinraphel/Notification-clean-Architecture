import 'package:boardingweek/core/config/enum/enum.dart';
import 'package:boardingweek/core/debug/debug.dart';
import 'package:boardingweek/feature/account/presentation/screens/account_screen.dart';
import 'package:boardingweek/feature/cart/presentation/screens/cart_screen.dart';
import 'package:boardingweek/feature/home/presentation/screens/home_screen.dart';
import 'package:boardingweek/feature/myorder/presentation/screens/my_order.dart';
import 'package:boardingweek/feature/navigation/presentation/screens/main_screen.dart';
import 'package:boardingweek/feature/notification/presentation/screens/notification.dart';
import 'package:flutter/material.dart' hide Notification;
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppTab.home.path,
  observers: [DebugObserver()],
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/notification',
      name: 'notification',
      builder: (context, state) {
        final notificationId = state.extra as String?;
        return Notification(notificationId: notificationId);
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainWrapperScreen(navigationShell: navigationShell);
      },

      branches: [
        // Branch 1: Home
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppTab.home.path,
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        // Branch 2: CartScreen
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppTab.cart.path,
              builder: (context, state) => const CartScreen(),
            ),
          ],
        ),
        // Branch 3: MyOrder
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppTab.myorder.path,
              builder: (context, state) => const MyOrder(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppTab.account.path,
              builder: (context, state) => const AccountScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
