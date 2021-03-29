/// Created by JB Pha Le on 3/29/21.
/// johnnycrystal9x@gmail.com

import 'package:phal_flutter_todo_app/redux/actions/todo_action.dart';
import 'package:phal_flutter_todo_app/redux/states/todo_state.dart';
import 'package:redux/redux.dart';

final Reducer<TodoState> todoReducer = combineReducers([
  TypedReducer<TodoState, LoadAllTodoListSuccessAction>(_loadAllTodoListSuccess),
  TypedReducer<TodoState, LoadCompleteTodoListSuccessAction>(_loadCompleteTodoListSuccess),
  TypedReducer<TodoState, LoadIncompleteTodoListSuccessAction>(_loadIncompleteTodoListSuccess),
  TypedReducer<TodoState, LoadingTodoAction>(_loadingTodo),
]);

TodoState _loadAllTodoListSuccess(TodoState state, LoadAllTodoListSuccessAction action) {
  return state.copyWith(
    allTodoList: action.todoList,
    isLoading: false,
    errorMessage: "",
  );
}

TodoState _loadCompleteTodoListSuccess(TodoState state, LoadCompleteTodoListSuccessAction action) {
  return state.copyWith(
    completeTodoList: action.todoList,
    isLoading: false,
    errorMessage: "",
  );
}

TodoState _loadIncompleteTodoListSuccess(TodoState state, LoadIncompleteTodoListSuccessAction action) {
  return state.copyWith(
    incompleteTodoList: action.todoList,
    isLoading: false,
    errorMessage: "",
  );
}

TodoState _loadingTodo(TodoState state, LoadingTodoAction action) {
  return state.copyWith(isLoading: true);
}
