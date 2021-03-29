/// Created by JB Pha Le on 3/24/21.
/// johnnycrystal9x@gmail.com

import 'package:equatable/equatable.dart';
import 'package:phal_flutter_todo_app/redux/states/auth_state.dart';
import 'package:phal_flutter_todo_app/redux/states/todo_state.dart';

class AppState extends Equatable {
  final AuthState authState;
  final TodoState todoState;

  const AppState({
    this.authState,
    this.todoState,
  });

  factory AppState.initial() {
    return AppState(
      authState: AuthState.initial(),
      todoState: TodoState.initial(),
    );
  }

  AppState copyWith() {
    return AppState(
      authState: authState ?? this.authState,
      todoState: todoState ?? this.todoState,
    );
  }

  @override
  List<Object> get props => <Object>[
        authState,
        todoState,
      ];
}
