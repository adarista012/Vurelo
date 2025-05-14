import 'package:get/get.dart';
import 'package:vurelo/app/app_navigation.dart';
import 'package:vurelo/app/domain/repositories/local_storage_repository.dart';

class SplashController extends GetxController {
  String? _path;
  String? get path => _path;

  String? _route;
  final LocalStorageRepository localStorageRepository;

  SplashController(this.localStorageRepository) {
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
    final bool? showOnboarding = localStorageRepository.getShowOnboarding();

    _route = showOnboarding == false ? Routes.LOGIN : Routes.ONBOARDING;
    await localStorageRepository.setShowOnboarding();

    if (_route != null) {
      await Future.delayed(const Duration(milliseconds: 1240));

      await Get.offAllNamed(_route!);
    }
  }
}
