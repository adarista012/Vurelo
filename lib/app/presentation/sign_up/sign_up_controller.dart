import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vurelo/app/app_colors.dart';
import 'package:vurelo/app/app_navigation.dart';
import 'package:vurelo/app/domain/use_cases/set_email_address_use_case.dart';
import 'package:vurelo/app/domain/use_cases/set_key_account_use_case.dart';
import 'package:vurelo/app/domain/use_cases/set_name_use_case.dart';
import 'package:vurelo/app/domain/use_cases/set_phone_number_use_case.dart';
import 'package:vurelo/app/presentation/sign_up/widgets/biometric_bottom_sheet.dart';
import 'package:vurelo/app/presentation/sign_up/widgets/sign_up_bottom_sheet.dart';

import 'package:local_auth/local_auth.dart';

enum SignUpInput { email, phoneNumber }

enum SignUpStep {
  registerAccount,
  verifyAccount,
  setName,
  setKeyAccount,
  verifyKeyAccount,
}

class SignUpController extends GetxController {
  final SetEmailAddressUseCase _setEmailAddressUseCase;
  final SetKeyAccountUseCase _setKeyAccountUseCase;
  final SetNameUseCase _setNameUseCase;
  final SetPhoneNumberUseCase _setPhoneNumberUseCase;

  SignUpInput _inputType = SignUpInput.phoneNumber;
  SignUpInput get inputType => _inputType;

  SignUpStep _currentStep = SignUpStep.registerAccount;
  SignUpStep get currentStep => _currentStep;

  String? _name;
  String? get name => _name;

  String _currentContryCode = '57';
  String get currentCountryCode => _currentContryCode;

  String _currentContryFlag = '🇨🇴';
  String get currentCountryFlag => _currentContryFlag;

  String _currentPhoneNumber = '3211234567';
  String get currentPhoneNumber => _currentPhoneNumber;

  String _currentEmailAddress = 'correo@gmail.com';
  String get currentEmailAddress => _currentEmailAddress;

  String? _currentInputContent;
  String? get currentInputContent => _currentInputContent;

  bool _termsConditionsCheckBox = false;
  bool get termsConditionsCheckBox => _termsConditionsCheckBox;

  bool _privacyPolicyCheckBox = false;
  bool get privacyPolicyCheckBox => _privacyPolicyCheckBox;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final TextEditingController verifyCodeTEC1 = TextEditingController();
  final TextEditingController verifyCodeTEC2 = TextEditingController();
  final TextEditingController verifyCodeTEC3 = TextEditingController();
  final TextEditingController verifyCodeTEC4 = TextEditingController();
  final TextEditingController verifyCodeTEC5 = TextEditingController();

  final TextEditingController setKeyTEC1 = TextEditingController();
  final TextEditingController setKeyTEC2 = TextEditingController();
  final TextEditingController setKeyTEC3 = TextEditingController();
  final TextEditingController setKeyTEC4 = TextEditingController();
  final TextEditingController setKeyTEC5 = TextEditingController();
  final TextEditingController setKeyTEC6 = TextEditingController();

  final TextEditingController verifyKeyTEC1 = TextEditingController();
  final TextEditingController verifyKeyTEC2 = TextEditingController();
  final TextEditingController verifyKeyTEC3 = TextEditingController();
  final TextEditingController verifyKeyTEC4 = TextEditingController();
  final TextEditingController verifyKeyTEC5 = TextEditingController();
  final TextEditingController verifyKeyTEC6 = TextEditingController();

  bool verifyCodeError = false;
  bool keyCodeError = false;

  String? _currentKeyCode;

  SignUpController({
    required SetEmailAddressUseCase setEmailAddressUseCase,
    required SetKeyAccountUseCase setKeyAccountUseCase,
    required SetNameUseCase setNameUseCase,
    required SetPhoneNumberUseCase setPhoneNumberUseCase,
  }) : _setEmailAddressUseCase = setEmailAddressUseCase,
       _setKeyAccountUseCase = setKeyAccountUseCase,
       _setNameUseCase = setNameUseCase,
       _setPhoneNumberUseCase = setPhoneNumberUseCase;

  void onSelect(Country country) {
    _currentContryCode = country.phoneCode;
    _currentContryFlag = country.flagEmoji;
    _currentPhoneNumber = country.example;
    update();
  }

  void onChangeInputType(SignUpInput newInput) {
    _inputType = newInput;

    update();
  }

  void onChangeInputContent(String newInputContent) {
    _currentInputContent = newInputContent.isEmpty ? null : newInputContent;

    update();
  }

  void registerAccount() async {
    onChangeIsLoading(true);
    await Future.delayed(Duration(seconds: 2));

    onChangeIsLoading(false);

    final responseBottomSheet = await signUpBottomSheet();
    FocusScope.of(Get.context!).unfocus();

    _termsConditionsCheckBox = false;
    _privacyPolicyCheckBox = false;

    if (responseBottomSheet == true) {
      onChangeCurrentStep(SignUpStep.verifyAccount);
      setUserData();
      await Future.delayed(Duration(seconds: 1));
      Get.snackbar(
        'Código de verificación',
        'Tú código de verificación es: 00000',
        backgroundColor: AppColors.primary.withAlpha(100),
      );
    }
  }

  void setUserData() {
    if (inputType == SignUpInput.email &&
        _currentInputContent != null &&
        _currentInputContent!.isNotEmpty) {
      _currentEmailAddress = _currentInputContent!;
    }

    if (inputType == SignUpInput.phoneNumber &&
        _currentInputContent != null &&
        _currentInputContent!.isNotEmpty) {
      _currentPhoneNumber = _currentContryCode + _currentInputContent!;
    }
  }

  void onChangeCurrentStep(SignUpStep nextStep) {
    _currentStep = nextStep;
    update();
  }

  void onChangedTermsConditionsCheckBox(bool? newValue) {
    _termsConditionsCheckBox = newValue ?? false;
    update();
  }

  void onChangedPrivacyPolicyCheckBox(bool? newValue) {
    _privacyPolicyCheckBox = newValue ?? false;
    update();
  }

  void onChangeName(String? newValue) {
    _name = newValue;
    update();
  }

  void onChangedVerifyCode(
    String? value,
    int position,
    TextEditingController controller,
  ) {
    if (value != null) {
      controller.text = value;
    }

    if (verifyCodeTEC1.value.text.isNotEmpty &&
        verifyCodeTEC2.value.text.isNotEmpty &&
        verifyCodeTEC3.value.text.isNotEmpty &&
        verifyCodeTEC4.value.text.isNotEmpty &&
        verifyCodeTEC5.value.text.isNotEmpty &&
        position == 5) {
      checkCode();
    }
  }

  void checkCode() {
    final String code =
        verifyCodeTEC1.value.text +
        verifyCodeTEC2.value.text +
        verifyCodeTEC3.value.text +
        verifyCodeTEC4.value.text +
        verifyCodeTEC5.value.text;
    if (code == '00000') {
      verifyCodeError = false;
      onChangeCurrentStep(SignUpStep.setName);
    } else {
      verifyCodeError = true;
    }
    update();
  }

  void onChangedSetKey(
    String? value,
    int position,
    TextEditingController controller,
  ) {
    if (value != null) {
      controller.text = value;
    }

    if (setKeyTEC1.value.text.isNotEmpty &&
        setKeyTEC2.value.text.isNotEmpty &&
        setKeyTEC3.value.text.isNotEmpty &&
        setKeyTEC4.value.text.isNotEmpty &&
        setKeyTEC5.value.text.isNotEmpty &&
        setKeyTEC6.value.text.isNotEmpty &&
        position == 6) {
      _currentKeyCode =
          setKeyTEC1.value.text +
          setKeyTEC2.value.text +
          setKeyTEC3.value.text +
          setKeyTEC4.value.text +
          setKeyTEC5.value.text +
          setKeyTEC6.value.text;
      onChangeCurrentStep(SignUpStep.verifyKeyAccount);
    }
  }

  void onChangedVerifyKey(
    String? value,
    int position,
    TextEditingController controller,
  ) {
    if (value != null) {
      controller.text = value;
    }

    if (verifyKeyTEC1.value.text.isNotEmpty &&
        verifyKeyTEC2.value.text.isNotEmpty &&
        verifyKeyTEC3.value.text.isNotEmpty &&
        verifyKeyTEC4.value.text.isNotEmpty &&
        verifyKeyTEC5.value.text.isNotEmpty &&
        verifyKeyTEC6.value.text.isNotEmpty &&
        position == 6) {
      final String verifyKeyCode =
          verifyKeyTEC1.value.text +
          verifyKeyTEC2.value.text +
          verifyKeyTEC3.value.text +
          verifyKeyTEC4.value.text +
          verifyKeyTEC5.value.text +
          verifyKeyTEC6.value.text;

      if (verifyKeyCode == _currentKeyCode) {
        keyCodeError = false;
        verifyKeyTEC1.clear();
        verifyKeyTEC2.clear();
        verifyKeyTEC3.clear();
        verifyKeyTEC4.clear();
        verifyKeyTEC5.clear();
        verifyKeyTEC6.clear();
        setBiometric();
      } else {
        keyCodeError = true;
      }
      update();
    }
  }

  void setBiometric() async {
    final response = await biometricBottomSheet();
    if (response != null) {
      if (response == true) {
        final LocalAuthentication auth = LocalAuthentication();
        try {
          await auth
              .authenticate(
                localizedReason: 'Scan your face to authenticate',
                options: const AuthenticationOptions(
                  stickyAuth: true,
                  biometricOnly: true,
                ),
              )
              .catchError((_) async {
                await auth.stopAuthentication();
                return false;
              });
        } on PlatformException catch (e) {}
      }
      saveUserData();
    }
  }

  void saveUserData() async {
    await _setKeyAccountUseCase.call(params: _currentKeyCode);
    await _setNameUseCase.call(params: _name);
    if (_inputType == SignUpInput.phoneNumber) {
      await _setPhoneNumberUseCase.call(
        params: _currentContryCode + _currentPhoneNumber,
      );
    }
    if (_inputType == SignUpInput.email) {
      await _setEmailAddressUseCase.call(params: _currentEmailAddress);
    }

    Get.offAllNamed(Routes.HOME);
  }

  void saveName() async {
    onChangeIsLoading(true);
    await Future.delayed(Duration(seconds: 2));

    onChangeIsLoading(false);

    onChangeCurrentStep(SignUpStep.setKeyAccount);
  }

  void onChangeIsLoading(bool newValue) {
    _isLoading = newValue;

    update();
  }
}
