/// Created by JB Pha Le on 3/29/21.
/// johnnycrystal9x@gmail.com

import 'package:phal_flutter_todo_app/redux/reducers/auth_reducer.dart';
import 'package:phal_flutter_todo_app/redux/reducers/todo_reducer.dart';
import 'package:phal_flutter_todo_app/redux/states/app_state.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    authState: authReducer(state.authState, action),
    todoState: todoReducer(state.todoState, action),
  );
}
