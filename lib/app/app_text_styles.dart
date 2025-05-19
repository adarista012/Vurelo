import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vurelo/app/app_colors.dart';

abstract class AppTextStyles {
  static TextStyle error = TextStyle(
    fontSize: (Get.width * 0.16) / 4,
    color: AppColors.error,
    fontWeight: FontWeight.w700,
  );

  static TextStyle bodyExtraLargeBold = TextStyle(
    fontSize: (Get.width * 0.39) / 4,
    fontWeight: FontWeight.w700,
    height: 1,
  );

  static TextStyle bodyLargeBold = TextStyle(
    fontSize: (Get.width * 0.28) / 4,
    fontWeight: FontWeight.w700,
    height: 1,
  );

  static TextStyle bodyRegular = TextStyle(
    fontSize: (Get.width * 0.16) / 4,
    fontWeight: FontWeight.w400,
    height: 1.2,
  );

  static TextStyle bodyBold = TextStyle(
    fontSize: (Get.width * 0.14) / 4,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );

  static TextStyle titleSmallBold = TextStyle(
    color: AppColors.primary,
    fontSize: (Get.width * 0.14) / 4,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );

  static TextStyle textButton = TextStyle(
    color: AppColors.primary,
    fontWeight: FontWeight.w700,
  );

  static TextStyle textButtonUnderLine = TextStyle(
    color: AppColors.primary,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.underline,
  );
}
