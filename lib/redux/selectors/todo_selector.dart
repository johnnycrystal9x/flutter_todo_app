/// Created by JB Pha Le on 3/29/21.
/// johnnycrystal9x@gmail.com

import 'package:phal_flutter_todo_app/data/db/models/todo_model.dart';
import 'package:phal_flutter_todo_app/redux/states/app_state.dart';
import 'package:phal_flutter_todo_app/redux/states/todo_state.dart';

TodoState todoStateSelector(AppState state) => state.todoState;

List<TodoModel> allTodoListSelector(AppState state) => state.todoState.allTodoList;

List<TodoModel> completeTodoListSelector(AppState state) => state.todoState.completeTodoList;

List<TodoModel> incompleteTodoListSelector(AppState state) => state.todoState.incompleteTodoList;

bool isLoadingTodoSelector(AppState state) => state.todoState.isLoading;

String errorMessageTodoSelector(AppState state) => state.todoState.errorMessage;
