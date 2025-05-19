import 'package:flutter/material.dart';
import 'package:vurelo/app/app_colors.dart';

Widget genericButton(
  String label,
  void Function()? onPressed,
  BuildContext context, {
  bool isPrimary = true,
  Icon? icon,
}) => MaterialButton(
  onPressed: onPressed,
  color: isPrimary ? AppColors.primary : AppColors.transparent,
  disabledColor: AppColors.primary.withAlpha(100),
  padding: EdgeInsets.zero,
  elevation: 0.0,
  shape: StadiumBorder(
    side: BorderSide(
      color: onPressed == null ? AppColors.transparent : AppColors.primary,
    ),
  ),
  minWidth: MediaQuery.sizeOf(context).width,
  height: 50,
  child:
      icon == null
          ? Text(
            label,
            style: TextStyle(
              color: isPrimary ? AppColors.white : AppColors.primary,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          )
          : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: isPrimary ? AppColors.white : AppColors.primary,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              icon,
            ],
          ),
);
