/// Created by JB Pha Le on 3/24/21.
/// johnnycrystal9x@gmail.com

import 'package:get/get.dart';
import 'package:phal_flutter_todo_app/routers/app_routers.dart';
import 'package:phal_flutter_todo_app/pages/home/home_page.dart';
import 'package:phal_flutter_todo_app/pages/login/login_page.dart';

abstract class AppPages {
  static const String INITIAL = Routes.LOGIN;
  static final pages = [
    GetPage(name: Routes.LOGIN, page: () => LoginPage()),
    GetPage(name: Routes.HOME, page: () => HomePage()),
  ];
}
