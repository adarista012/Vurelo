import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:vurelo/app/app_colors.dart';
import 'package:vurelo/app/app_text_styles.dart';

Widget genericInputValue(
  int position,
  bool error,
  TextEditingController controller,
  BuildContext context,
  void Function(String?, int, TextEditingController) onChanged, {
  bool obscureText = false,
}) => Expanded(
  child: CupertinoTextField(
    padding: EdgeInsets.all(16),
    controller: controller,
    decoration: BoxDecoration(
      color:
          error
              ? AppColors.error.withAlpha(10)
              : AppColors.primary.withAlpha(10),
      border: Border.all(
        color:
            error
                ? AppColors.error.withAlpha(50)
                : AppColors.primary.withAlpha(50),
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    inputFormatters: [
      FilteringTextInputFormatter.digitsOnly,
      LengthLimitingTextInputFormatter(1),
    ],
    keyboardType: TextInputType.number,
    maxLength: 1,
    textAlign: TextAlign.center,
    textAlignVertical: TextAlignVertical.center,
    style:
        error
            ? AppTextStyles.bodyLargeBold.copyWith(color: AppColors.error)
            : AppTextStyles.bodyLargeBold,
    onChanged: (value) {
      if (value.isNotEmpty) {
        FocusScope.of(context).nextFocus();
        onChanged(value, position, controller);
      }
      if (value.isEmpty) {
        FocusScope.of(context).previousFocus();
        onChanged(null, position, controller);
      }
    },
    obscureText: obscureText,
  ),
);
