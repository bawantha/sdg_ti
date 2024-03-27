part of 'search_cubit.dart';

class SearchState extends Equatable {
  final List<CountryModel> countries;
  final List<StateModel> states;

  final CountryModel? selectedCountry;

  final StateModel? selectedState;

  final SearchStatus status;

  const SearchState(
      {required this.countries,
      required this.states,
      required this.selectedCountry,
      required this.selectedState,
      required this.status});

  factory SearchState.initial() {
    return const SearchState(
      countries: [],
      states: [],
      selectedCountry: null,
      selectedState: null,
      status: SearchStatus.initial,
    );
  }

  SearchState copyWith({
    List<CountryModel>? countries,
    List<StateModel>? states,
    CountryModel? selectedCountry,
    StateModel? selectedState,
    SearchStatus? status,
  }) {
    return SearchState(
      countries: countries ?? this.countries,
      states: states ?? this.states,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      selectedState: selectedState ?? this.selectedState,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        countries,
        states,
        selectedCountry,
        selectedState,
        status,
      ];
}

enum SearchStatus {
  initial,
  loading,
  loaded,
  error,
}
