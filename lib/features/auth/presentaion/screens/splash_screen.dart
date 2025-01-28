import 'package:chef_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
          child: Column(
        children: [
          Image.asset('assets/logo.png'),
          Text('Chef App', style: Theme.of(context).textTheme.displayLarge),
        ],
      )),
    );
  }
}