import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vurelo/app/app_text_styles.dart';

import 'package:vurelo/app/presentation/widgets/gap.dart';

Widget onboardingSecondView() => SingleChildScrollView(
  child: Column(
    children: [
      gap(height: Get.width / 8),
      Image.asset("assets/cards.png"),
      gap(height: 32.0),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Tu Vurelo Card, tu mundo en tus manos.',
          style: AppTextStyles.bodyExtraLargeBold,
          textAlign: TextAlign.center,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Text(
          'Tu nueva tarjeta abre las puertas a experiencias sin límites, transacciones globales y un control total sobre tu dinero.',
          style: AppTextStyles.bodyRegular,
          textAlign: TextAlign.center,
        ),
      ),
    ],
  ),
);
