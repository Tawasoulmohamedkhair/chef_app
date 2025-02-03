// import 'package:chef_app/core/routes/app_routes.dart';
// import 'package:chef_app/core/theme/app_theme.dart';
// import 'package:chef_app/features/auth/presentaion/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context,child)=>const MaterialApp(
        // initialRoute: Routes.intitlRoute,
        // title: 'Flutter Demo',
        // theme: getAppTheme(),
        home: Scaffold(),
      ),
    );

  }
}
