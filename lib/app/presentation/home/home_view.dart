import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:vurelo/app/app_colors.dart';
import 'package:vurelo/app/app_text_styles.dart';
import 'package:vurelo/app/presentation/home/home_controller.dart';
import 'package:vurelo/app/presentation/widgets/gap.dart';
import 'package:vurelo/app/presentation/widgets/generic_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.grayLight,
            leading: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('assets/nebula.png')),
              ),
              child: Text(
                controller.name.split('')[0].toUpperCase(),
                style: AppTextStyles.bodyLargeBold.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
            leadingWidth: 100,
            actions: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset('assets/app_bar_icon.svg'),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: [
                  Text(controller.name),
                  Text(controller.keyCode),
                  Text(controller.phoneNumber),
                  Text(controller.emailAddress),
                  Spacer(),

                  controller.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : genericButton(
                        'Cerrar sesión',
                        controller.signOut,
                        context,
                        isPrimary: false,
                      ),
                  gap(height: 24.0),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
