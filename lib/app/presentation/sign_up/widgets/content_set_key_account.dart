import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vurelo/app/app_text_styles.dart';
import 'package:vurelo/app/presentation/sign_up/sign_up_controller.dart';
import 'package:vurelo/app/presentation/widgets/gap.dart';
import 'package:vurelo/app/presentation/widgets/generic_input_value.dart';

Widget contentSetKeyAccount(
  BuildContext context,
) => GetBuilder<SignUpController>(
  builder: (controller) {
    return Expanded(
      child: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ponle clave a tu cuenta',
                  style: AppTextStyles.bodyLargeBold,
                ),
                gap(height: 8.0),
                Text(
                  'Elige una clave segura para entrar a Vurelo y mover tu plata con confianza.',
                ),

                gap(height: 60.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  spacing: 8,
                  children: [
                    genericInputValue(
                      1,
                      false,
                      controller.setKeyTEC1,
                      context,
                      controller.onChangedSetKey,
                      obscureText: true,
                    ),
                    genericInputValue(
                      2,
                      false,
                      controller.setKeyTEC2,
                      context,
                      controller.onChangedSetKey,
                      obscureText: true,
                    ),
                    genericInputValue(
                      3,
                      false,
                      controller.setKeyTEC3,
                      context,
                      controller.onChangedSetKey,
                      obscureText: true,
                    ),
                    genericInputValue(
                      4,
                      false,
                      controller.setKeyTEC4,
                      context,
                      controller.onChangedSetKey,
                      obscureText: true,
                    ),
                    genericInputValue(
                      5,
                      false,
                      controller.setKeyTEC5,
                      context,
                      controller.onChangedSetKey,
                      obscureText: true,
                    ),
                    genericInputValue(
                      6,
                      false,
                      controller.setKeyTEC6,
                      context,
                      controller.onChangedSetKey,
                      obscureText: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  },
);
