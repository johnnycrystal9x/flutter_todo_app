/// Created by JB Pha Le on 3/29/21.
/// johnnycrystal9x@gmail.com

import 'package:get/get.dart';
import 'package:phal_flutter_todo_app/redux/actions/auth_action.dart';
import 'package:phal_flutter_todo_app/redux/states/auth_state.dart';
import 'package:phal_flutter_todo_app/routers/app_routers.dart';
import 'package:redux/redux.dart';

final Reducer<AuthState> authReducer = combineReducers([
  TypedReducer<AuthState, LogoutAction>(_logout),
]);

AuthState _logout(AuthState state, LogoutAction action) {
  Get.offAllNamed(Routes.LOGIN);
  return state;
}
