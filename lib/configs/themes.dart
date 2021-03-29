/// Created by JB Pha Le on 3/24/21.
/// johnnycrystal9x@gmail.com

import 'package:flutter/material.dart';
import 'package:phal_flutter_todo_app/constants/colors.dart';
import 'package:phal_flutter_todo_app/constants/dimens.dart';
import 'package:phal_flutter_todo_app/constants/strings.dart';

final ThemeData appTheme = ThemeData(
  backgroundColor: Colors.white,
  canvasColor: AppColors.backgroundColor2,
  primaryColor: AppColors.primaryColor,
  accentColor: AppColors.accentColor,
  appBarTheme: AppBarTheme(
    elevation: 1,
    color: AppColors.backgroundColor2,
    centerTitle: true,
    textTheme: TextTheme(
      headline6: bodyStyle,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.accentColor,
    ),
  ),
  fontFamily: Strings.fontMulish,
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.primaryColor,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.backgroundColor2,
    selectedIconTheme: IconThemeData(color: AppColors.primaryColor, size: 16),
    selectedLabelStyle: bodySevActive,
    selectedItemColor: AppColors.primaryColor,
    showUnselectedLabels: true,
    showSelectedLabels: true,
    unselectedIconTheme: IconThemeData(color: AppColors.neutralColor2, size: 16),
    unselectedItemColor: AppColors.neutralColor2,
    unselectedLabelStyle: bodySev,
  ),
);

const TextStyle textDef = TextStyle(
  fontSize: Dimens.smallFontSize,
  fontFamily: Strings.fontMulish,
  color: AppColors.neutralColor1,
  fontWeight: FontWeight.normal,
  fontStyle: FontStyle.normal,
);

const TextStyle bodyStyle = TextStyle(
  fontSize: Dimens.largeFontSize,
  fontFamily: Strings.fontMulish,
  color: AppColors.neutralColor1,
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.normal,
);

const TextStyle bodySev = TextStyle(
  fontSize: Dimens.mediumFontSize,
  fontFamily: Strings.fontMulish,
  color: AppColors.neutralColor3,
  fontWeight: FontWeight.normal,
  fontStyle: FontStyle.normal,
);

const TextStyle bodySevActive = TextStyle(
  fontSize: Dimens.mediumFontSize,
  fontFamily: Strings.fontMulish,
  color: AppColors.neutralColor1,
  fontWeight: FontWeight.normal,
  fontStyle: FontStyle.normal,
);
