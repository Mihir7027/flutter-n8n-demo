import 'app_config.dart';

final stagingConfig = AppConfig(
  appName: 'flutter_n8n_demo Staging',
  apiBaseUrl: 'https://api.staging.example.com',
  apiVersion: 'v1',
  enableCertificatePinning: false,
  pinnedCertificateHashes: [],
  enableLogging: true,
);
