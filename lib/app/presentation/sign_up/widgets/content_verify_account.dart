import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vurelo/app/app_text_styles.dart';
import 'package:vurelo/app/presentation/sign_up/sign_up_controller.dart';
import 'package:vurelo/app/presentation/widgets/gap.dart';
import 'package:vurelo/app/presentation/widgets/generic_input_value.dart';
import 'package:vurelo/app/presentation/widgets/generic_text_button.dart';

Widget contentVerifyAccount(
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
                  'Eres tú? Vamos a comprobarlo.',
                  style: AppTextStyles.bodyLargeBold,
                ),
                gap(height: 16.0),
                Text(
                  'Enviamos un código a tu ${controller.inputType == SignUpInput.email ? 'correo' : 'teléfono'}',
                ),

                Text(
                  controller.inputType == SignUpInput.email
                      ? controller.currentEmailAddress
                      : '+ ${controller.currentPhoneNumber}',
                  style: AppTextStyles.bodyBold,
                ),

                gap(height: 8.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  spacing: 8,
                  children: [
                    genericInputValue(
                      1,
                      controller.verifyCodeError,
                      controller.verifyCodeTEC1,
                      context,
                      controller.onChangedVerifyCode,
                    ),
                    genericInputValue(
                      2,
                      controller.verifyCodeError,
                      controller.verifyCodeTEC2,
                      context,
                      controller.onChangedVerifyCode,
                    ),
                    genericInputValue(
                      3,
                      controller.verifyCodeError,
                      controller.verifyCodeTEC3,
                      context,
                      controller.onChangedVerifyCode,
                    ),
                    genericInputValue(
                      4,
                      controller.verifyCodeError,
                      controller.verifyCodeTEC4,
                      context,
                      controller.onChangedVerifyCode,
                    ),
                    genericInputValue(
                      5,
                      controller.verifyCodeError,
                      controller.verifyCodeTEC5,
                      context,
                      controller.onChangedVerifyCode,
                    ),
                  ],
                ),
                if (controller.verifyCodeError) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Uy no, ese no es. Intenta otra vez.',
                          style: AppTextStyles.error,
                        ),
                      ),
                    ],
                  ),
                ],
                gap(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    genericTextButton(
                      'Reenviar código',
                      () {},
                      isUnderline: true,
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
