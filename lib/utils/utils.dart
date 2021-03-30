
import 'package:get/get.dart';

class Utils {
  static void showTodoDialog({title, content}) {
    Get.defaultDialog(
      title: title,
      content: content,
    );
  }
}
