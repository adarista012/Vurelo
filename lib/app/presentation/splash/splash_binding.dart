import 'package:get/get.dart';
import 'package:vurelo/app/domain/use_cases/get_key_account_use_case.dart';
import 'package:vurelo/app/domain/use_cases/get_show_onboarding_use_case.dart';
import 'package:vurelo/app/domain/use_cases/set_show_onboarding_use_case.dart';
import 'splash_controller.dart';

class SplashBinding extends Bindings {
  final GetKeyAccountUseCase _getKeyAccountUseCase;
  final GetShowOnboardingUseCase _getShowOnboardingUseCase;
  final SetShowOnboardingUseCase _setShowOnboardingUseCase;

  SplashBinding({
    required GetKeyAccountUseCase getKeyAccountUseCase,
    required GetShowOnboardingUseCase getShowOnboardingUseCase,
    required SetShowOnboardingUseCase setShowOnboardingUseCase,
  }) : _getKeyAccountUseCase = getKeyAccountUseCase,
       _getShowOnboardingUseCase = getShowOnboardingUseCase,
       _setShowOnboardingUseCase = setShowOnboardingUseCase;

  @override
  void dependencies() {
    Get.lazyPut(
      () => SplashController(
        getKeyAccountUseCase: _getKeyAccountUseCase,
        getShowOnboardingUseCase: _getShowOnboardingUseCase,
        setShowOnboardingUseCase: _setShowOnboardingUseCase,
      ),
    );
  }
}
