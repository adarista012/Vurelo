import 'package:flutter/material.dart';
import 'package:vurelo/app/app_colors.dart';

Widget genericCircularButton(Widget child, void Function()? onPressed) =>
    IconButton(
      onPressed: onPressed,
      icon: child,
      style: ButtonStyle(
        shape: WidgetStateProperty.all<CircleBorder>(
          CircleBorder(
            side: BorderSide(color: AppColors.grayDark, width: 0.16),
          ),
        ),
      ),
    );
