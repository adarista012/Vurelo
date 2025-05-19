import 'package:flutter/material.dart';
import 'package:vurelo/app/app_colors.dart';

Widget genericBackButton(BuildContext context, {void Function()? onPressed}) =>
    IconButton(
      onPressed: onPressed ?? () => Navigator.of(context).pop(),
      icon: Icon(Icons.arrow_back, color: AppColors.primary),
    );
