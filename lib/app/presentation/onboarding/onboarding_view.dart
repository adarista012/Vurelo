import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vurelo/app/app_navigation.dart';
import 'package:vurelo/app/presentation/onboarding/onboarding_controller.dart';
import 'package:vurelo/app/presentation/onboarding/widgets/custom_floating_button.dart';
import 'package:vurelo/app/presentation/onboarding/widgets/onboarding_first_view.dart';
import 'package:vurelo/app/presentation/onboarding/widgets/onboarding_second_view.dart';
import 'package:vurelo/app/presentation/onboarding/widgets/onboarding_third_view.dart';
import 'package:vurelo/app/presentation/widgets/generic_current_step_indicator.dart';
import 'package:vurelo/app/presentation/widgets/gap.dart';
import 'package:vurelo/app/presentation/widgets/generic_button.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: OnboardingController(),
      builder: (controller) {
        return Scaffold(
          body: SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  gap(height: 48),
                  SvgPicture.asset("assets/name_header.svg"),
                  Expanded(
                    child: TabBarView(
                      controller: controller.tabController,
                      children: [
                        onboardingFirstView(),
                        onboardingSecondView(),
                        onboardingThirdView(),
                      ],
                    ),
                  ),
                  genericCurrentStepIndicator(
                    controller.tabController.index,
                    controller.tabController.length,
                  ),

                  if (controller.tabController.index == 2) ...[
                    gap(height: 16.0),
                    genericButton(
                      'Quiero unirme a Vurelo',
                      () => Get.toNamed(Routes.SIGN_UP),
                      context,
                    ),
                    gap(height: 8.0),
                    genericButton(
                      'Ya soy usuario',
                      () => Get.toNamed(Routes.SIGN_IN),
                      context,
                      isPrimary: false,
                    ),
                    gap(height: 16.0),
                  ] else ...[
                    gap(height: 48.0),
                  ],
                ],
              ),
            ),
          ),
          floatingActionButton:
              controller.tabController.index == 2
                  ? null
                  : customFloatingButton(controller.changeTab),
        );
      },

      //
    );
  }
}
