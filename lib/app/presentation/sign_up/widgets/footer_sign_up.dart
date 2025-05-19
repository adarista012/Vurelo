import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vurelo/app/app_navigation.dart';
import 'package:vurelo/app/presentation/widgets/generic_text_button.dart';

Widget footerSignUp() => Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text('Ya tienes una cuenta? '),
    genericTextButton('Iniciar sesión', () => Get.offNamed(Routes.SIGN_IN)),
  ],
);
