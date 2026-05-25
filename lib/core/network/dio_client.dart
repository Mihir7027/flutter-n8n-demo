import 'package:dio/dio.dart';
import '../config/app_config.dart';
import '../logger/app_logger.dart';

class DioClient {
  late final Dio dio;

  DioClient({
    required AppConfig config,
    required AppLogger logger,
    required List<Interceptor> interceptors,
  }) {
    dio = Dio(
      BaseOptions(
        baseUrl: '${config.apiBaseUrl}/${config.apiVersion}/',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.addAll(interceptors);
  }
}
