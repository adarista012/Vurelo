import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vurelo/app/app_colors.dart';
import 'package:vurelo/app/app_text_styles.dart';
import 'package:vurelo/app/presentation/sign_up/sign_up_controller.dart';
import 'package:vurelo/app/presentation/widgets/gap.dart';
import 'package:vurelo/app/presentation/widgets/generic_button.dart';
import 'package:vurelo/app/presentation/widgets/generic_input_text.dart';

Widget contentSetName(BuildContext context) => GetBuilder<SignUpController>(
  builder: (controller) {
    return Expanded(
      child: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Queremos saber cómo te dicen',
                  style: AppTextStyles.bodyLargeBold,
                ),
                gap(height: 16.0),
                Text('Cuéntanos tu nombre o apodo, así te conocemos mejor.'),
                gap(height: 40.0),

                genericInputText(
                  'Tu nombre',
                  TextInputType.text,
                  controller.onChangeName,
                ),
                gap(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Procura no usar ñ, tildes ni símbolos raros.',
                      style: AppTextStyles.bodyBold.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                gap(height: 60.0),
                controller.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : genericButton(
                      'Continuar',
                      controller.name == null || controller.name!.isEmpty
                          ? null
                          : controller.saveName,
                      // null,
                      context,
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  },
);
