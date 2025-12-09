import 'package:boardingweek/core/config/enum/enum.dart';
import 'package:boardingweek/core/constants/color.dart';
import 'package:boardingweek/core/utility/responsive.dart';
import 'package:boardingweek/feature/navigation/presentation/bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MainWrapperScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainWrapperScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationBloc(),
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 1,
                color: AppColors.black.withValues(alpha: 0.2),
                offset: const Offset(0, -1),
                spreadRadius: 0.0,
              ),
            ],
          ),
          child: NavigationBar(
            backgroundColor: AppColors.white,
            indicatorColor: AppColors.white,
            selectedIndex: navigationShell.currentIndex,

            onDestinationSelected: (index) {
              navigationShell.goBranch(
                index,
                initialLocation: index == navigationShell.currentIndex,
              );
              context.read<NavigationBloc>().add(
                NavigationTabChanged(AppTab.values[index]),
              );
            },
            destinations: AppTab.values.map((tab) {
              return NavigationDestination(
                icon: Icon(
                  tab.icon,
                  fontWeight: FontWeight.w500,
                  size: Responsive.f(29),
                ),
                selectedIcon: Icon(
                  tab.icon,
                  color: AppColors.button,
                  size: Responsive.f(34),
                ),
                label: tab.label,
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
