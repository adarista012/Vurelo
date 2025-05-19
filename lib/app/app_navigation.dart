// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:vurelo/app/presentation/home/home_binding.dart';
import 'package:vurelo/app/presentation/home/home_view.dart';
import 'package:vurelo/app/presentation/login/login_view.dart';
import 'package:vurelo/app/presentation/onboarding/onboarding_binding.dart';
import 'package:vurelo/app/presentation/onboarding/onboarding_view.dart';
import 'package:vurelo/app/presentation/sign_in/sign_in.dart';
import 'package:vurelo/app/presentation/sign_up/sign_up_view.dart';
import 'package:vurelo/app/presentation/sign_up/sign_up_binding.dart';
import 'presentation/splash/splash_binding.dart';
import 'presentation/splash/splash_view.dart';

abstract class Routes {
  static const HOME = '/home';
  static const ONBOARDING = '/onboarding';
  static const LOGIN = '/login';
  static const SIGN_IN = '/sign-in';
  static const SIGN_UP = '/sign-up';
  static const SPLASH = '/';
}

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(
        getKeyAccountUseCase: Get.find(),
        getShowOnboardingUseCase: Get.find(),
        setShowOnboardingUseCase: Get.find(),
      ),
      transition: Transition.zoom,
    ),

    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(
        getNameUseCase: Get.find(),
        getEmailAddressUseCase: Get.find(),
        getPhoneNumberUseCase: Get.find(),
        getKeyAccountUseCase: Get.find(),
      ),
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

    GetPage(name: Routes.SIGN_IN, page: () => const SignIn()),

    GetPage(
      name: Routes.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(
        setEmailAddressUseCase: Get.find(),
        setKeyAccountUseCase: Get.find(),
        setNameUseCase: Get.find(),
        setPhoneNumberUseCase: Get.find(),
      ),
    ),
  ];
}
