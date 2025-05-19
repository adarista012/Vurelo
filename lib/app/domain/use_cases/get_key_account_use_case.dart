import 'package:vurelo/app/app_use_case.dart';
import 'package:vurelo/app/domain/repositories/local_storage_repository.dart';

class GetKeyAccountUseCase implements AppUseCase<String?, dynamic> {
  final LocalStorageRepository _localStorageRepository;

  GetKeyAccountUseCase({required LocalStorageRepository localStorageRepository})
    : _localStorageRepository = localStorageRepository;

  @override
  String? call({params}) => _localStorageRepository.getKeyAccount();
}
