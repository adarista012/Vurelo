import 'package:flutter/material.dart';
import 'package:vurelo/app/presentation/sign_in/widgets/footer_sign_in.dart';
import 'package:vurelo/app/presentation/widgets/gap.dart';
import 'package:vurelo/app/presentation/widgets/generic_back_button.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            gap(height: 48),
            genericBackButton(context),
            footerSignIn(),
          ],
        ),
      ),
    );
  }
}
