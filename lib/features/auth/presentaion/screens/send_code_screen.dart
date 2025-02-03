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

class SendCodeScreen extends StatelessWidget {
  const SendCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
              if (state is SendCodeSucess) {
                //1-show message
                showToast(message: state.message, state: ToastStates.success);
                //navigate to resetpasswordscreen
                navigate(context: context, route: Routes.resetPassword);
              }
            },
            builder: (context, state) {
              return Form(
                key: BlocProvider.of<ForgetPasswordCubit>(context).sendCodeKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    Customeimage(
                      imagepath: AppAssets.lock,
                      width: 300.h,
                      height: 300.h,
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    Text(AppString.sendResetLinkInfo.tr(context)),
                    SizedBox(
                      height: 26.h,
                    ),
                    CustomTextFormField(
                      controller: BlocProvider.of<ForgetPasswordCubit>(context)
                          .emailController,
                      hint: AppString.email.tr(context),
                      label: AppString.email.tr(context),
                      validator: (data) {
                        if (data!.isEmpty || !data.contains('@gmail.com')) {
                          return AppString.pleaseEnterValidEmail.tr(context);
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    state is SendCodeLoading
                        ? const CustomLoadingIndicator()
                        : CustomButton(
                            onPressed: () {
                              if (BlocProvider.of<ForgetPasswordCubit>(context)
                                  .sendCodeKey
                                  .currentState!
                                  .validate()) {
                                BlocProvider.of<ForgetPasswordCubit>(context)
                                    .sendCode();
                              }
                            },
                            text: AppString.sendResetLink.tr(context),
                          ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    ));
  }
}
