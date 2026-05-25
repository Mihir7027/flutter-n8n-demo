import 'app_config.dart';

final prodConfig = AppConfig(
  appName: 'flutter_n8n_demo',
  apiBaseUrl: 'https://api.example.com',
  apiVersion: 'v1',
  enableCertificatePinning: true,
  pinnedCertificateHashes: ['sha256/YOUR_CERT_HASH_HERE'],
  enableLogging: false,
);
