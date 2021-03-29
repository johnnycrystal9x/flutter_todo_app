/// Created by JB Pha Le on 3/24/21.
/// johnnycrystal9x@gmail.com

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phal_flutter_todo_app/data/db/models/todo_model.dart';
import 'package:phal_flutter_todo_app/redux/actions/todo_action.dart';
import 'package:phal_flutter_todo_app/redux/states/app_state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> todoMiddleware() {
  return [
    TypedMiddleware<AppState, LoadAllTodoListAction>(_loadAllTodoList()),
    TypedMiddleware<AppState, LoadCompleteTodoListAction>(_loadCompleteTodoList()),
    TypedMiddleware<AppState, LoadIncompleteTodoListAction>(_loadIncompleteTodoList()),
    TypedMiddleware<AppState, AddTodoAction>(_createTodo()),
  ];
}

Middleware<AppState> _loadAllTodoList() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    next(action);

    // Load from firebase
    // Sort by id (id added by current time)
    store.dispatch(LoadingTodoAction());
    FirebaseFirestore.instance.collection('todo').orderBy('id', descending: true).get().then(
      (QuerySnapshot querySnapshot) {
        final todoList = querySnapshot.docs.map((doc) => TodoModel.fromDocument(doc)).toList();
        store.dispatch(LoadAllTodoListSuccessAction(todoList: todoList));
      },
    ).catchError(
      (error, stackTrace) => store.dispatch(LoadAllTodoListFailureAction()),
    );
  };
}

Middleware<AppState> _loadCompleteTodoList() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    next(action);

    // Load from firebase
    // Sort by id (id added by current time)
    // where isDone is complete
    store.dispatch(LoadingTodoAction());
    FirebaseFirestore.instance.collection('todo').where('isDone', isEqualTo: true).orderBy('id', descending: true).get().then(
      (QuerySnapshot querySnapshot) {
        final todoList = querySnapshot.docs.map((doc) => TodoModel.fromDocument(doc)).toList();
        store.dispatch(LoadCompleteTodoListSuccessAction(todoList: todoList));
      },
    ).catchError(
      (error, stackTrace) => store.dispatch(LoadCompleteTodoListFailureAction()),
    );
  };
}

Middleware<AppState> _loadIncompleteTodoList() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    next(action);

    // Load from firebase
    // Sort by id (id added by current time)
    // where isDone is incomplete
    store.dispatch(LoadingTodoAction());
    FirebaseFirestore.instance.collection('todo').where('isDone', isEqualTo: false).orderBy('id', descending: true).get().then(
      (QuerySnapshot querySnapshot) {
        final todoList = querySnapshot.docs.map((doc) => TodoModel.fromDocument(doc)).toList();
        store.dispatch(LoadIncompleteTodoListSuccessAction(todoList: todoList));
      },
    ).catchError(
      (error, stackTrace) => store.dispatch(LoadIncompleteTodoListFailureAction()),
    );
  };
}

Middleware<AppState> _createTodo() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    next(action);

    // Add task to firebase
    final todo = FirebaseFirestore.instance.collection("todo").doc();
    await todo.set(action.todo.toJson());
    store.dispatch(LoadAllTodoListAction());
  };
}
