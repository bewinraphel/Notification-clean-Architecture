 
import 'package:boardingweek/core/constants/color.dart';

import 'package:boardingweek/feature/notification/presentation/blocs/notification_bloc.dart';
import 'package:boardingweek/feature/notification/presentation/blocs/notification_event.dart';

import 'package:boardingweek/feature/notification/presentation/screens/widget/widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Notification extends StatefulWidget {
  final String? notificationId;
  const Notification({super.key, this.notificationId});

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  final controller = ScrollController();
  @override
  void initState() {
    super.initState();
    context.read<NotificationBloc>().add(LoadNotifications());
    controller.addListener(_onScroll);
  }

  void _onScroll() {
    if (controller.position.pixels >=
        controller.position.maxScrollExtent * 0.9) {
      context.read<NotificationBloc>().add(LoadNotifications());
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: Column(
            children: [
              AppbarSection(),
              Expanded(child: NotificationSection(controller: controller)),
            ],
          ),
        ),
      ),
    );
  }
}
