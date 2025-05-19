abstract class LocalStorageRepository {
  Future<void> setName(String value);
  Future<void> setPhoneNumber(String value);
  Future<void> setEmailAddress(String value);
  Future<void> setKeyAccount(String value);
  Future<void> setShowOnboarding();

  Future<void> deleteUserData();

  bool? getShowOnboarding();
  String? getName();
  String? getPhoneNumber();
  String? getEmailAddress();
  String? getKeyAccount();
}
