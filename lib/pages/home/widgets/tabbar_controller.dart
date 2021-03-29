/// Created by JB Pha Le on 3/25/21.
/// johnnycrystal9x@gmail.com

import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phal_flutter_todo_app/constants/assets.dart';
import 'package:phal_flutter_todo_app/constants/colors.dart';
import 'package:phal_flutter_todo_app/pages/home/home_page.dart';
import 'package:get/get.dart';
import 'package:phal_flutter_todo_app/data/db/models/tab_item_model.dart';

class TabBarController extends GetxController with WidgetsBindingObserver {
  TabType tabType = TabType.all;
  bool isKeyboardVisible = false;
  DateTime _backButtonOnPressed;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final double bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    final bool checkKeyboard = bottomInset > 0.0;
    if (checkKeyboard != isKeyboardVisible) {
      isKeyboardVisible = checkKeyboard;
      update();
    }
  }

  // Handle back press on device
  Future<bool> onWillPop() async {
    final DateTime currentTime = DateTime.now();

    final bool backButton = (_backButtonOnPressed == null) || (currentTime.difference(_backButtonOnPressed) > Duration(seconds: 3));

    if (backButton) {
      _backButtonOnPressed = currentTime;
      await Fluttertoast.showToast(msg: 'Press twice to exit');
      return false;
    }

    return true;
  }

  Color tabColor(TabType type) {
    if (tabType == type) {
      return AppColors.primaryColor;
    }
    return AppColors.textColor;
  }

  void onChangeTab(TabType type) {
    tabType = type;
    update();
  }

  final tabs = <TabItemModel>[
    TabItemModel('All', Images.iconTaskList, TabType.all),
    TabItemModel('COMPLETE', Images.iconTaskComplete, TabType.complete),
    TabItemModel('INCOMPLETE', Images.iconTaskIncomplete, TabType.incomplete),
  ];
}
