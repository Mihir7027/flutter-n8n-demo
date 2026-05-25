import 'app_config.dart';

final devConfig = AppConfig(
  appName: 'flutter_n8n_demo Dev',
  apiBaseUrl: 'https://api.dev.example.com',
  apiVersion: 'v1',
  enableCertificatePinning: false,
  pinnedCertificateHashes: [],
  enableLogging: true,
);
