import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:sdg_ti/features/search/data/data_soruce/remote/search_api.dart';
import 'package:sdg_ti/features/search/data/models/country_model.dart';
import 'package:sdg_ti/features/search/data/models/state_model.dart';

void main() {
  // Instance of the mock Dio
  // Instance of your API service
  late SearchApi service;

  late DioAdapter dioAdapter;

  late Dio dio;

  setUp(() {
    dio = Dio();

    dioAdapter = DioAdapter(dio: dio);
    // Initialize the service with the mock Dio
    service = SearchApi(dio);
  });

  group(
    'SearchApi Tests',
    () {
      final countries = List.generate(
        10,
        (i) => CountryModel(id: i, value: 'Country $i'),
      );
      final List<StateModel> states = List.generate(
        10,
        (i) => StateModel(id: i, value: 'State $i'),
      );

      test('.getAll Countries', () async {
        dioAdapter.onGet(
          '/countries',
          (request) => request.reply(200, countries),
        );

        final result = await service.getAllCountries();

        expect(result, countries);
      });

      test('getAll Countries throws an exception on error Server Error',
          () async {
        dioAdapter.onGet(
          '/countries',
          (request) => request.reply(406, 'Not Acceptable'),
        );

        expect(service.getAllCountries(), throwsException);
      });

      test('.get States by given Country Id', () async {
        final country = countries.first;
        dioAdapter.onGet(
          '/countries/${country.id}/states',
          (request) => request.reply(200, states),
        );

        final result = await service.getStatesOfCountry(country.id);

        expect(result, states);
      });

      test(
        '.get States by given Country Id  throws an exception on error Server Error',
        () async {
          final country = countries.first;
          dioAdapter.onGet(
            '/countries/${country.id}/states',
            (request) => request.reply(406, 'Not Acceptable'),
          );

          expect(service.getStatesOfCountry(country.id), throwsException);
        },
      );
    },
  );
}
