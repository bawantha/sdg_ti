// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sdg_ti/config/injectable/network_module.dart' as _i7;
import 'package:sdg_ti/features/search/data/data_soruce/remote/search_api.dart'
    as _i4;
import 'package:sdg_ti/features/search/data/repository/search_repository_impl.dart'
    as _i6;
import 'package:sdg_ti/features/search/domain/repository/search_repository.dart'
    as _i5;

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
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i3.Dio>(() => networkModule.dio());
    gh.factory<_i4.SearchApi>(() => networkModule.searchApi());
    gh.lazySingleton<_i5.SearchRepository>(
        () => _i6.SearchRepositoryImpl(gh<_i4.SearchApi>()));
    return this;
  }
}

class _$NetworkModule extends _i7.NetworkModule {}
