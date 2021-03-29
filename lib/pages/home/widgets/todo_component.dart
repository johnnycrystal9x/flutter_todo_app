import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phal_flutter_todo_app/constants/dimens.dart';
import 'package:phal_flutter_todo_app/data/db/models/todo_model.dart';
import 'package:phal_flutter_todo_app/pages/home/widgets/custom_todo_dialog.dart';
import 'package:phal_flutter_todo_app/widgets/loading_widget.dart';

class TodoListComponent extends StatefulWidget {
  final List<TodoModel> todoList;
  final bool isLoading;
  final String error;

  const TodoListComponent({
    Key key,
    this.todoList,
    this.isLoading,
    this.error,
  }) : super(key: key);

  @override
  _TodoListComponentState createState() => _TodoListComponentState();
}

class _TodoListComponentState extends State<TodoListComponent> {
  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      return LoadingWidget();
    }
    if (widget.error != "") {
      return Text(widget.error);
    }
    return _buildTodoItem();
  }

  Widget _buildTodoItem() {
    return ListView.separated(
      key: ValueKey("todo_list"),
      padding: EdgeInsets.only(top: 8, bottom: 8),
      itemBuilder: (context, index) => Dismissible(
        key: UniqueKey(),
        background: _dismissibleBackground(),
        secondaryBackground: _dismissibleSecondaryBackground(),
        confirmDismiss: (DismissDirection direction) {
          // false: not dismiss item
          return direction == DismissDirection.endToStart ? _confirmDeleteItem() : _editTaskItem();
        },
        onDismissed: (DismissDirection direction) {
          // false: not dismiss item
          return direction == DismissDirection.endToStart ? _deleteItem(index) : false;
        },
        child: Card(
          margin: EdgeInsets.all(8),
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: ListTile(
            title: Text(
              widget.todoList[index].text,
              style: _textItemStyle(index),
            ),
            subtitle: Text(
              widget.todoList[index].note,
              style: _textItemStyle(index),
            ),
            // onTap: () => _editTaskItem(),
            leading: Checkbox(
              value: widget.todoList[index].isDone,
              onChanged: (v) {
                var changed = widget.todoList[index].copyWith(isDone: v);
                widget.todoList[index] = changed;
              },
            ),
            trailing: Wrap(
              spacing: 5,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _editTaskItem(),
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    _confirmDeleteItem().then((value) {
                      if (value) setState(() => _deleteItem(index));
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      separatorBuilder: (context, index) => Container(),
      itemCount: widget.todoList.length,
    );
  }

  TextStyle _textItemStyle(index) {
    return (widget.todoList[index].isDone)
        ? TextStyle(color: Colors.red, decoration: TextDecoration.lineThrough)
        : TextStyle(color: Theme.of(context).textTheme.bodyText1.color);
  }

  Widget _dismissibleBackground() {
    return Container(
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(Dimens.defaultPadding),
        child: Row(
          children: <Widget>[
            Icon(Icons.check_box, color: Colors.white),
            Text('Edit', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget _dismissibleSecondaryBackground() {
    return Container(
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(Dimens.defaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(Icons.delete, color: Colors.white),
            Text('Delete', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  void _deleteItem(index) {
    var removed = widget.todoList[index];
    setState(() {
      widget.todoList.removeAt(index);
    });
    Get.snackbar('Task removed', 'The task "${removed.text}" was successfully removed.',
        mainButton: TextButton(
          child: Text('Undo'),
          onPressed: () {
            if (removed == null) {
              return;
            }
            widget.todoList.insert(index, removed);
            removed = null;
            if (Get.isSnackbarOpen) {
              Get.back();
            }
          },
        ));
  }

  Future<bool> _confirmDeleteItem() async {
    var isDelete = false;
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete Confirmation"),
          content: const Text("Are you sure you want to delete this item?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Delete"),
              onPressed: () {
                Get.back();
                isDelete = true; //dismiss item
              },
            ),
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                setState(() => Get.back());
              },
            ),
          ],
        );
      },
    );
    // false: not dismiss item
    return Future.value(isDelete);
  }

  Future<bool> _editTaskItem() async {
    await showDialog(
      context: context,
      builder: (context) => CustomTodoDialog(title: "Edit Task"),
    );
    // false: not dismiss item
    return Future.value(false);
  }
}
