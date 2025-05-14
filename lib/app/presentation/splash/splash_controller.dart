import 'package:get/get.dart';
import 'package:vurelo/app/app_navigation.dart';

class SplashController extends GetxController {
  String? _path;
  String? get path => _path;

  String? _route;

  SplashController() {
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
    _route = Routes.ONBOARDING;

    if (_route != null) {
      await Future.delayed(const Duration(milliseconds: 1240));
      await Get.offAllNamed(_route!);
    }
  }
}
