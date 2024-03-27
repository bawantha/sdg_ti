import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/country_model.dart';
import '../../data/models/state_model.dart';
import '../../domain/usecase/get_countries_use_case.dart';
import '../../domain/usecase/get_states_use_case.dart';

part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  GetCountriesUseCase getCountriesUseCase;
  GetStatesUseCase getStatesUseCase;

  SearchCubit({
    required this.getCountriesUseCase,
    required this.getStatesUseCase,
  }) : super(SearchState.initial());

  Future<void> init() async {
    emit(state.copyWith(status: SearchStatus.loading));
    final countriesResponse = await getCountriesUseCase();
    countriesResponse.fold(
      (failure) {
        emit(
          state.copyWith(
            countries: [],
            status: SearchStatus.error,
          ),
        );
      },
      (countries) {
        emit(
          state.copyWith(
            countries: countries,
            status: SearchStatus.loaded,
          ),
        );
      },
    );
  }

  void onSelectCountry(CountryModel? selectedCountry) {
    if (selectedCountry == null) {
      return;
    } else {
      emit(state.copyWith(selectedCountry: selectedCountry));
      unawaited(getStates(selectedCountry.id));
    }
  }

  Future<void> getStates(int countryId) async {
    emit(state.copyWith(status: SearchStatus.loading));
    final statesResponse = await getStatesUseCase(countryId);
    statesResponse.fold(
      (failure) {
        emit(
          state.copyWith(
            states: [],
            status: SearchStatus.error,
          ),
        );
      },
      (states) {
        emit(
          state.copyWith(
            states: states,
            status: SearchStatus.loaded,
          ),
        );
      },
    );
  }

  void refresh() {
    emit(SearchState.initial());
    unawaited(init());
  }
}
