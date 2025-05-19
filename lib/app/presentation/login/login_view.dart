import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vurelo/app/app_navigation.dart';
import 'package:vurelo/app/app_text_styles.dart';
import 'package:vurelo/app/presentation/widgets/gap.dart';
import 'package:vurelo/app/presentation/widgets/generic_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              gap(height: 48),
              SvgPicture.asset("assets/name_header.svg"),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/smartphone_coins.png",
                        height: Get.height / 2,
                      ),

                      Text(
                        'Tu puerta de entrada a la economía digital',
                        style: AppTextStyles.bodyExtraLargeBold,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              genericButton(
                'Quiero unirme a Vurelo',
                () => Get.toNamed(Routes.SIGN_UP),
                context,
              ),
              gap(height: 8.0),
              genericButton(
                'Ya soy usuario',
                () => Get.toNamed(Routes.SIGN_IN),
                context,
                isPrimary: false,
              ),
              gap(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
