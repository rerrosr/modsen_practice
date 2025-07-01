import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/features.dart';

final GetIt appLocator = GetIt.instance;

class CryptoDi {
  static Future<void> _initProviders(GetIt locator) async {
    locator.registerLazySingleton<CryptoCoinProvider>(
      () => CryptoCoinProviderImpl(dio: locator<Dio>()),
    );
  }

  static Future<void> _initRepositories(GetIt locator) async {
    locator.registerLazySingleton<CryptoCoinRepository>(
      () => CryptoCoinRepositoryImpl(
        cryptoCoinProvider: CryptoCoinProviderImpl(dio: appLocator<Dio>()),
      ),
    );
  }

  static Future<void> _initExceptionHandlers(GetIt locator) async {}

  static Future<void> _initUseCases(GetIt locator) async {
    locator.registerFactory<GetCryptoListUseCase>(
      () => GetCryptoListUseCase(
        cryptoCoinRepository: locator<CryptoCoinRepository>(),
      ),
    );
  }

  static Future<void> _initServices(GetIt locator) async {
    locator.registerLazySingleton<Dio>(Dio.new);
  }

  static Future<void> initDependencies(GetIt locator) async {
    await _initServices(locator);
    await _initExceptionHandlers(locator);
    await _initProviders(locator);
    await _initRepositories(locator);
    await _initUseCases(locator);
  }
}
