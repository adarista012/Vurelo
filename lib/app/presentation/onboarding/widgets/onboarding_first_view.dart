import 'package:flutter/material.dart';

Widget onboardingFirstView() => SingleChildScrollView(
  child: Column(
    children: [
      Image.asset("assets/smartphone_coins.png"),
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text(
          '¡Bienvenido a la nueva era de tu dinero!',
          style: TextStyle(
            fontSize: 39.0,
            fontWeight: FontWeight.w700,
            height: 1,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        child: Text(
          'Gestiona tu dinero digital sin fronteras y sin enredos.\n Toma el control de tu plata y muévete sin complicaciones con Vurelo.',
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
