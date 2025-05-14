import 'package:flutter/material.dart';

import 'package:vurelo/app/presentation/widgets/gap.dart';

Widget onboardingSecondView() => SingleChildScrollView(
  child: Column(
    children: [
      gap(height: 52.0),
      Image.asset("assets/cards.png"),
      gap(height: 52.0),
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text(
          'Tu Vurelo Card, tu mundo en tus manos.',
          style: TextStyle(
            fontSize: 39.0,
            fontWeight: FontWeight.w700,
            height: 1,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
        child: Text(
          'Tu nueva tarjeta abre las puertas a experiencias sin límites, transacciones globales y un control total sobre tu dinero.',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            height: 1.2,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ],
  ),
);
