import 'package:get/get.dart';
import 'package:vurelo/app/domain/use_cases/set_email_address_use_case.dart';
import 'package:vurelo/app/domain/use_cases/set_key_account_use_case.dart';
import 'package:vurelo/app/domain/use_cases/set_name_use_case.dart';
import 'package:vurelo/app/domain/use_cases/set_phone_number_use_case.dart';
import 'package:vurelo/app/presentation/sign_up/sign_up_controller.dart';

class SignUpBinding extends Bindings {
  final SetEmailAddressUseCase _setEmailAddressUseCase;
  final SetKeyAccountUseCase _setKeyAccountUseCase;
  final SetNameUseCase _setNameUseCase;
  final SetPhoneNumberUseCase _setPhoneNumberUseCase;

  SignUpBinding({
    required SetEmailAddressUseCase setEmailAddressUseCase,
    required SetKeyAccountUseCase setKeyAccountUseCase,
    required SetNameUseCase setNameUseCase,
    required SetPhoneNumberUseCase setPhoneNumberUseCase,
  }) : _setEmailAddressUseCase = setEmailAddressUseCase,
       _setKeyAccountUseCase = setKeyAccountUseCase,
       _setNameUseCase = setNameUseCase,
       _setPhoneNumberUseCase = setPhoneNumberUseCase;

  @override
  void dependencies() {
    Get.lazyPut(
      () => SignUpController(
        setEmailAddressUseCase: _setEmailAddressUseCase,
        setKeyAccountUseCase: _setKeyAccountUseCase,
        setNameUseCase: _setNameUseCase,
        setPhoneNumberUseCase: _setPhoneNumberUseCase,
      ),
    );
  }
}
