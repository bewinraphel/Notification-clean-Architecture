import 'package:boardingweek/core/config/enum/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();
}

class NavigationTabChanged extends NavigationEvent {
  final AppTab tab;
  const NavigationTabChanged(this.tab);

  @override
  List<Object> get props => [tab];
}

class NavigationState extends Equatable {
  final AppTab selectedTab;

  const NavigationState({required this.selectedTab});

  @override
  List<Object> get props => [selectedTab];
}

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState(selectedTab: AppTab.home)) {
    on<NavigationTabChanged>((event, emit) {
      emit(NavigationState(selectedTab: event.tab));
    });
  }
}
