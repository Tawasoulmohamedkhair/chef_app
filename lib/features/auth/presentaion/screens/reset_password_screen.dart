
import 'package:chef_app/core/local/app_local.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utils/app_assets.dart';
import 'package:chef_app/core/utils/app_string.dart';
import 'package:chef_app/core/utils/commons.dart';
import 'package:chef_app/core/widget/custom_button.dart';
import 'package:chef_app/core/widget/custom_loading.dart';
import 'package:chef_app/core/widget/custom_text_form_field.dart';
import 'package:chef_app/core/widget/custome_image.dart';
import 'package:chef_app/features/auth/cubit/forgetpassword/forgetpassword_cubit.dart';
import 'package:chef_app/features/auth/cubit/forgetpassword/forgetpassword_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            navigate(context: context, route: Routes.login);
          },
        ),
        title: Text(
          AppString.createYourNewPassword.tr(
            context,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is ResetPassworddeSucess) {
              //1.show message
              showToast(message: state.message, state: ToastStates.success);
              //2.navigate to login screen
              navigate(context: context, route: Routes.login);
            }
          },
          builder: (context, state) {
            return Form(
              key: BlocProvider.of<ForgetPasswordCubit>(context)
                  .resetPasswordKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //image
                    Padding(
                      padding: EdgeInsets.only(top: 40.h, bottom: 24.h),
                      child: const Customeimage(
                        imagepath: AppAssets.lock,
                      ),
                    ),
                    //text
                    Text(
                      AppString.createYourNewPassword.tr(context),
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    //textfield => Password
                    CustomTextFormField(
                      controller: BlocProvider.of<ForgetPasswordCubit>(context)
                          .newPasswordController,
                      hint: AppString.newPassword.tr(context),
                      obscureText: BlocProvider.of<ForgetPasswordCubit>(context)
                          .isNewPasswordShowing,
                      icon: BlocProvider.of<ForgetPasswordCubit>(context)
                          .suffixIconNewPassword,
                      suffixIconOnPressed: () {
                        BlocProvider.of<ForgetPasswordCubit>(context)
                            .changeNewPasswordSuffixIcon();
                      },
                      validator: (data) {
                        if (data!.length < 6 || data.isEmpty) {
                          return AppString.pleaseEnterValidPassword.tr(context);
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    //textfield => confirm Password
                    CustomTextFormField(
                      controller: BlocProvider.of<ForgetPasswordCubit>(context)
                          .confirmPasswordController,
                      hint: AppString.confirmPassword.tr(context),
                      obscureText: BlocProvider.of<ForgetPasswordCubit>(context)
                          .isConfirmPasswordShowing,
                      icon: BlocProvider.of<ForgetPasswordCubit>(context)
                          .suffixIconConfirmPassword,
                      suffixIconOnPressed: () {
                        BlocProvider.of<ForgetPasswordCubit>(context)
                            .changeConfrimPasswordSuffixIcon();
                      },
                      validator: (data) {
                        if (data!.length < 6 || data.isEmpty) {
                          return AppString.pleaseEnterValidPassword.tr(context);
                        }
                        if (data !=
                            BlocProvider.of<ForgetPasswordCubit>(context)
                                .newPasswordController
                                .text) {
                          return AppString.pleaseEnterValidPassword.tr(context);
                        }

                        return null;
                      },
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    //textfield => Code
                    CustomTextFormField(
                      controller: BlocProvider.of<ForgetPasswordCubit>(context)
                          .codeController,
                      hint: AppString.code.tr(context),
                      validator: (data) {
                        //12345s =>  null
                        //1234 => 1234
                        if (num.tryParse(data!) == null) {
                          return AppString.pleaseEnterValidCode.tr(context);
                        }
                        if (data.isEmpty) {
                          return AppString.pleaseEnterValidCode.tr(context);
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    //button
                    state is ResetPasswordLoading
                        ? const CustomLoadingIndicator()
                        : CustomButton(
                            onPressed: () {
                              if (BlocProvider.of<ForgetPasswordCubit>(context)
                                  .resetPasswordKey
                                  .currentState!
                                  .validate()) {
                                BlocProvider.of<ForgetPasswordCubit>(context)
                                    .resetPassword();
                              }
                            },
                            text: AppString.createYourNewPassword.tr(context),
                          ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
