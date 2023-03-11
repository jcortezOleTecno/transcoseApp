// ignore_for_file: always_use_package_imports

import 'package:get_it/get_it.dart';
import 'package:vemare/app/data/_api.dart';
import 'package:vemare/app/data/auth_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';

final getIt = GetIt.instance;

abstract class ServiceLocator {
  static Future<void> setup() async {
    final myApi = MyApi();
    getIt
      ..registerFactory(LocalDataRepository.new)
      ..registerFactory(
        () => AuthRepository(
          apiClient: myApi,
          localDataRepository: getIt.get<LocalDataRepository>(),
        ),
      );
  }
}
