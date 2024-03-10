import 'package:dmythra2/controller/check_login.dart';
import 'package:dmythra2/startingpage.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    // setLoginPreferfalse();
    Future.delayed(
        const Duration(
          seconds: 3,
        ), () {
         checkLoginStatus(context);
          }
    );

    return Scaffold(body: Center(child: CircularProgressIndicator(),),);
  }
}
