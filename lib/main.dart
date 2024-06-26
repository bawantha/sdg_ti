import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sdg_ti/config/injectable/injectable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sdg_ti/util/logger/sdg_log.dart';

import 'features/search/presentation/pages/search_page.dart';

void main() async {
  await _loadEnv();
  configureDependencies();
  Bloc.observer = const AppBlocObserver();
  runApp(const SDGApp());
}

Future<void> _loadEnv() async {
  try {
    SDGLog.info("main", '======== Loading .env file =======');
    await dotenv.load(fileName: ".env");
  } catch (e) {
    SDGLog.error('main', 'Failed to load .env file');
  }
}

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) debugPrint(change.toString());
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    debugPrint(transition.toString());
  }
}

class SDGApp extends StatelessWidget {
  const SDGApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SearchPage(),
    );
  }
}
