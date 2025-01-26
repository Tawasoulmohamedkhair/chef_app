import 'package:chef_app/features/auth/presentaion/screens/change_language.dart';
import 'package:chef_app/features/auth/presentaion/screens/login_screen.dart';
import 'package:chef_app/features/auth/presentaion/screens/reset_password_screen.dart';
import 'package:chef_app/features/auth/presentaion/screens/send_code_screen.dart';
import 'package:chef_app/features/auth/presentaion/screens/splash_screen.dart';
import 'package:chef_app/features/menu/presentation/screens/add_meal_screen.dart';
import 'package:chef_app/features/menu/presentation/screens/menu_home_screen.dart';
import 'package:chef_app/features/profile/presentation/screens/change_password_screen.dart';
import 'package:chef_app/features/profile/presentation/screens/profile_home_screen.dart';
import 'package:chef_app/features/profile/presentation/screens/setting_screen.dart';
import 'package:chef_app/features/profile/presentation/screens/update_profile_home_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String intitlRoute = '/';
  static const String login = '/login';
  static const String changeLanguage = '/changeLanguage';
  static const String sendCode = '/sendcode';
  static const String resetPassword = '/resetPassword';
  static const String menuHome = '/menuHome';
  static const String addMeal = '/addMeal';
  static const String setting = '/setting';
  static const String profileHome = '/profileHome';
  static const String updateProfile = '/updateProfile';
  static const String changePassword = '/ changePassword';
  static const String home = '/home';
}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.intitlRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.changeLanguage:
        return MaterialPageRoute(builder: (_) => const ChangeLanguageScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.sendCode:
        return MaterialPageRoute(builder: (_) => const SendCodeScreen());
      case Routes.resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());

      case Routes.menuHome:
        return MaterialPageRoute(builder: (_) => const MenuHomeScreen());
      case Routes.addMeal:
        return MaterialPageRoute(builder: (_) => const AddMealScreen());

      case Routes.profileHome:
        return MaterialPageRoute(builder: (_) => const ProfileHomeScreen());
      case Routes.updateProfile:
        return MaterialPageRoute(builder: (_) => const UpdateProfileScreen());
      case Routes.setting:
        return MaterialPageRoute(builder: (_) => const SettingScreen());
      case Routes.changePassword:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());

      // case Routes.home:
      //   return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text('No Found Route'),
                  ),
                ));
    }
  }
}
