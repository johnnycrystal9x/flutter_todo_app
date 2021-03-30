import 'package:phal_flutter_todo_app/data/db/models/todo_model.dart';
import 'package:phal_flutter_todo_app/redux/states/todo_state.dart';

/// Created by JB Pha Le on 3/30/21.
/// johnnycrystal9x@gmail.com

final todoStateResourceTest = TodoState(
  allTodoList: [
    TodoModel(
      id: "1",
      text: "text 1",
      note: "note 1",
      isDone: false,
      userId: "1",
    ),
    TodoModel(
      id: "2",
      text: "text 2",
      note: "note 2",
      isDone: false,
      userId: "2",
    ),
    TodoModel(
      id: "3",
      text: "text 3",
      note: "note 3",
      isDone: true,
      userId: "3",
    )
  ],
  completeTodoList: [
    TodoModel(
      id: "3",
      text: "text 3",
      note: "note 3",
      isDone: true,
      userId: "3",
    )
  ],
  incompleteTodoList: [
    TodoModel(
      id: "1",
      text: "text 1",
      note: "note 1",
      isDone: false,
      userId: "1",
    ),
    TodoModel(
      id: "2",
      text: "text 2",
      note: "note 2",
      isDone: false,
      userId: "2",
    ),
  ],
  isLoading: false,
  errorMessage: "test error",
);
