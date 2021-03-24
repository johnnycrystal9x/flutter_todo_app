/// Created by JB Pha Le on 3/24/21.
/// johnnycrystal9x@gmail.com

import 'package:equatable/equatable.dart';
import 'package:phal_flutter_todo_app/redux/states/home_state.dart';

class AppState extends Equatable {
  final HomeState homeState;

  const AppState({
    this.homeState,
  });

  factory AppState.initial() {
    return AppState(
      homeState: HomeState.initial(),
    );
  }

  AppState copyWith() {
    return AppState(
      homeState: homeState ?? this.homeState,
    );
  }

  @override
  List<Object> get props => <Object>[
        homeState,
      ];
}
