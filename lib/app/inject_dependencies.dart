import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vurelo/app/data/repositories_impl/local_storage_repository_impl.dart';
import 'package:vurelo/app/data/source/local/local_storage.dart';
import 'package:vurelo/app/domain/repositories/local_storage_repository.dart';
import 'package:vurelo/app/domain/use_cases/get_email_address_use_case.dart';
import 'package:vurelo/app/domain/use_cases/get_key_account_use_case.dart';
import 'package:vurelo/app/domain/use_cases/get_name_use_case.dart';
import 'package:vurelo/app/domain/use_cases/get_phone_number_use_case.dart';
import 'package:vurelo/app/domain/use_cases/get_show_onboarding_use_case.dart';
import 'package:vurelo/app/domain/use_cases/set_email_address_use_case.dart';
import 'package:vurelo/app/domain/use_cases/set_key_account_use_case.dart';
import 'package:vurelo/app/domain/use_cases/set_name_use_case.dart';
import 'package:vurelo/app/domain/use_cases/set_phone_number_use_case.dart';
import 'package:vurelo/app/domain/use_cases/set_show_onboarding_use_case.dart';

Future<void> injectDependencies() async {
  await GetStorage.init();
  final box = GetStorage();

  Get.put(LocalStorage(box: box));

  Get.put<LocalStorageRepository>(
    LocalStorageRepositoryImpl(localStorage: Get.find()),
  );
  Get.put(GetShowOnboardingUseCase(localStorageRepository: Get.find()));
  Get.put(SetShowOnboardingUseCase(localStorageRepository: Get.find()));

  Get.put(SetEmailAddressUseCase(localStorageRepository: Get.find()));
  Get.put(GetEmailAddressUseCase(localStorageRepository: Get.find()));
  Get.put(SetNameUseCase(localStorageRepository: Get.find()));
  Get.put(GetNameUseCase(localStorageRepository: Get.find()));
  Get.put(SetKeyAccountUseCase(localStorageRepository: Get.find()));
  Get.put(GetKeyAccountUseCase(localStorageRepository: Get.find()));
  Get.put(SetPhoneNumberUseCase(localStorageRepository: Get.find()));
  Get.put(GetPhoneNumberUseCase(localStorageRepository: Get.find()));
}
