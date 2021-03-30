/// Created by JB Pha Le on 3/24/21.
/// johnnycrystal9x@gmail.com

import 'package:flutter/widgets.dart';
import 'package:phal_flutter_todo_app/data/db/models/todo_model.dart';

class LoadAllTodoListAction {
  String toString() {
    return 'LoadAllTodoListAction{}';
  }
}

class LoadAllTodoListSuccessAction {
  final List<TodoModel> todoList;

  LoadAllTodoListSuccessAction({this.todoList});

  String toString() {
    return 'LoadAllTodoListSuccessAction{todoList: ${this.todoList}}';
  }
}

class LoadAllTodoListFailureAction {
  final String errorMessage;

  LoadAllTodoListFailureAction({this.errorMessage});

  String toString() {
    return 'LoadAllTodoListFailureAction{errorMessage: ${this.errorMessage}}';
  }
}

class LoadCompleteTodoListAction {
  String toString() {
    return 'LoadCompleteTodoListAction{}';
  }
}

class LoadCompleteTodoListSuccessAction {
  final List<TodoModel> todoList;

  LoadCompleteTodoListSuccessAction({this.todoList});

  String toString() {
    return 'LoadCompleteTodoListSuccessAction{todoList: ${this.todoList}}';
  }
}

class LoadCompleteTodoListFailureAction {
  final String errorMessage;

  LoadCompleteTodoListFailureAction({this.errorMessage});

  String toString() {
    return 'LoadCompleteTodoListFailureAction{errorMessage: ${this.errorMessage}}';
  }
}

class LoadIncompleteTodoListAction {
  String toString() {
    return 'LoadIncompleteTodoListAction{}';
  }
}

class LoadIncompleteTodoListSuccessAction {
  final List<TodoModel> todoList;

  LoadIncompleteTodoListSuccessAction({this.todoList});

  String toString() {
    return 'LoadIncompleteTodoListSuccessAction{todoList: ${this.todoList}}';
  }
}

class LoadIncompleteTodoListFailureAction {
  final String errorMessage;

  LoadIncompleteTodoListFailureAction({this.errorMessage});

  String toString() {
    return 'LoadIncompleteTodoListFailureAction{errorMessage: ${this.errorMessage}}';
  }
}

class AddTodoAction {
  final TodoModel todo;

  AddTodoAction({this.todo});

  String toString() {
    return 'AddTodoAction{todo: ${this.todo}';
  }
}

class AddTodoSuccessAction {
  String toString() {
    return 'AddTodoSuccessAction{}';
  }
}

class AddTodoFailureAction {
  final String errorMessage;

  AddTodoFailureAction({@required this.errorMessage});

  String toString() {
    return 'AddTodoFailureAction{errorMessage: ${this.errorMessage}}';
  }
}

class EditTodoAction {
  final TodoModel todo;

  EditTodoAction({this.todo});

  String toString() {
    return 'EditTodoAction{todo: ${this.todo}';
  }
}

class EditTodoSuccessAction {
  String toString() {
    return 'EditTodoSuccessAction{}';
  }
}

class EditTodoFailureAction {
  final String errorMessage;

  EditTodoFailureAction({@required this.errorMessage});

  String toString() {
    return 'EditTodoFailureAction{errorMessage: ${this.errorMessage}}';
  }
}

class DeleteTodoAction {
  final String todoId;

  DeleteTodoAction({this.todoId});

  String toString() {
    return 'DeleteTodoAction{todoId: $todoId}';
  }
}

class DeleteTodoSuccessAction {
  String toString() {
    return 'DeleteTodoSuccessAction{}';
  }
}

class DeleteTodoFailureAction {
  final String errorMessage;

  DeleteTodoFailureAction({@required this.errorMessage});

  String toString() {
    return 'DeleteTodoFailureAction{errorMessage: ${this.errorMessage}}';
  }
}

class LoadingTodoAction {
  String toString() {
    return 'LoadingTodoAction{}';
  }
}

class RefreshTodoAction {
  String toString() {
    return 'RefreshTodoAction{}';
  }
}
