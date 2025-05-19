import 'package:vurelo/app/app_use_case.dart';
import 'package:vurelo/app/domain/repositories/local_storage_repository.dart';

class GetEmailAddressUseCase implements AppUseCase<String?, dynamic> {
  final LocalStorageRepository _localStorageRepository;

  GetEmailAddressUseCase({
    required LocalStorageRepository localStorageRepository,
  }) : _localStorageRepository = localStorageRepository;

  @override
  String? call({params}) => _localStorageRepository.getEmailAddress();
}
