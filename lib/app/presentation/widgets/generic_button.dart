import 'package:flutter/material.dart';
import 'package:vurelo/app/app_colors.dart';

Widget genericButton(
  String label,
  BuildContext context, {
  bool isPrimary = true,
}) => MaterialButton(
  onPressed: () {},
  color: isPrimary ? AppColors.primary : AppColors.transparent,
  padding: EdgeInsets.zero,
  elevation: 0.0,
  shape: StadiumBorder(side: BorderSide(color: AppColors.primary)),
  minWidth: MediaQuery.sizeOf(context).width,
  height: 50,
  child: Text(
    label,
    style: TextStyle(
      color: isPrimary ? AppColors.white : AppColors.primary,
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
    ),
  ),
);
