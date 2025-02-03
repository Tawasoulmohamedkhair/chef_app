
import 'package:chef_app/core/local/app_local.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utils/app_assets.dart';
import 'package:chef_app/core/utils/app_string.dart';
import 'package:chef_app/core/utils/commons.dart';
import 'package:chef_app/core/widget/custom_button.dart';
import 'package:chef_app/core/widget/custom_loading.dart';
import 'package:chef_app/core/widget/custom_text_form_field.dart';
import 'package:chef_app/core/widget/custome_image.dart';
import 'package:chef_app/features/auth/cubit/login/login_cubit.dart';
import 'package:chef_app/features/auth/cubit/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  const Customeimage(
                    imagepath: AppAssets.backgroundTwo,
                    width: double.infinity,
                  ),
                  Center(
                    child: Text(
                      AppString.welcomeBack.tr(context),
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100.h,
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSucessState) {
                      showToast(
                          message: AppString.loginSucessfully.tr(context),
                          state: ToastStates.success);
                      navigate(context: context, route: Routes.changeLanguage);
                    }
                    if (state is LoginErrorState) {
                      showToast(
                          message: state.message, state: ToastStates.error);
                    }
                  },
                  builder: (context, state) {
                    return Form(
                      key: BlocProvider.of<LoginCubit>(context).loginkey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            controller: BlocProvider.of<LoginCubit>(context)
                                .emailCOntroller,
                            hint: AppString.email.tr(context),
                            label: AppString.email.tr(context),
                            validator: (data) {
                              if (data!.isEmpty ||
                                  !data.contains('@gmail.com')) {
                                return AppString.pleaseEnterValidEmail
                                    .tr(context);
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          CustomTextFormField(
                            controller: BlocProvider.of<LoginCubit>(context)
                                .passwordController,
                            hint: AppString.password.tr(context),
                            label: AppString.password.tr(context),
                            obscureText: BlocProvider.of<LoginCubit>(context)
                                .isLoginPasswordShowing,
                            suffixIconOnPressed: () {
                              BlocProvider.of<LoginCubit>(context)
                                  .changeLoginPasswordSuffixIcon();
                            },
                            icon:
                                BlocProvider.of<LoginCubit>(context).suffixIcon,
                            validator: (data) {
                              if (data!.length < 6 || data.isEmpty) {
                                return AppString.pleaseEnterValidPassword
                                    .tr(context);
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  navigate(
                                    context: context,
                                    route: Routes.sendCode,
                                  );
                                },
                                child: Text(
                                  AppString.forgetPassword.tr(context),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 64.h,
                          ),
                          state is LoginloadingState
                              ? const CustomLoadingIndicator()
                              : CustomButton(
                                  onPressed: () {
                                    if (BlocProvider.of<LoginCubit>(context)
                                        .loginkey
                                        .currentState!
                                        .validate()) {
                                      BlocProvider.of<LoginCubit>(context)
                                          .login();
                                    }
                                  },
                                  text: AppString.signIn.tr(
                                    context,
                                  ),
                                ),
                          SizedBox(
                            height: 72.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(AppString.dontHaveAnAccount.tr(context)),
                              TextButton(
                                onPressed: () {},
                                child: Text(AppString.signUp.tr(context)),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
