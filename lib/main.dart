import 'package:chef_app/app/app.dart';
import 'package:chef_app/core/services/service_locator.dart';
import 'package:chef_app/features/auth/cubit/forgetpassword/forgetpassword_cubit.dart';
import 'package:chef_app/features/auth/cubit/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';

import 'core/bloc/cubit/global_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();

  await serviceLoactor<CacheHelper>().init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              serviceLoactor<GlobalCubit>()..getcachedlanguage(),
        ),
        BlocProvider(create: (context) => serviceLoactor<LoginCubit>()),
        BlocProvider(
            create: (context) => serviceLoactor<ForgetPasswordCubit>()),
      ],
      child: const MyApp(),
    ),
  );
}
