import 'package:chef_app/core/local/app_local.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utils/app_assets.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_string.dart';
import 'package:chef_app/core/utils/commons.dart';
import 'package:chef_app/core/widget/custome_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    navigateafterthreesecond();

    super.initState();
  }

  void navigateafterthreesecond() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      if (!mounted) return;
      navigate(
        context: context,
        route: Routes.changeLanguage,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Customeimage(
            imagepath: AppAssets.logo,
            height: 120.h,
            width: 120.w,
          ),
          
          SizedBox(height: 16.h),
          Text(AppString.chefApp.tr(context),
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: AppColors.blakbold)),
        ],
      )),
    );
  }
}
