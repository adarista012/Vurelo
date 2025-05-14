import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vurelo/app/app_colors.dart';
import 'package:vurelo/app/presentation/widgets/gap.dart';
import 'package:vurelo/app/presentation/widgets/generic_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              gap(height: 58),
              SvgPicture.asset("assets/name_header.svg"),

              gap(height: 24),
              Image.asset("assets/smartphone_coins.png"),

              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  'Tu puerta de entrada a la economía digital',
                  style: TextStyle(
                    fontSize: 39.0,
                    fontWeight: FontWeight.w700,
                    height: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              Spacer(),

              genericButton('Quiero unirme a Vurelo', context),
              gap(height: 8.0),
              genericButton('Ya soy usuario', context, isPrimary: false),
              gap(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
