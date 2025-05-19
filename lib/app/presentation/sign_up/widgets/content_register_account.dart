import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vurelo/app/app_text_styles.dart';
import 'package:vurelo/app/presentation/sign_up/sign_up_controller.dart';
import 'package:vurelo/app/presentation/sign_up/widgets/footer_sign_up.dart';
import 'package:vurelo/app/presentation/widgets/gap.dart';
import 'package:vurelo/app/presentation/widgets/generic_button.dart';
import 'package:vurelo/app/presentation/widgets/generic_circular_button.dart';
import 'package:vurelo/app/presentation/widgets/generic_horizontal_divider.dart';
import 'package:vurelo/app/presentation/widgets/generic_input_file.dart';

Widget contentRegisterAccount(
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
                  controller.inputType == SignUpInput.email
                      ? 'Bienvenido a tu nueva forma de manejar tu dinero digital'
                      : 'Esto apenas comienza... y tu cuenta también',
                  style: AppTextStyles.bodyLargeBold,
                ),
                gap(height: 16.0),
                if (controller.inputType == SignUpInput.email) ...[
                  Text(
                    'Ingresa tu correo',
                    style: AppTextStyles.titleSmallBold,
                  ),
                ],
                gap(height: 8.0),

                genericInputField(
                  controller.inputType == SignUpInput.email
                      ? 'correo@gmail.com'
                      : controller.currentPhoneNumber,
                  controller.inputType == SignUpInput.email
                      ? TextInputType.emailAddress
                      : TextInputType.number,
                  controller.onChangeInputContent,
                  context,
                  onSelect: controller.onSelect,
                  currentCountryFlag: controller.currentCountryFlag,
                  currentCountryPhoneCode: controller.currentCountryCode,
                ),
                gap(height: 24.0),
                controller.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : genericButton(
                      'Continuar',
                      controller.currentInputContent == null
                          ? null
                          : controller.registerAccount,
                      context,
                    ),
                gap(height: 16.0),
                genericHorizontalDivider('o continuar con'),
                gap(height: 16.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    if (controller.inputType == SignUpInput.phoneNumber) ...[
                      genericCircularButton(
                        Icon(Icons.email_outlined),
                        () => controller.onChangeInputType(SignUpInput.email),
                      ),
                    ] else ...[
                      genericCircularButton(
                        Icon(Icons.smartphone),
                        () => controller.onChangeInputType(
                          SignUpInput.phoneNumber,
                        ),
                      ),
                    ],
                    genericCircularButton(
                      SvgPicture.asset("assets/google_logo.svg"),
                      () {},
                    ),
                    genericCircularButton(
                      SvgPicture.asset("assets/apple_logo.svg"),
                      () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          footerSignUp(),
        ],
      ),
    );
  },
);
