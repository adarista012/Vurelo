import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vurelo/app/app_text_styles.dart';
import 'package:vurelo/app/presentation/sign_up/sign_up_controller.dart';
import 'package:vurelo/app/presentation/widgets/gap.dart';
import 'package:vurelo/app/presentation/widgets/generic_input_value.dart';

Widget contentVerifyKeyAccount(
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
                  'Por último, confirma tu clave',
                  style: AppTextStyles.bodyLargeBold,
                ),
                gap(height: 8.0),
                Text(
                  'Sabemos que eres tú... pero solo queremos estar seguros.',
                ),

                gap(height: 60.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  spacing: 8,
                  children: [
                    genericInputValue(
                      1,
                      controller.keyCodeError,
                      controller.verifyKeyTEC1,
                      context,
                      controller.onChangedVerifyKey,
                      obscureText: true,
                    ),
                    genericInputValue(
                      2,
                      controller.keyCodeError,
                      controller.verifyKeyTEC2,
                      context,
                      controller.onChangedVerifyKey,
                      obscureText: true,
                    ),
                    genericInputValue(
                      3,
                      controller.keyCodeError,
                      controller.verifyKeyTEC3,
                      context,
                      controller.onChangedVerifyKey,
                      obscureText: true,
                    ),
                    genericInputValue(
                      4,
                      controller.keyCodeError,
                      controller.verifyKeyTEC4,
                      context,
                      controller.onChangedVerifyKey,
                      obscureText: true,
                    ),
                    genericInputValue(
                      5,
                      controller.keyCodeError,
                      controller.verifyKeyTEC5,
                      context,
                      controller.onChangedVerifyKey,
                      obscureText: true,
                    ),
                    genericInputValue(
                      6,
                      controller.keyCodeError,
                      controller.verifyKeyTEC6,
                      context,
                      controller.onChangedVerifyKey,
                      obscureText: true,
                    ),
                  ],
                ),
                if (controller.keyCodeError) ...[
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Error. Las contraseñas no coinciden. intenta de nuevo.',
                      style: AppTextStyles.error,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  },
);
