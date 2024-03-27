import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sdg_ti/features/search/data/models/state_model.dart';

import '../../../../core/error/failure.dart';
import '../repository/search_repository.dart';

@injectable
class GetStatesUseCase {
  final SearchRepository repository;

  GetStatesUseCase(this.repository);

  Future<Either<Failure, List<StateModel>>> call(int countryId) async {
    return await repository.getStatesOfCountry(countryId);
  }
}
