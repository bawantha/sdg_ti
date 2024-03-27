import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sdg_ti/features/search/data/data_soruce/remote/search_api.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio() {
    final dio = Dio();
    dio.options.headers["x-api-key"] = dotenv.env["API_KEY"];
    dio.options.headers["User-Agent"] = dotenv.env["USER_AGENT"];
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
      baseUrl: "https://api.stagingcupid.com/api/v1", //TODO flavorize
    );
  }
}
