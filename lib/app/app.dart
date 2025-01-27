import 'package:chef_app/core/theme/app_theme.dart';
import 'package:chef_app/features/auth/presentaion/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: getAppTheme(),
      home: const SplashScreen(),
    );
  }
}
