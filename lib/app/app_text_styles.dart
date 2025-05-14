import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class AppTextStyles {
  static TextStyle bodyExtraLargeBold = TextStyle(
    fontSize: (Get.width * 0.39) / 4,
    fontWeight: FontWeight.w700,
    height: 1,
  );

  static TextStyle bodyRegular = TextStyle(
    fontSize: (Get.width * 0.16) / 4,
    fontWeight: FontWeight.w400,
    height: 1.2,
  );
}
