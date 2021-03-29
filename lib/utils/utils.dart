/// Created by JB Pha Le on 3/28/21.
/// johnnycrystal9x@gmail.com

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class Utils {
  static void showTodoDialog(title, content) {
    Get.defaultDialog(
      title: title,
      content: content,
    );
  }

  static StreamTransformer transformer<T>(T Function(Map<String, dynamic> json) fromJson) {
    return StreamTransformer<QuerySnapshot, List<T>>.fromHandlers(
      handleData: (QuerySnapshot data, EventSink<List<T>> sink) {
        final snaps = data.docs.map((doc) => doc.data()).toList();
        final objects = snaps.map((json) => fromJson(json)).toList();
        sink.add(objects);
      },
    );
  }
}
