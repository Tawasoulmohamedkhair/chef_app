import 'package:bloc/bloc.dart';
import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/services/service_locator.dart';
import 'package:chef_app/features/auth/cubit/login/login_state.dart';
import 'package:chef_app/features/auth/data/models/login_model.dart';
import 'package:chef_app/features/auth/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepository) : super(LoginInitial());
  final AuthRepository loginRepository;
  GlobalKey<FormState> loginkey = GlobalKey<FormState>();
  TextEditingController emailCOntroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoginPasswordShowing = true;
  IconData suffixIcon = Icons.visibility;
  void changeLoginPasswordSuffixIcon() {
    isLoginPasswordShowing = !isLoginPasswordShowing;
    suffixIcon =
        isLoginPasswordShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeLoginPasswordSuffixIcon());
  }

  //login method
  LoginModel? loginModel;
  void login() async {
    emit(LoginloadingState());
    final result = await loginRepository.login(
      email: emailCOntroller.text,
      password: passwordController.text,
    );
    result.fold(
      (L) => emit(LoginErrorState(L)),
      (r) async {
        loginModel = r;
        await serviceLoactor<CacheHelper>()
            .saveData(key: ApiKeys.token, value: r.token);
        emit(LoginSucessState());
      },
    );
  }
}
