import 'package:flutter/material.dart';
import 'package:vurelo/app/app_colors.dart';

Widget onboardingViewIndicator(int index) => Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: List.generate(
    3,
    (int i) => AnimatedContainer(
      duration: Duration(milliseconds: 124),
      height: 16,
      width: index == i ? 41 : 16,
      margin: EdgeInsets.all(1.6),
      decoration: BoxDecoration(
        color: index == i ? AppColors.primary : AppColors.transparent,
        border: Border.all(color: AppColors.primary, width: 1.6),
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  ),
);
