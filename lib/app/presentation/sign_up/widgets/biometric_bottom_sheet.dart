import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vurelo/app/app_colors.dart';
import 'package:vurelo/app/app_text_styles.dart';
import 'package:vurelo/app/presentation/sign_up/sign_up_controller.dart';
import 'package:vurelo/app/presentation/widgets/gap.dart';
import 'package:vurelo/app/presentation/widgets/generic_button.dart';

Future<bool?> biometricBottomSheet() => Get.bottomSheet<bool>(
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
            if (Platform.isIOS) ...[
              SvgPicture.asset('assets/face_id.svg'),
              gap(height: 8),
              Text('Accede con tu Face ID', style: AppTextStyles.bodyLargeBold),
              gap(height: 8),
              Text(
                'Activa Face ID y entra a tu cuenta en segundos. Más cómodo y con la misma seguridad bancaria.',
              ),
            ],
            if (Platform.isAndroid) ...[
              SvgPicture.asset('assets/finger_id.svg'),

              gap(height: 8),
              Text('Accede con tu huella', style: AppTextStyles.bodyLargeBold),
              gap(height: 8),
              Text(
                'Activa tu huella y entra a tu cuenta en segundos. Más cómodo y con la misma seguridad bancaria.',
              ),
            ],

            gap(height: 24),
            genericButton(
              'Activar',
              () => Get.back(result: true),
              Get.context!,
            ),
            gap(height: 8),
            genericButton(
              'Omitir por ahora',
              () => Get.back(result: false),
              Get.context!,
              isPrimary: false,
            ),
          ],
        ),
      );
    },
  ),
);
