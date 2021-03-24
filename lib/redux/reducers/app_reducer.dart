/// Created by JB Pha Le on 3/24/21.
/// johnnycrystal9x@gmail.com

import 'package:phal_flutter_todo_app/redux/reducers/home_reducer.dart';
import 'package:phal_flutter_todo_app/redux/states/app_state.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    homeState: homeReducer(state.homeState, action),
  );
}
