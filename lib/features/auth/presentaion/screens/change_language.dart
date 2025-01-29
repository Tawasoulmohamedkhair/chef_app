import 'package:chef_app/core/utils/app_assets.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/widget/custom-button.dart';
import 'package:chef_app/core/widget/custome-image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Customeimage(
              imagepath: AppAssets.background,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 116.h,
                  ),
                  Customeimage(
                    imagepath: AppAssets.logo,
                    height: 120.h,
                    width: 120.w,
                  ),
                  SizedBox(height: 16.h),
                  Text('Welcome to Chef App',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: AppColors.blakbold)),
                  SizedBox(height: 54.h),
                  Text('Please choose your language ',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: AppColors.blakbold)),
                  SizedBox(height: 120.h),
                  Row(
                    children: [
                      CustomButton(
                          height: 48.h,
                          width: 140.h,
                          color: AppColors.blakbold,
                          text: 'English'),
                      const Spacer(),
                      CustomButton(
                        height: 48.h,
                        width: 140.h,
                        color: AppColors.blakbold,
                        text: 'العربيه',
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}