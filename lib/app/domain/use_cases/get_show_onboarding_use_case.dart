import 'package:vurelo/app/app_use_case.dart';
import 'package:vurelo/app/domain/repositories/local_storage_repository.dart';

class GetShowOnboardingUseCase implements AppUseCase<bool?, dynamic> {
  final LocalStorageRepository _localStorageRepository;

  GetShowOnboardingUseCase({
    required LocalStorageRepository localStorageRepository,
  }) : _localStorageRepository = localStorageRepository;

  @override
  bool? call({params}) => _localStorageRepository.getShowOnboarding();
}
