import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sdg_ti/config/injectable/injectable.dart';
import 'package:sdg_ti/features/search/data/data_soruce/remote/search_api.dart';

import '../application/app_config.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio() {
    final dio = Dio();
    dio.options.headers["x-api-key"] = getIt<ApplicationConfig>().apiKey;
    dio.options.headers["User-Agent"] = getIt<ApplicationConfig>().userAgent;
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
      ),
    );
    return dio;
  }

  @injectable
  SearchApi searchApi() {
    return SearchApi(
      dio(),
      baseUrl: getIt<ApplicationConfig>().backendBaseUrl,
    );
  }
}
