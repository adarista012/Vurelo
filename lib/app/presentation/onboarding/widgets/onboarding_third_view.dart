import 'package:flutter/material.dart';

Widget onboardingThirdView() => SingleChildScrollView(
  child: Column(
    children: [
      Image.asset("assets/lock.png"),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Tu plata segura, ¡sin estrés!',
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
          'Con Vurelo, tu dinero digital está en buenas manos. Relájate y disfruta de mover tu plata sin preocupaciones.',
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
