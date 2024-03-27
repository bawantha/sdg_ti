import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sdg_ti/features/search/data/models/country_model.dart';
import 'package:sdg_ti/features/search/domain/repository/search_repository.dart';

import '../../../../core/error/failure.dart';

@Injectable()
class GetCountriesUseCase {
  final SearchRepository _repository;

  GetCountriesUseCase(this._repository);

  Future<Either<Failure, List<CountryModel>>> call() {
    return _repository.getAllCountries();
  }
}
