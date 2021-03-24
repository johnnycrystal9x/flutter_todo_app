/// Created by JB Pha Le on 3/24/21.
/// johnnycrystal9x@gmail.com

import 'package:flutter/material.dart';
import 'package:phal_flutter_todo_app/constants/colors.dart';

final ThemeData appTheme = ThemeData(
  backgroundColor: Colors.white,
  canvasColor: AppColors.backgroundTwoColor,
  primaryColor: AppColors.primaryColor,
  accentColor: AppColors.accentOneColor,
  appBarTheme: AppBarTheme(
    elevation: 0,
    color: AppColors.backgroundTwoColor,
    centerTitle: true,
    textTheme: TextTheme(
      headline6: bodyStyle,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.accentOneColor,
    ),
  ),
  fontFamily: 'Mulish',
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.primaryColor,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.backgroundTwoColor,
    selectedIconTheme: IconThemeData(color: AppColors.primaryColor, size: 16),
    selectedLabelStyle: bodySevActivated,
    selectedItemColor: AppColors.primaryColor,
    showUnselectedLabels: true,
    showSelectedLabels: true,
    unselectedIconTheme: IconThemeData(color: AppColors.neutralThreeColor, size: 16),
    unselectedItemColor: AppColors.neutralThreeColor,
    unselectedLabelStyle: bodySev,
  ),
);

const TextStyle bodyStyle = TextStyle(
  fontSize: 16,
  fontFamily: 'Mulish',
  color: AppColors.neutralOneColor,
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.normal,
);

const TextStyle bodySev = TextStyle(
  fontSize: 14,
  fontFamily: 'Mulish',
  color: AppColors.neutralFourColor,
  fontWeight: FontWeight.normal,
  fontStyle: FontStyle.normal,
);

const TextStyle bodySevActivated = TextStyle(
  fontSize: 14,
  fontFamily: 'Mulish',
  color: AppColors.neutralOneColor,
  fontWeight: FontWeight.normal,
  fontStyle: FontStyle.normal,
);
