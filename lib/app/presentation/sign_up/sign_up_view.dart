import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vurelo/app/app_text_styles.dart';
import 'package:vurelo/app/presentation/sign_up/sign_up_controller.dart';
import 'package:vurelo/app/presentation/sign_up/widgets/content_set_key_account.dart';
import 'package:vurelo/app/presentation/sign_up/widgets/content_set_name.dart';
import 'package:vurelo/app/presentation/sign_up/widgets/content_verify_account.dart';
import 'package:vurelo/app/presentation/sign_up/widgets/content_register_account.dart';
import 'package:vurelo/app/presentation/sign_up/widgets/content_verify_key_account.dart';
import 'package:vurelo/app/presentation/sign_up/widgets/row_step_indicator.dart';
import 'package:vurelo/app/presentation/widgets/gap.dart';
import 'package:vurelo/app/presentation/widgets/generic_back_button.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<SignUpController>(
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  gap(height: 48),
                  genericBackButton(context),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          rowStepIndicator(
                            controller.currentStep,
                            SignUpStep.values.length,
                          ),
                          gap(height: 8.0),
                          Text(
                            'Crear cuenta',
                            style: AppTextStyles.titleSmallBold,
                          ),
                          gap(height: 8.0),
                          switch (controller.currentStep) {
                            SignUpStep.registerAccount =>
                              contentRegisterAccount(context),
                            SignUpStep.verifyAccount => contentVerifyAccount(
                              context,
                            ),
                            SignUpStep.setName => contentSetName(context),
                            SignUpStep.setKeyAccount => contentSetKeyAccount(
                              context,
                            ),
                            SignUpStep.verifyKeyAccount =>
                              contentVerifyKeyAccount(context),
                          },
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),

        // ),
      ),
    );
  }
}
