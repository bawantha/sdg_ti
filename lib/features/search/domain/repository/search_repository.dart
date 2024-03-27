import 'package:dartz/dartz.dart';
import 'package:sdg_ti/features/search/data/models/country_model.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/state_model.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<CountryModel>>> getAllCountries();

  Future<Either<Failure, List<StateModel>>> getStatesOfCountry(
      String countryId);
}
