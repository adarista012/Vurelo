import 'package:get/get.dart';
import 'package:vurelo/app/app_navigation.dart';
import 'package:vurelo/app/domain/use_cases/get_key_account_use_case.dart';
import 'package:vurelo/app/domain/use_cases/get_show_onboarding_use_case.dart';
import 'package:vurelo/app/domain/use_cases/set_show_onboarding_use_case.dart';

class SplashController extends GetxController {
  String? _path;
  String? get path => _path;

  String? _route;

  final GetKeyAccountUseCase _getKeyAccountUseCase;

  final GetShowOnboardingUseCase _getShowOnboardingUseCase;
  final SetShowOnboardingUseCase _setShowOnboardingUseCase;

  SplashController({
    required GetKeyAccountUseCase getKeyAccountUseCase,
    required GetShowOnboardingUseCase getShowOnboardingUseCase,
    required SetShowOnboardingUseCase setShowOnboardingUseCase,
  }) : _getKeyAccountUseCase = getKeyAccountUseCase,
       _getShowOnboardingUseCase = getShowOnboardingUseCase,
       _setShowOnboardingUseCase = setShowOnboardingUseCase {
    _init();
  }

  void _init() {
    imageSetter();
  }

  void imageSetter() async {
    _path = 'assets/icon.svg';

    await Future.delayed(const Duration(milliseconds: 1240));
    _path = 'assets/name.svg';
    update();

    toogle();
  }

  void toogle() async {
    final bool? showOnboarding = _getShowOnboardingUseCase.call();
    final String? isLogged = _getKeyAccountUseCase.call();

    _route =
        showOnboarding == false
            ? isLogged == null
                ? Routes.LOGIN
                : Routes.HOME
            : Routes.ONBOARDING;
    await _setShowOnboardingUseCase.call(params: false);

    if (_route != null) {
      await Future.delayed(const Duration(milliseconds: 1240));

      await Get.offAllNamed(_route!);
    }
  }
}
