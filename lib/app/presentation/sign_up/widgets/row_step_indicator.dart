import 'package:flutter/material.dart';
import 'package:vurelo/app/presentation/sign_up/sign_up_controller.dart';
import 'package:vurelo/app/presentation/widgets/generic_current_step_indicator.dart';

Widget rowStepIndicator(SignUpStep currentStep, int length) {
  final int currentStepIndex =
      currentStep == SignUpStep.registerAccount
          ? 0
          : currentStep == SignUpStep.verifyAccount
          ? 1
          : currentStep == SignUpStep.setName
          ? 2
          : currentStep == SignUpStep.setKeyAccount
          ? 3
          : currentStep == SignUpStep.verifyKeyAccount
          ? 4
          : 0;

  return Row(
    children: [
      genericCurrentStepIndicator(currentStepIndex, length, bordered: false),
    ],
  );
}
