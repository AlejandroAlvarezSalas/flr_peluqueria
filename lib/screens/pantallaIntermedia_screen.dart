import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pelucapp/screens/front_page_screen.dart';
import 'package:pelucapp/screens/home_screen.dart';
import 'package:pelucapp/theme/app_theme.dart';

class PantallaIntermediaSreen extends StatelessWidget {
  const PantallaIntermediaSreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      Get.to(const HomeScreen());
    });
    return const Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Center(
        child: Image(
          image: AssetImage('assets/logo.png'),
          height: 150,
        ),
      ),
    );
  }
}
