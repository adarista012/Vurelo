import 'package:flutter/material.dart';
import 'package:vurelo/app/app_colors.dart';

Widget genericCurrentStepIndicator(
  int index,
  int steps, {
  bool bordered = true,
}) => Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: List.generate(
    steps,
    (int i) => AnimatedContainer(
      duration: Duration(milliseconds: 124),
      height: 16,
      width: index == i ? 41 : 16,
      margin: EdgeInsets.all(1.6),
      decoration: BoxDecoration(
        color:
            index == i
                ? AppColors.primary
                : bordered
                ? AppColors.transparent
                : AppColors.primary.withAlpha(100),
        border:
            bordered ? Border.all(color: AppColors.primary, width: 1.6) : null,
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  ),
);
