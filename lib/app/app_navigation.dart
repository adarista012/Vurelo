// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:vurelo/app/presentation/login/login_view.dart';
import 'package:vurelo/app/presentation/onboarding/onboarding_binding.dart';
import 'package:vurelo/app/presentation/onboarding/onboarding_view.dart';
import 'presentation/splash/splash_binding.dart';
import 'presentation/splash/splash_view.dart';

abstract class Routes {
  static const ONBOARDING = '/onboarding';
  static const LOGIN = '/login';
  static const SPLASH = '/';
}

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.zoom,
    ),

    GetPage(
      name: Routes.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
      transition: Transition.zoom,
    ),

    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),

      transition: Transition.zoom,
    ),
  ];
}
