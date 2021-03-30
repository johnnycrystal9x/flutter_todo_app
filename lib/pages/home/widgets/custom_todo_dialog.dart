/// Created by JB Pha Le on 3/24/21.
/// johnnycrystal9x@gmail.com

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phal_flutter_todo_app/constants/dimens.dart';
import 'package:phal_flutter_todo_app/data/db/models/todo_model.dart';
import 'package:phal_flutter_todo_app/redux/actions/todo_action.dart';
import 'package:phal_flutter_todo_app/redux/selectors/app_selector.dart';

class CustomTodoDialog extends StatefulWidget {
  final String title;
  final TodoModel todoModel;

  const CustomTodoDialog({Key key, this.title, this.todoModel}) : super(key: key);

  @override
  _CustomTodoDialogState createState() => _CustomTodoDialogState();
}

class _CustomTodoDialogState extends State<CustomTodoDialog> {
  TextEditingController _taskController;
  TextEditingController _noteController;

  @override
  void initState() {
    _taskController = TextEditingController(text: widget.todoModel.text ?? "");
    _noteController = TextEditingController(text: widget.todoModel.note ?? "");
    super.initState();
  }

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
                        if (widget.title == "Add task") {
                          final todoAdd = widget.todoModel.copyWith(
                            id: DateTime.now().millisecondsSinceEpoch.toString(),
                            text: _taskController.text,
                            note: _noteController.text,
                            isDone: false,
                            userId: "1",
                          );
                          if (todoAdd.text.isNotEmpty && todoAdd.note.isNotEmpty) {
                            storeSelector(context).dispatch(AddTodoAction(todo: todoAdd));
                          } else {
                            Get.snackbar("Warning", "Some field are empty!");
                          }
                        } else {
                          final todoEdit = widget.todoModel.copyWith(
                            text: _taskController.text,
                            note: _noteController.text,
                          );
                          if (todoEdit.text.isNotEmpty && todoEdit.note.isNotEmpty) {
                            storeSelector(context).dispatch(EditTodoAction(todo: todoEdit));
                          } else {
                            Get.snackbar("Warning", "Some field are empty!");
                          }
                        }
                        Get.back();
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
