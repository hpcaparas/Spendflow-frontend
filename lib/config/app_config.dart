class AppConfig {
  final String appName;
  final String baseUrl;
  final String environment;
  final bool enableLogging;

  const AppConfig({
    required this.appName,
    required this.baseUrl,
    required this.environment,
    required this.enableLogging,
  });
}
