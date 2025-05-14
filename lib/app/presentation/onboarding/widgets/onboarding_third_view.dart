import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vurelo/app/app_text_styles.dart';
import 'package:vurelo/app/presentation/widgets/gap.dart';

Widget onboardingThirdView() => SingleChildScrollView(
  child: Column(
    children: [
      gap(height: Get.width / 40),
      Image.asset("assets/lock.png"),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Tu plata segura, ¡sin estrés!',
          style: AppTextStyles.bodyExtraLargeBold,
          textAlign: TextAlign.center,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Text(
          'Con Vurelo, tu dinero digital está en buenas manos. Relájate y disfruta de mover tu plata sin preocupaciones.',
          style: AppTextStyles.bodyRegular,
          textAlign: TextAlign.center,
        ),
      ),
    ],
  ),
);
