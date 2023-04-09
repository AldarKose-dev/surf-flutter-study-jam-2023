// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/network/api/repositories/dio_repository.dart' as _i3;
import 'data/network/api/services/dio_service.dart' as _i4;
import 'data/network/api/services/dio_service_impl.dart' as _i5;
import 'data/repositories/ticket_storage_repository.dart' as _i6;
import 'data/services/ticket_storage_service_impl.dart' as _i8;
import 'domain/services/ticket_storage_service.dart' as _i7;
import 'features/ticket_storage/cubit/ticket_storage_cubit.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.DioRepository>(_i3.DioRepositoryImpl());
  gh.singleton<_i4.DioService>(_i5.DioServiceImpl(get<_i3.DioRepository>()));
  gh.singleton<_i6.TicketStorageRepository>(
      _i6.TicketStorageRepositoryImpl(get<_i4.DioService>()));
  gh.singleton<_i7.TicketStorageService>(
      _i8.TicketStorageServiceImpl(get<_i6.TicketStorageRepository>()));
  gh.factory<_i9.TicketStorageCubit>(
      () => _i9.TicketStorageCubit(get<_i7.TicketStorageService>()));
  return get;
}
