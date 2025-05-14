import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vurelo/app/app_colors.dart';
import 'splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayDark,
      body: Center(
        child: GetBuilder<SplashController>(
          builder: (controller) {
            return controller.path != null
                ? SvgPicture.asset(controller.path!)
                : Text('VURELO');
          },
        ),
      ),
    );
  }
}
