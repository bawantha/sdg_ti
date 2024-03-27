import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sdg_ti/util/logger/sdg_log.dart';
import 'injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  SDGLog.info('DI', '===== Injecting dependencies ====');
  getIt.init();
}
