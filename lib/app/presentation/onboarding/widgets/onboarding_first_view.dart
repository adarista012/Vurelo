import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vurelo/app/app_text_styles.dart';
import 'package:vurelo/app/presentation/widgets/gap.dart';

Widget onboardingFirstView() => SingleChildScrollView(
  child: Column(
    children: [
      gap(height: Get.width / 40),
      Image.asset("assets/smartphone_coins.png"),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          '¡Bienvenido a la nueva era de tu dinero!',
          style: AppTextStyles.bodyExtraLargeBold,
          textAlign: TextAlign.center,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Text(
          'Gestiona tu dinero digital sin fronteras y sin enredos.\n Toma el control de tu plata y muévete sin complicaciones con Vurelo.',
          style: AppTextStyles.bodyRegular,
          textAlign: TextAlign.center,
        ),
      ),
    ],
  ),
);
