/// Created by JB Pha Le on 3/24/21.
/// johnnycrystal9x@gmail.com

import 'package:equatable/equatable.dart';
import 'package:phal_flutter_todo_app/data/db/models/todo_model.dart';

class TodoState extends Equatable {
  final List<TodoModel> allTodoList;
  final List<TodoModel> completeTodoList;
  final List<TodoModel> incompleteTodoList;
  final bool isLoading;
  final String errorMessage;

  const TodoState({
    this.allTodoList,
    this.completeTodoList,
    this.incompleteTodoList,
    this.isLoading,
    this.errorMessage,
  });

  factory TodoState.initial() {
    return TodoState(
      allTodoList: [],
      completeTodoList: [],
      incompleteTodoList: [],
      isLoading: false,
      errorMessage: "",
    );
  }

  TodoState copyWith({
    List<TodoModel> allTodoList,
    List<TodoModel> completeTodoList,
    List<TodoModel> incompleteTodoList,
    bool isLoading,
    String errorMessage,
  }) {
    return TodoState(
      allTodoList: allTodoList ?? this.allTodoList,
      completeTodoList: completeTodoList ?? this.completeTodoList,
      incompleteTodoList: incompleteTodoList ?? this.incompleteTodoList,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => <Object>[
        this.allTodoList,
        this.completeTodoList,
        this.incompleteTodoList,
        this.isLoading,
        this.errorMessage,
      ];
}
