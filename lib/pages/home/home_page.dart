/// Created by JB Pha Le on 3/24/21.
/// johnnycrystal9x@gmail.com

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:phal_flutter_todo_app/constants/colors.dart';
import 'package:phal_flutter_todo_app/constants/strings.dart';
import 'package:phal_flutter_todo_app/pages/home/fragments/all_fragment.dart';
import 'package:phal_flutter_todo_app/pages/home/fragments/complete_fragment.dart';
import 'package:phal_flutter_todo_app/pages/home/fragments/incomplete_fragment.dart';
import 'package:phal_flutter_todo_app/data/db/models/tab_item_model.dart';
import 'package:phal_flutter_todo_app/pages/home/widgets/bottom_tab_item.dart';
import 'package:phal_flutter_todo_app/pages/home/widgets/custom_todo_dialog.dart';
import 'package:phal_flutter_todo_app/pages/home/widgets/bottom_tab_controller.dart';
import 'package:phal_flutter_todo_app/redux/actions/auth_action.dart';
import 'package:phal_flutter_todo_app/redux/selectors/app_selector.dart';
import 'package:phal_flutter_todo_app/utils/utils.dart';

enum BottomTabType { all, complete, incomplete }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _appBarMenuSelect(value) {
    switch (value) {
      case Strings.about:
        Utils.showTodoDialog(
          title: Strings.appName,
          content: Text("Author: JB Pha Le"),
        );
        break;
      case Strings.logout:
        storeSelector(context).dispatch(LogoutAction());
        break;
    }
    print(value);
  }

  Widget _buildBodyBottomTab() {
    switch (Get.find<BottomTabController>().tabType) {
      case BottomTabType.all:
        return AllFragment();
      case BottomTabType.complete:
        return CompleteFragment();
      case BottomTabType.incomplete:
        return IncompleteFragment();
      default:
        return Container(color: AppColors.backgroundColor1);
    }
  }

  Widget _buildBottomNavigationBar() {
    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List<BottomTabItem>.generate(Get.find<BottomTabController>().tabs.length, (int index) {
          final TabItemModel _item = Get.find<BottomTabController>().tabs[index];
          return BottomTabItem(
            tabItem: _item,
            iconColor: Get.find<BottomTabController>().tabColor(_item.type),
          );
        }),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return Visibility(
      visible: !Get.find<BottomTabController>().isKeyboardVisible,
      child: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () async => await showDialog(
          context: context,
          builder: (context) => CustomTodoDialog(title: "Add Task"),
        ),
        tooltip: 'Add Task',
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return GetBuilder<BottomTabController>(
        init: BottomTabController(),
        builder: (_) {
          return WillPopScope(
            onWillPop: _.onWillPop,
            child: SafeArea(
              top: false,
              bottom: false,
              child: Scaffold(
                appBar: AppBar(
                  // Here we take the value from the HomePage object that was created by
                  // the App.build method, and use it to set our appbar title.
                  title: Text(Strings.appName),
                  actions: [
                    PopupMenuButton(
                      onSelected: _appBarMenuSelect,
                      itemBuilder: (BuildContext context) {
                        return {Strings.about, Strings.logout}.map((String choice) {
                          return PopupMenuItem(
                            value: choice,
                            child: Text(choice),
                          );
                        }).toList();
                      },
                    ),
                  ],
                ),
                body: _buildBodyBottomTab(),
                bottomNavigationBar: _buildBottomNavigationBar(),
                floatingActionButton: _buildFloatingActionButton(), // This trailing comma makes auto-formatting nicer for build methods.
              ),
            ),
          );
        });
  }
}
