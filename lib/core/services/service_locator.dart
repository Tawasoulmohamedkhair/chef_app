import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/api/dio_consumer.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/features/auth/cubit/forgetpassword/forgetpassword_cubit.dart';
import 'package:chef_app/features/auth/cubit/login/login_cubit.dart';
import 'package:chef_app/features/auth/data/repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final serviceLoactor = GetIt.instance;

void initServiceLocator() {
  //cubits
  serviceLoactor.registerLazySingleton(() => GlobalCubit());
  //cubits
  serviceLoactor.registerLazySingleton(() => LoginCubit(serviceLoactor()));
  //cubits
  serviceLoactor
      .registerLazySingleton(() => ForgetPasswordCubit(serviceLoactor()));
  //auth Features
  serviceLoactor.registerLazySingleton(() => AuthRepository());
//external
  serviceLoactor.registerLazySingleton(() => CacheHelper());
  //Apiconsumer
  serviceLoactor
      .registerLazySingleton<ApiConsumer>(() => DioConsumer(serviceLoactor()));

  //dio
  serviceLoactor.registerLazySingleton(() => Dio());
}
