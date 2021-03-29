/// Created by JB Pha Le on 3/29/21.
/// johnnycrystal9x@gmail.com

import 'package:phal_flutter_todo_app/redux/states/app_state.dart';
import 'package:phal_flutter_todo_app/redux/states/auth_state.dart';

AuthState todoStateSelector(AppState state) => state.authState;

bool isLogoutSelector(AppState state) => state.authState.isLogout;
