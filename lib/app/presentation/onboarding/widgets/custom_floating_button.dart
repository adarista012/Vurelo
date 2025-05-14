import 'package:flutter/material.dart';
import 'package:vurelo/app/app_colors.dart';

Widget customFloatingButton(void Function() onPressed) => FloatingActionButton(
  onPressed: onPressed,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
  backgroundColor: AppColors.primary,
  child: Icon(Icons.arrow_forward_ios, color: AppColors.white),
);
