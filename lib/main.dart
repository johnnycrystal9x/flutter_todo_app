/// Created by JB Pha Le on 3/24/21.
/// johnnycrystal9x@gmail.com

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/get.dart';
import 'package:phal_flutter_todo_app/configs/themes.dart';
import 'package:phal_flutter_todo_app/constants/strings.dart';
import 'package:phal_flutter_todo_app/redux/app_store.dart';
import 'package:phal_flutter_todo_app/routers/app_pages.dart';
import 'package:phal_flutter_todo_app/utils/logger.dart';
import 'package:responsive_framework/responsive_framework.dart';

Future<void> main() async {
  // Ensure initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Set App portrait mode
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Catch error
  runZonedGuarded(() {
    runApp(TodoApp());
  }, (error, stackTrace) {
    log('Error: $error');
    log('Stack: $stackTrace');
  });
}

class TodoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: appStore,
      child: GetMaterialApp(
        title: Strings.appName,
        enableLog: true,
        logWriterCallback: Logger.write,
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: appTheme,
        builder: (BuildContext context, Widget child) {
          return ResponsiveWrapper.builder(
            child,
            maxWidth: 800,
            minWidth: 400,
            defaultScale: true,
            mediaQueryData: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          );
        },
      ),
    );
  }
}
