import 'package:vurelo/app/data/source/local/local_storage.dart';
import 'package:vurelo/app/domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorage _localStorage;

  LocalStorageRepositoryImpl({required LocalStorage localStorage})
    : _localStorage = localStorage;

  @override
  Future<void> setShowOnboarding() async =>
      await _localStorage.setShowOnboarding();

  @override
  bool? getShowOnboarding() => _localStorage.getShowOnboarding();

  @override
  Future<void> setEmailAddress(String value) async =>
      await _localStorage.setEmailAddress(value);

  @override
  Future<void> setKeyAccount(String value) async =>
      await _localStorage.setKeyAccount(value);

  @override
  Future<void> setName(String value) async =>
      await _localStorage.setName(value);

  @override
  Future<void> setPhoneNumber(String value) async =>
      await _localStorage.setPhoneNumber(value);

  @override
  String? getEmailAddress() => _localStorage.getEmailAddress();

  @override
  String? getKeyAccount() => _localStorage.getKeyAccount();

  @override
  String? getName() => _localStorage.getName();

  @override
  String? getPhoneNumber() => _localStorage.getPhoneNumber();

  @override
  Future<void> deleteUserData() async => await _localStorage.deleteUserData();
}
