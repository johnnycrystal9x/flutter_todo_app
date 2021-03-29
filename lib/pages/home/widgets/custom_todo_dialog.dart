import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/get.dart';
import 'package:phal_flutter_todo_app/constants/dimens.dart';
import 'package:phal_flutter_todo_app/data/db/models/todo_model.dart';
import 'package:phal_flutter_todo_app/redux/actions/todo_action.dart';
import 'package:phal_flutter_todo_app/redux/states/app_state.dart';

class CustomTodoDialog extends StatefulWidget {
  final String title;

  const CustomTodoDialog({Key key, this.title}) : super(key: key);

  @override
  _CustomTodoDialogState createState() => _CustomTodoDialogState();
}

class _CustomTodoDialogState extends State<CustomTodoDialog> {
  final _taskController = TextEditingController();
  final _noteController = TextEditingController();

  @override
  void dispose() {
    _taskController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), //this right here
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Dimens.defaultPadding).copyWith(bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(Dimens.defaultPadding),
                child: Text(widget.title),
              ),
              Padding(
                padding: EdgeInsets.all(Dimens.defaultPadding),
                child: TextField(
                  controller: _taskController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.post_add),
                    labelText: 'Add a task',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(Dimens.defaultPadding),
                child: TextField(
                  controller: _noteController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.event_note_sharp),
                    labelText: 'Add note',
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Dimens.largeFontSize,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    onPressed: () => Get.back(),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        final todo = TodoModel(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          text: _taskController.text,
                          note: _noteController.text,
                          isDone: false,
                          userId: "1",
                        );
                        if (todo.text.isNotEmpty && todo.note.isNotEmpty) {
                          StoreProvider.of<AppState>(context).dispatch(AddTodoAction(todo: todo));
                          Get.back();
                        } else {
                          Get.snackbar("Warning", "Some field are empty!");
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Text(
                          'Done',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Dimens.largeFontSize,
                          ),
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
