/// Created by JB Pha Le on 3/30/21.
/// johnnycrystal9x@gmail.com

import 'package:flutter_test/flutter_test.dart';
import 'package:phal_flutter_todo_app/redux/actions/todo_action.dart';
import 'package:phal_flutter_todo_app/redux/reducers/todo_reducer.dart';
import 'package:phal_flutter_todo_app/redux/states/todo_state.dart';
import 'package:redux/redux.dart';
import '../../test_resources/todo_state_resource.dart';

main() {
  var _store = Store<TodoState>(todoReducer, initialState: todoStateResourceTest);

  group('todoReducer', () {
    test('test_loadAllTodoListSuccess', () {
      _store.dispatch(LoadAllTodoListSuccessAction());
      expect(_store.state.allTodoList.length, 3);
      expect(_store.state.isLoading, false);
      expect(_store.state.errorMessage, "");
    });

    test('test_loadAllTodoListSuccess', () {
      _store.dispatch(LoadCompleteTodoListAction());
      expect(_store.state.completeTodoList.length, 1);
      expect(_store.state.isLoading, false);
      expect(_store.state.errorMessage, "");
    });

    test('test_loadAllTodoListSuccess', () {
      _store.dispatch(LoadIncompleteTodoListAction());
      expect(_store.state.incompleteTodoList.length, 2);
      expect(_store.state.isLoading, false);
      expect(_store.state.errorMessage, "");
    });

    test('test_loadingTodo', () {
      _store.dispatch(LoadingTodoAction());
      expect(_store.state.isLoading, true);
    });
  });
}
