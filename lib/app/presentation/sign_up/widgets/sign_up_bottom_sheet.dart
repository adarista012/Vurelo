import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vurelo/app/app_colors.dart';
import 'package:vurelo/app/app_text_styles.dart';
import 'package:vurelo/app/presentation/sign_up/sign_up_controller.dart';
import 'package:vurelo/app/presentation/widgets/gap.dart';
import 'package:vurelo/app/presentation/widgets/generic_button.dart';
import 'package:vurelo/app/presentation/widgets/generic_check_box.dart';
import 'package:vurelo/app/presentation/widgets/generic_text_button.dart';

Future<bool?> signUpBottomSheet() => Get.bottomSheet<bool>(
  barrierColor: Color(0xff2b39ae).withAlpha(180),
  GetBuilder<SignUpController>(
    builder: (controller) {
      return Container(
        height: 400,
        width: double.infinity,
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Column(
          children: [
            gap(height: 24),
            Text(
              'Revisa y acepta para continuar',
              style: AppTextStyles.bodyLargeBold,
            ),
            gap(height: 8),
            Text(
              'Queremos que tengas el control total de tu información. Léelo con calma: es corto y sin letra pequeña escondida.',
            ),
            gap(height: 8),
            Row(
              children: [
                genericCheckBox(
                  controller.termsConditionsCheckBox,
                  controller.onChangedTermsConditionsCheckBox,
                ),
                Text('Acepto los '),
                genericTextButton('Términos y Condiciones', () {}),
              ],
            ),
            Row(
              children: [
                genericCheckBox(
                  controller.privacyPolicyCheckBox,
                  controller.onChangedPrivacyPolicyCheckBox,
                ),
                Text('Acepto la '),
                genericTextButton('Política de Privacidad', () {}),
              ],
            ),
            gap(height: 16),
            genericButton(
              'Continuar ',
              controller.privacyPolicyCheckBox &&
                      controller.termsConditionsCheckBox
                  ? () => Get.back(result: true)
                  : null,
              Get.context!,
              icon: Icon(Icons.arrow_forward, color: AppColors.white),
            ),
          ],
        ),
      );
    },
  ),
);
