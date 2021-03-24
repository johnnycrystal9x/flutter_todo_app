import 'package:get/get.dart';
import 'package:phal_flutter_todo_app/routers/app_routers.dart';
import 'package:phal_flutter_todo_app/pages/home/home_page.dart';
import 'package:phal_flutter_todo_app/pages/login/login_page.dart';

/// Created by JB Pha Le on 3/24/21.
/// johnnycrystal9x@gmail.com

class AppPages {
  static const String INITIAL = AppRoutes.LOGIN;
  static final List<GetPage> routes = <GetPage>[
    GetPage(
      name:AppRoutes.LOGIN,
      page: () => LoginPage(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      transition: Transition.noTransition,
    ),
  ];
}
