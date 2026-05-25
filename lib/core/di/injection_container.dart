import 'package:get_it/get_it.dart';
import '../config/app_config.dart';
import '../logger/app_logger.dart';
import '../network/dio_client.dart';
import '../network/interceptors/auth_interceptor.dart';
import '../network/interceptors/logging_interceptor.dart';
import '../security/secure_storage.dart';

final sl = GetIt.instance;

Future<void> initDependencies(AppConfig config) async {
  // Core
  sl.registerSingleton<AppConfig>(config);
  sl.registerSingleton<AppLogger>(AppLogger());
  sl.registerSingleton<SecureStorage>(SecureStorageImpl());

  // Load cached token
  await (sl<SecureStorage>() as SecureStorageImpl).loadToken();

  // Network
  sl.registerSingleton<DioClient>(DioClient(
    config: sl(),
    logger: sl(),
    interceptors: [
      AuthInterceptor(sl()),
      if (config.enableLogging) LoggingInterceptor(sl()),
    ],
  ));

  // Feature modules — register below as you add features
  // registerHomeModule(sl);
}
