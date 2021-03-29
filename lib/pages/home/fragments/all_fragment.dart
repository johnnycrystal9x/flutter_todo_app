/// Created by JB Pha Le on 3/24/21.
/// johnnycrystal9x@gmail.com

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:phal_flutter_todo_app/data/db/models/todo_model.dart';
import 'package:phal_flutter_todo_app/pages/home/widgets/todo_component.dart';
import 'package:phal_flutter_todo_app/redux/actions/todo_action.dart';
import 'package:phal_flutter_todo_app/redux/selectors/todo_selector.dart';
import 'package:phal_flutter_todo_app/redux/states/app_state.dart';
import 'package:redux/redux.dart';

class _ViewModel {
  final List<TodoModel> todoList;
  final bool isLoading;
  final String errorMessage;

  _ViewModel({
    this.todoList,
    this.isLoading,
    this.errorMessage,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    var _state = store.state;
    return _ViewModel(
      todoList: allTodoListSelector(_state),
      isLoading: isLoadingTodoSelector(_state),
      errorMessage: errorMessageTodoSelector(_state),
    );
  }
}

class AllFragment extends StatefulWidget {
  @override
  _AllFragmentState createState() => _AllFragmentState();
}

class _AllFragmentState extends State<AllFragment> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: StoreConnector<AppState, _ViewModel>(
        onInit: (store) => store.dispatch(LoadAllTodoListAction()),
        converter: _ViewModel.fromStore,
        builder: (context, vm) => TodoListComponent(
          todoList: vm.todoList,
          isLoading: vm.isLoading,
          error: vm.errorMessage,
        ),
      ),
    );
  }
}
