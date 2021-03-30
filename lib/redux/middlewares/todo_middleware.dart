/// Created by JB Pha Le on 3/24/21.
/// johnnycrystal9x@gmail.com

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:phal_flutter_todo_app/data/db/models/todo_model.dart';
import 'package:phal_flutter_todo_app/pages/home/home_page.dart';
import 'package:phal_flutter_todo_app/pages/home/widgets/bottom_tab_controller.dart';
import 'package:phal_flutter_todo_app/redux/actions/todo_action.dart';
import 'package:phal_flutter_todo_app/redux/states/app_state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> todoMiddleware() {
  return [
    TypedMiddleware<AppState, LoadAllTodoListAction>(_loadAllTodoList()),
    TypedMiddleware<AppState, LoadCompleteTodoListAction>(_loadCompleteTodoList()),
    TypedMiddleware<AppState, LoadIncompleteTodoListAction>(_loadIncompleteTodoList()),
    TypedMiddleware<AppState, AddTodoAction>(_addTodo()),
    TypedMiddleware<AppState, EditTodoAction>(_editTodo()),
    TypedMiddleware<AppState, DeleteTodoAction>(_deleteTodo()),
    TypedMiddleware<AppState, RefreshTodoAction>(_refreshTodo()),
  ];
}

final _todoCollection = FirebaseFirestore.instance.collection('todo');
final _todoCollectionOrderById = _todoCollection.orderBy('id', descending: true);

Middleware<AppState> _loadAllTodoList() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    next(action);

    // Load from firebase
    // Sort by id (id added by current time)
    store.dispatch(LoadingTodoAction());
    await _todoCollectionOrderById.get().then(
      (QuerySnapshot querySnapshot) {
        final todoList = querySnapshot.docs.map((doc) => TodoModel.fromDocument(doc)).toList();
        store.dispatch(LoadAllTodoListSuccessAction(todoList: todoList));
      },
    ).catchError(
      (error, stackTrace) => store.dispatch(LoadAllTodoListFailureAction(errorMessage: error.toString())),
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
    final _todoCollectionFilter = _todoCollectionOrderById.where('isDone', isEqualTo: true);
    await _todoCollectionFilter.get().then(
      (QuerySnapshot querySnapshot) {
        final todoList = querySnapshot.docs.map((doc) => TodoModel.fromDocument(doc)).toList();
        store.dispatch(LoadCompleteTodoListSuccessAction(todoList: todoList));
      },
    ).catchError(
      (error, stackTrace) => store.dispatch(LoadCompleteTodoListFailureAction(errorMessage: error.toString())),
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
    final _todoCollectionFilter = _todoCollectionOrderById.where('isDone', isEqualTo: false);
    await _todoCollectionFilter.get().then(
      (QuerySnapshot querySnapshot) {
        final todoList = querySnapshot.docs.map((doc) => TodoModel.fromDocument(doc)).toList();
        store.dispatch(LoadIncompleteTodoListSuccessAction(todoList: todoList));
      },
    ).catchError(
      (error, stackTrace) => store.dispatch(LoadIncompleteTodoListFailureAction(errorMessage: error.toString())),
    );
  };
}

Middleware<AppState> _addTodo() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    store.dispatch(LoadingTodoAction());
    next(action);

    // Add task to firebase
    await _todoCollection.doc().set(action.todo.toJson()).then((value) {
      store.dispatch(AddTodoSuccessAction());
      store.dispatch(RefreshTodoAction());
    }).catchError(
      (error, stackTrace) => store.dispatch(AddTodoFailureAction(errorMessage: error.toString())),
    );
  };
}

Middleware<AppState> _editTodo() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    store.dispatch(LoadingTodoAction());
    next(action);

    // Add task to firebase
    await _todoCollection.doc(action.todo.id).update(action.todo.toJson()).then((value) {
      store.dispatch(EditTodoSuccessAction());
      store.dispatch(RefreshTodoAction());
    }).catchError(
      (error, stackTrace) => store.dispatch(EditTodoFailureAction(errorMessage: error.toString())),
    );
  };
}

Middleware<AppState> _deleteTodo() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    store.dispatch(LoadingTodoAction());
    next(action);

    // Add task to firebase
    await _todoCollection.doc(action.todo.id).delete().then((value) {
      store.dispatch(DeleteTodoSuccessAction());
      store.dispatch(RefreshTodoAction());
    }).catchError(
      (error, stackTrace) => store.dispatch(DeleteTodoFailureAction(errorMessage: error.toString())),
    );
  };
}

Middleware<AppState> _refreshTodo() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    next(action);
    switch (Get.find<BottomTabController>().tabType) {
      case BottomTabType.all:
        store.dispatch(LoadAllTodoListAction());
        break;
      case BottomTabType.complete:
        store.dispatch(LoadCompleteTodoListAction());
        break;
      case BottomTabType.incomplete:
        store.dispatch(LoadIncompleteTodoListAction());
        break;
    }
  };
}
