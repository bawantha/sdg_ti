// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sdg_ti/config/application/app_config.dart' as _i3;
import 'package:sdg_ti/config/injectable/application_cofig_module.dart' as _i11;
import 'package:sdg_ti/config/injectable/network_module.dart' as _i12;
import 'package:sdg_ti/features/search/data/data_soruce/remote/search_api.dart'
    as _i5;
import 'package:sdg_ti/features/search/data/repository/search_repository_impl.dart'
    as _i7;
import 'package:sdg_ti/features/search/domain/repository/search_repository.dart'
    as _i6;
import 'package:sdg_ti/features/search/domain/usecase/get_countries_use_case.dart'
    as _i8;
import 'package:sdg_ti/features/search/domain/usecase/get_states_use_case.dart'
    as _i9;
import 'package:sdg_ti/features/search/presentation/cubit/search_cubit.dart'
    as _i10;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final applicationConfigModule = _$ApplicationConfigModule();
    final networkModule = _$NetworkModule();
    gh.factory<_i3.ApplicationConfig>(() => applicationConfigModule.envConfig);
    gh.lazySingleton<_i4.Dio>(() => networkModule.dio());
    gh.factory<_i5.SearchApi>(() => networkModule.searchApi());
    gh.lazySingleton<_i6.SearchRepository>(
        () => _i7.SearchRepositoryImpl(gh<_i5.SearchApi>()));
    gh.factory<_i8.GetCountriesUseCase>(
        () => _i8.GetCountriesUseCase(gh<_i6.SearchRepository>()));
    gh.factory<_i9.GetStatesUseCase>(
        () => _i9.GetStatesUseCase(gh<_i6.SearchRepository>()));
    gh.factory<_i10.SearchCubit>(() => _i10.SearchCubit(
          getCountriesUseCase: gh<_i8.GetCountriesUseCase>(),
          getStatesUseCase: gh<_i9.GetStatesUseCase>(),
        ));
    return this;
  }
}

class _$ApplicationConfigModule extends _i11.ApplicationConfigModule {}

class _$NetworkModule extends _i12.NetworkModule {}
