import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sdg_ti/features/search/data/models/country_model.dart';

import '../../models/state_model.dart';

part 'search_api.g.dart';

@RestApi()
abstract class SearchApi {
  factory SearchApi(Dio dio, {String baseUrl}) = _SearchApi;

  @GET('/countries')
  Future<List<CountryModel>> getAllCountries();

  @GET('/countries/{countryId}/states')
  Future<List<StateModel>> getStatesOfCountry(
      @Path('countryId') String countryId);
}
