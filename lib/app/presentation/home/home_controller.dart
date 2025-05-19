import 'package:get/get.dart';
import 'package:vurelo/app/app_navigation.dart';
import 'package:vurelo/app/domain/repositories/local_storage_repository.dart';
import 'package:vurelo/app/domain/use_cases/get_email_address_use_case.dart';
import 'package:vurelo/app/domain/use_cases/get_key_account_use_case.dart';
import 'package:vurelo/app/domain/use_cases/get_name_use_case.dart';
import 'package:vurelo/app/domain/use_cases/get_phone_number_use_case.dart';

class HomeController extends GetxController {
  final GetNameUseCase _getNameUseCase;
  final GetEmailAddressUseCase _getEmailAddressUseCase;
  final GetPhoneNumberUseCase _getPhoneNumberUseCase;
  final GetKeyAccountUseCase _getKeyAccountUseCase;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _name = 'empty';
  String get name => _name;

  String _emailAddress = 'empty';
  String get emailAddress => _emailAddress;

  String _phoneNumber = 'empty';
  String get phoneNumber => _phoneNumber;

  String _keyCode = 'empty';
  String get keyCode => _keyCode;

  HomeController({
    required GetNameUseCase getNameUseCase,
    required GetEmailAddressUseCase getEmailAddressUseCase,
    required GetPhoneNumberUseCase getPhoneNumberUseCase,
    required GetKeyAccountUseCase getKeyAccountUseCase,
  }) : _getNameUseCase = getNameUseCase,
       _getEmailAddressUseCase = getEmailAddressUseCase,
       _getPhoneNumberUseCase = getPhoneNumberUseCase,
       _getKeyAccountUseCase = getKeyAccountUseCase {
    _init();
  }

  void _init() {
    _name = _getNameUseCase.call() ?? '';
    _emailAddress = _getEmailAddressUseCase.call() ?? '';
    _phoneNumber = _getPhoneNumberUseCase.call() ?? '';
    _keyCode = _getKeyAccountUseCase.call() ?? '';

    update();
  }

  void signOut() async {
    onChangeIsLoading(true);

    final LocalStorageRepository localStorageRepository = Get.find();

    await localStorageRepository.deleteUserData();

    await Get.toNamed(Routes.LOGIN);

    onChangeIsLoading(false);
  }

  void onChangeIsLoading(bool newValue) {
    _isLoading = newValue;

    update();
  }
}
