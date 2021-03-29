/// Created by JB Pha Le on 3/24/21.
/// johnnycrystal9x@gmail.com

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:phal_flutter_todo_app/constants/colors.dart';
import 'package:phal_flutter_todo_app/constants/strings.dart';
import 'package:phal_flutter_todo_app/routers/app_routers.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController(text: "account_test");
  TextEditingController passwordController = TextEditingController(text: "password_test");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(10).copyWith(top: 50),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    Strings.appName,
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  )),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: Strings.userName,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: Strings.password,
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: AppColors.primaryColor,
                  onSurface: Colors.white,
                  elevation: 0,
                ),
                child: Text(Strings.forgotPassword),
                onPressed: () {
                  //forgot password screen
                },
              ),
              Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: AppColors.primaryColor,
                      onSurface: Colors.grey,
                    ),
                    child: Text(
                      Strings.login,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                      // Log
                      log(nameController.text);
                      log(passwordController.text);

                      // Go to Home Sreen
                      Get.offAndToNamed(Routes.HOME);
                    },
                  )),
              Container(
                  child: Row(
                children: <Widget>[
                  Text(
                    Strings.doesNotHaveAcc,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: AppColors.primaryColor,
                      onSurface: Colors.white,
                      elevation: 0,
                    ),
                    child: Text(
                      Strings.signIn,
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      //signup screen
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ))
            ],
          )),
    );
  }
}
