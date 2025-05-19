import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vurelo/app/app_navigation.dart';
import 'package:vurelo/app/presentation/widgets/generic_text_button.dart';

Widget footerSignIn() => Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text('Nos conocemos de antes? '),
    genericTextButton('Entra por aquí', () => Get.offNamed(Routes.SIGN_UP)),
  ],
);
