/// Created by JB Pha Le on 3/24/21.
/// johnnycrystal9x@gmail.com

import 'package:phal_flutter_todo_app/redux/actions/home_action.dart';
import 'package:phal_flutter_todo_app/redux/states/home_state.dart';
import 'package:redux/redux.dart';

final Reducer<HomeState> homeReducer = combineReducers([
  TypedReducer<HomeState, SetLoadingAction>(_setLoading),
  TypedReducer<HomeState, SetErrorAction>(_setError),
]);

HomeState _setLoading(HomeState state, SetLoadingAction action) {
  state = state.copyWith(isLoading: action.isLoading);
  return state;
}

HomeState _setError(HomeState state, SetErrorAction action) {
  state = state.copyWith(error: action.error);
  return state;
}
