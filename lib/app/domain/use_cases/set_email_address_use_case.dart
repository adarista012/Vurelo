import 'package:vurelo/app/app_use_case.dart';
import 'package:vurelo/app/domain/repositories/local_storage_repository.dart';

class SetEmailAddressUseCase implements AppUseCase<void, String> {
  final LocalStorageRepository _localStorageRepository;

  SetEmailAddressUseCase({
    required LocalStorageRepository localStorageRepository,
  }) : _localStorageRepository = localStorageRepository;

  @override
  Future<void> call({String? params}) async =>
      await _localStorageRepository.setEmailAddress(params!);
}
