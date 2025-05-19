import 'package:get/get.dart';
import 'package:vurelo/app/domain/use_cases/get_email_address_use_case.dart';
import 'package:vurelo/app/domain/use_cases/get_key_account_use_case.dart';
import 'package:vurelo/app/domain/use_cases/get_name_use_case.dart';
import 'package:vurelo/app/domain/use_cases/get_phone_number_use_case.dart';
import 'package:vurelo/app/presentation/home/home_controller.dart';

class HomeBinding extends Bindings {
  final GetNameUseCase _getNameUseCase;
  final GetEmailAddressUseCase _getEmailAddressUseCase;
  final GetPhoneNumberUseCase _getPhoneNumberUseCase;
  final GetKeyAccountUseCase _getKeyAccountUseCase;

  HomeBinding({
    required GetNameUseCase getNameUseCase,
    required GetEmailAddressUseCase getEmailAddressUseCase,
    required GetPhoneNumberUseCase getPhoneNumberUseCase,
    required GetKeyAccountUseCase getKeyAccountUseCase,
  }) : _getNameUseCase = getNameUseCase,
       _getEmailAddressUseCase = getEmailAddressUseCase,
       _getPhoneNumberUseCase = getPhoneNumberUseCase,
       _getKeyAccountUseCase = getKeyAccountUseCase;

  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        getNameUseCase: _getNameUseCase,
        getEmailAddressUseCase: _getEmailAddressUseCase,
        getPhoneNumberUseCase: _getPhoneNumberUseCase,
        getKeyAccountUseCase: _getKeyAccountUseCase,
      ),
    );
  }
}
