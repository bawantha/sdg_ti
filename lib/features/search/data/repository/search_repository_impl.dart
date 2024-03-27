import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sdg_ti/core/error/failure.dart';
import 'package:sdg_ti/features/search/data/data_soruce/remote/search_api.dart';
import 'package:sdg_ti/features/search/data/models/country_model.dart';
import 'package:sdg_ti/features/search/data/models/state_model.dart';
import 'package:sdg_ti/features/search/domain/repository/search_repository.dart';
import 'package:sdg_ti/util/logger/sdg_log.dart';

import '../../../../core/error/network_failure.dart';

@LazySingleton(as: SearchRepository)
final class SearchRepositoryImpl extends SearchRepository {
  static const _tag = 'SearchRepository';

  final SearchApi api;

  SearchRepositoryImpl(this.api);

  @override
  Future<Either<Failure, List<CountryModel>>> getAllCountries() async {
    try {
      final countries = await api.getAllCountries();
      return right(countries);
    } on DioException catch (error) {
      SDGLog.error(_tag, error);
      return left(const NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<StateModel>>> getStatesOfCountry(
      int countryId) async {
    try {
      final states = await api.getStatesOfCountry(countryId);
      return right(states);
    } on DioException catch (error) {
      SDGLog.error(_tag, error);
      return left(const NetworkFailure());
    }
  }
}
