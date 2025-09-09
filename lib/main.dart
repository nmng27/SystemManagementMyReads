import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management_books_system_web/Screens/login_screen.dart';
import 'package:management_books_system_web/Screens/register_screen.dart';

void main(List<String> args) {
  runApp(Pages());
}

class Pages extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/login",
      getPages: [
        GetPage(name: "/login", page: ()=>LoginScreen()),
        GetPage(name: "/register", page: ()=>RegisterScreen())
      ],
    );
  }
}