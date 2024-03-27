import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdg_ti/config/extensions/context_extension.dart';
import 'package:sdg_ti/features/search/data/models/country_model.dart';
import 'package:sdg_ti/features/search/data/models/state_model.dart';
import 'package:sdg_ti/features/search/presentation/cubit/search_cubit.dart';

import '../../../../config/injectable/injectable.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
      create: (context) => getIt<SearchCubit>()..init(),
      child: const SearchView(),
    );
  }
}

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SearchCubit, SearchState>(
        listenWhen: (previous, current) =>
            previous.status != current.status &&
            current.status == SearchStatus.error,
        listener: (context, state) {
          if (state.status == SearchStatus.error) {
            final snack = SnackBar(
              content: Text(context.localizations.errorMessage),
              action: SnackBarAction(
                label: context.localizations.retry,
                onPressed: context.read<SearchCubit>().refresh,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snack);
          }
        },
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  return DropdownMenu<CountryModel>(
                    initialSelection: state.selectedCountry,
                    width: MediaQuery.of(context).size.width * 0.9,
                    requestFocusOnTap: true,
                    label: Text(context.localizations.country),
                    onSelected: context.read<SearchCubit>().onSelectCountry,
                    dropdownMenuEntries: state.countries
                        .map<DropdownMenuEntry<CountryModel>>(
                            (CountryModel country) {
                      return DropdownMenuEntry<CountryModel>(
                        value: country,
                        label: country.value,
                      );
                    }).toList(),
                  );
                },
              ),
              const SizedBox(height: 10),
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  return DropdownMenu<StateModel>(
                    initialSelection: state.selectedState,
                    width: MediaQuery.of(context).size.width * 0.9,
                    requestFocusOnTap: true,
                    label: Text(context.localizations.state),
                    onSelected: (StateModel? state) {},
                    dropdownMenuEntries: state.states
                        .map<DropdownMenuEntry<StateModel>>((StateModel state) {
                      return DropdownMenuEntry<StateModel>(
                        value: state,
                        label: state.value,
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
