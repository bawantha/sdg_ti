import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:sdg_ti/util/logger/sdg_log.dart';

import '../application/app_config.dart';

@module
abstract class ApplicationConfigModule {
  @injectable
  ApplicationConfig get envConfig {
    const variant = String.fromEnvironment('variant');
    SDGLog.info('Application Config', variant);
    return ApplicationConfig.fromFlavor(variant, dotenv.env);
  }
}
