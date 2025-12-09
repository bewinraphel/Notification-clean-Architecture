import 'package:boardingweek/core/config/enum/enum.dart';
import 'package:boardingweek/core/constants/color.dart';
import 'package:boardingweek/core/constants/typogrqaphy.dart';
import 'package:boardingweek/core/extensions/integer-sizedbox_extension.dart';
import 'package:boardingweek/core/extensions/padding_extension.dart';
import 'package:boardingweek/core/utility/date.dart';
import 'package:boardingweek/core/utility/responsive.dart';

import 'package:boardingweek/feature/notification/domain/entities/notification.dart';
import 'package:boardingweek/feature/notification/presentation/blocs/notification_bloc.dart';
import 'package:boardingweek/feature/notification/presentation/blocs/notification_state.dart';
import 'package:boardingweek/feature/notification/presentation/screens/widget/simmertile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NotificationTile extends StatelessWidget {
  final NotificationEntity notification;
  final VoidCallback onTap;

  const NotificationTile({
    super.key,
    required this.notification,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final item = notification.type;

    return ListTile(
      onTap: onTap,
      tileColor: AppColors.white,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: item.color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: SizedBox(
          height: Responsive.h(30),
          width: Responsive.w(30),
          child: Image.asset(item.assetName, fit: BoxFit.cover),
        ),
      ),
      title: Text(notification.title, style: AppTextStyle.trendincardtext),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(notification.body, style: AppTextStyle.notification),
          const SizedBox(height: 4),
          Text(
            formatTimeAgo(notification.timestamp),
            style: AppTextStyle.notification,
          ),
        ],
      ),
    );
  }
}

class AppbarSection extends StatelessWidget {
  const AppbarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (context.canPop()) {
          context.pop();
        } else {
          context.go(AppTab.home.path);
        }
      },
      // CRITICAL: Makes the empty space in the container clickable
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.black.withAlpha(27), width: 2),
          ),
        ),
        height: Responsive.h(101),
        child: Column(
          children: [
            48.hGap,
            Row(
              children: [
                Padding(
                  padding: 18.leftPad,
                  child: Container(
                    height: Responsive.h(35),
                    width: Responsive.w(35),
                    decoration: const BoxDecoration(
                      color: AppColors.button,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back,
                        size: Responsive.f(30),
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: 18.leftPad,
                  child: Text(
                    'Notification',
                    style: AppTextStyle.headlineMedium,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationSection extends StatelessWidget {
  const NotificationSection({super.key, required this.controller});

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
        if (state is NotificationLoading) {
          return ListView.builder(
            itemCount: 10,

            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return const NotificationShimmerTile();
            },
          );
        }

        if (state is NotificationLoaded) {
          if (state.list.isEmpty) {
            return const Center(child: Text('No notifications found'));
          }

          return ListView.builder(
            controller: controller,

            physics: const AlwaysScrollableScrollPhysics(),

            itemCount: state.hasMore
                ? state.list.length + 1
                : state.list.length,

            itemBuilder: (context, i) {
              if (i >= state.list.length) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              final item = state.list[i];
              return NotificationTile(notification: item, onTap: () {});
            },
          );
        }

        if (state is NotificationError) {
          return Center(child: Text(state.msg));
        }

        return const Center(child: Text("Something went wrong!"));
      },
    );
  }
}
