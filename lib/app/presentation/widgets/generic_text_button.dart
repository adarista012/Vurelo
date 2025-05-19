import 'package:flutter/material.dart';
import 'package:vurelo/app/app_text_styles.dart';

Widget genericTextButton(
  String label,
  void Function() onPressed, {
  bool isUnderline = false,
}) => MaterialButton(
  padding: EdgeInsets.zero,
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  onPressed: onPressed,
  child: Text(
    label,
    style:
        isUnderline
            ? AppTextStyles.textButtonUnderLine
            : AppTextStyles.textButton,
  ),
);
