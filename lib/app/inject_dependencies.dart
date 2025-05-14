import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vurelo/app/data/repositories_impl/local_storage_repository_impl.dart';
import 'package:vurelo/app/domain/repositories/local_storage_repository.dart';

Future<void> injectDependencies() async {
  await GetStorage.init();
  final box = GetStorage();

  Get.put<LocalStorageRepository>(LocalStorageRepositoryImpl(box: box));
}
