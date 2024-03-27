import 'package:flutter/material.dart';
import 'package:sdg_ti/config/extensions/context_extension.dart';
import 'package:sdg_ti/features/search/data/models/country_model.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});


//TODO remove this line after implementing the BLOC
  static const List<CountryModel> mockCountries = [
    CountryModel(id: '1', value: 'Country 1'),
    CountryModel(id: '2', value: 'Country 2'),
    CountryModel(id: '3', value: 'Country 3'),
    CountryModel(id: '4', value: 'Country 4'),
    CountryModel(id: '5', value: 'Country 5'),
    CountryModel(id: '6', value: 'Country 6'),
    CountryModel(id: '7', value: 'Country 7'),
    CountryModel(id: '8', value: 'Country 8'),
    CountryModel(id: '9', value: 'Country 9'),
    CountryModel(id: '10', value: 'Country 10'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            DropdownMenu<CountryModel>(
              width: MediaQuery.of(context).size.width * 0.9,
              requestFocusOnTap: true,
              label: Text(context.localizations.country),
              onSelected: (CountryModel? country) {},
              dropdownMenuEntries: mockCountries
                  .map<DropdownMenuEntry<CountryModel>>((CountryModel country) {
                return DropdownMenuEntry<CountryModel>(
                  value: country,
                  label: country.value,
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            DropdownMenu<CountryModel>(
              width: MediaQuery.of(context).size.width * 0.9,
              requestFocusOnTap: true,
              label: Text(context.localizations.state),
              onSelected: (CountryModel? country) {},
              dropdownMenuEntries: mockCountries
                  .map<DropdownMenuEntry<CountryModel>>((CountryModel country) {
                return DropdownMenuEntry<CountryModel>(
                  value: country,
                  label: country.value,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
