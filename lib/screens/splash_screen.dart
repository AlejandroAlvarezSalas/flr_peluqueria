import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pelucapp/screens/front_page_screen.dart';
import 'package:pelucapp/theme/app_theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Get.to(const FrontPageScreen());
    }); 
    return const Scaffold(
      backgroundColor: AppTheme.backgroundColor,
       body: Center(
          child: Image(image: AssetImage('assets/logo.png'),height: 150,),
        ),
    );
  }
}