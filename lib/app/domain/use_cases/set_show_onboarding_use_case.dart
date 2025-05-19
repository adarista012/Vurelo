import 'package:vurelo/app/app_use_case.dart';
import 'package:vurelo/app/domain/repositories/local_storage_repository.dart';

class SetShowOnboardingUseCase implements AppUseCase<void, bool> {
  final LocalStorageRepository _localStorageRepository;

  SetShowOnboardingUseCase({
    required LocalStorageRepository localStorageRepository,
  }) : _localStorageRepository = localStorageRepository;

  @override
  Future<void> call({bool? params}) async =>
      await _localStorageRepository.setShowOnboarding();
}
