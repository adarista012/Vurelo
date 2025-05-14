import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vurelo/app/app_colors.dart';
import 'package:vurelo/app/app_text_styles.dart';
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
              gap(height: 48),
              SvgPicture.asset("assets/name_header.svg"),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      gap(height: Get.width / 40),
                      Image.asset("assets/smartphone_coins.png"),

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Tu puerta de entrada a la economía digital',
                          style: AppTextStyles.bodyExtraLargeBold,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
