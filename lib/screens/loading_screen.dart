import 'package:flutter/material.dart';
import 'package:pelucapp/theme/app_theme.dart';

class LoadingScreen extends StatelessWidget {
   
  const LoadingScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
         child: CircularProgressIndicator(
          color: AppTheme.primary,
         ),
      ),
    );
  }
}