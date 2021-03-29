/// Created by JB Pha Le on 3/28/21.
/// johnnycrystal9x@gmail.com

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class Utils {
  static void showTodoDialog({title, content}) {
    Get.defaultDialog(
      title: title,
      content: content,
    );
  }
}
