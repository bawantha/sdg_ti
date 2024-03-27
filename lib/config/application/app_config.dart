final class ApplicationConfig {
  final Map<String, String> _env;

  final String backendBaseUrl;

  ApplicationConfig(this._env, this.backendBaseUrl) {
    assert(_env.containsKey('API_KEY'), 'API_KEY is not defined in .env');
    assert(_env.containsKey('USER_AGENT'), 'USER_AGENT is not defined in .env');
  }

  String get apiKey => _env['API_KEY']!;

  String get userAgent => _env['USER_AGENT']!;

  factory ApplicationConfig.fromFlavor(
    String flavor,
    Map<String, String> env,
  ) {
    switch (flavor) {
      case 'stage':
        return ApplicationConfig(env, 'https://api.stagingcupid.com/api/v1');
      case 'prod':
        return ApplicationConfig(env, 'https://xxx.xxxx.com/api/v1');
      default:
        return ApplicationConfig(env, 'https://api.stagingcupid.com/api/v1');
    }
  }
}
