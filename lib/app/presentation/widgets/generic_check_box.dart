import 'package:flutter/cupertino.dart';
import 'package:vurelo/app/app_colors.dart';

Widget genericCheckBox(bool value, void Function(bool?) onChanged) =>
    CupertinoCheckbox(
      value: value,
      onChanged: onChanged,
      activeColor: AppColors.primary,
    );
