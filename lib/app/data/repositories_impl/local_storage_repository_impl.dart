import 'package:vurelo/app/domain/repositories/local_storage_repository.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final GetStorage _box;

  LocalStorageRepositoryImpl({required GetStorage box}) : _box = box;

  @override
  Future<void> setShowOnboarding() => _box.write('showOnboarding', false);

  @override
  bool? getShowOnboarding() => _box.read('showOnboarding');
}
