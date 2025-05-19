import 'package:get_storage/get_storage.dart';

class LocalStorage {
  final GetStorage _box;

  LocalStorage({required GetStorage box}) : _box = box;

  Future<void> setShowOnboarding() async =>
      await _box.write('showOnboarding', false);

  bool? getShowOnboarding() => _box.read('showOnboarding');

  Future<void> setEmailAddress(String value) async =>
      await _box.write('emailAddress', value);

  Future<void> setKeyAccount(String value) async =>
      await _box.write('keyAccount', value);

  Future<void> setName(String value) async => await _box.write('name', value);

  Future<void> setPhoneNumber(String value) async =>
      await _box.write('phoneNumber', value);

  String? getEmailAddress() => _box.read('emailAddress');

  String? getKeyAccount() => _box.read('keyAccount');

  String? getName() => _box.read('name');

  String? getPhoneNumber() => _box.read('phoneNumber');

  Future<void> deleteUserData() async {
    await _box.remove('emailAddress');
    await _box.remove('phoneNumber');
    await _box.remove('name');
    await _box.remove('keyAccount');
  }
}
