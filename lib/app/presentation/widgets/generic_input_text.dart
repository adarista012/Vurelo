import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:vurelo/app/app_colors.dart';

Widget genericInputText(
  String label,
  TextInputType keyboardType,
  void Function(String)? onChanged,
) => Container(
  decoration: BoxDecoration(
    border: Border.all(width: 0.16),
    borderRadius: BorderRadius.circular(40),
    color: AppColors.primary.withAlpha(16),
  ),
  child: CupertinoTextField(
    placeholder: label,
    padding: EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      border: Border.all(width: 0.16),
      borderRadius: BorderRadius.circular(40),
    ),
    keyboardType: keyboardType,
    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))],
    onChanged: onChanged,
    autocorrect: false,
  ),
);
