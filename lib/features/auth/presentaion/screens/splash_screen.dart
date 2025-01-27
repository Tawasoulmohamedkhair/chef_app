import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Image.asset('assets/images/logo.png'),
        Text('Chef App', style: Theme.of(context).textTheme.displayLarge),
      ],
    ));
  }
}