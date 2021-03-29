import 'package:flutter/material.dart';
import '../constants/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
          alignment: Alignment.center,
          child: CircularProgressIndicator(
            backgroundColor: AppColors.primaryColor,
          )),
    );
  }
}
