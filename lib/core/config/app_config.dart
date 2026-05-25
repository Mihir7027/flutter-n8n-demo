class AppConfig {
  final String appName;
  final String apiBaseUrl;
  final String apiVersion;
  final bool enableCertificatePinning;
  final List<String> pinnedCertificateHashes;
  final bool enableLogging;

  const AppConfig({
    required this.appName,
    required this.apiBaseUrl,
    required this.apiVersion,
    required this.enableCertificatePinning,
    required this.pinnedCertificateHashes,
    required this.enableLogging,
  });
}
