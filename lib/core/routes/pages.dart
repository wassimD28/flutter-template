import 'package:basic_mobile_app/view/screen/login_screen.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:basic_mobile_app/core/routes/routes.dart';
import 'package:basic_mobile_app/view/screen/on_boarding_screen.dart';
// You'll import other screens as you create them

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.onBoarding,
      page: () => const OnBoarding(),
      transition: Transition.fadeIn,
    ),

    // These pages will be uncommented as you create the actual screen widgets
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn,
    )
    /*
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
    ),
    */
  ];
}
