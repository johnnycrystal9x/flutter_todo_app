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
  final String error;

  LoadAllTodoListFailureAction({this.error});

  String toString() {
    return 'LoadAllTodoListFailureAction{error: ${this.error}}';
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
  final String error;

  LoadCompleteTodoListFailureAction({this.error});

  String toString() {
    return 'LoadCompleteTodoListFailureAction{error: ${this.error}}';
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
  final String error;

  LoadIncompleteTodoListFailureAction({this.error});

  String toString() {
    return 'LoadIncompleteTodoListFailureAction{error: ${this.error}}';
  }
}

class AddTodoAction {
  final TodoModel todo;

  AddTodoAction({this.todo});

  String toString() {
    return 'AddTodoAction{}';
  }
}

class AddTodoSuccessAction {
  final String task;

  AddTodoSuccessAction({this.task});

  String toString() {
    return 'AddTodoSuccessAction{}';
  }
}

class AddTodoFailureAction {
  final String error;

  AddTodoFailureAction({@required this.error});

  String toString() {
    return 'AddTodoFailureAction{error: ${this.error}}';
  }
}

class EditTodoAction {
  final String task;

  EditTodoAction({this.task});

  String toString() {
    return 'EditTodoAction{}';
  }
}

class DeleteTodoAction {
  final String taskId;

  DeleteTodoAction({this.taskId});

  String toString() {
    return 'DeleteTodoAction{taskId: $taskId}';
  }
}

class DeleteTodoSuccessAction {
  final String id;

  DeleteTodoSuccessAction({this.id});

  String toString() {
    return 'DeleteTodoSuccessAction{}';
  }
}

class DeleteTodoFailureAction {
  final String error;

  DeleteTodoFailureAction({@required this.error});

  String toString() {
    return 'DeleteTodoFailureAction{error: ${this.error}}';
  }
}

class EditingTodoAction {
  String toString() {
    return 'EditingTodoAction{}';
  }
}

class EditTodoSuccessAction {
  final String task;

  EditTodoSuccessAction({this.task});

  String toString() {
    return 'EditTodoSuccessAction{}';
  }
}

class EditTodoFailureAction {
  final String error;

  EditTodoFailureAction({@required this.error});

  String toString() {
    return 'EditTodoFailureAction{error: ${this.error}}';
  }
}

class LoadingTodoAction {
  String toString() {
    return 'LoadingTodoAction{}';
  }
}
