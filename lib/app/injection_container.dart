import 'package:clim_tur/app/feature/home/data/datasorce/clime_datasource.dart';
import 'package:clim_tur/app/feature/home/data/datasorce/clime_local_datasource.dart';
import 'package:clim_tur/app/feature/home/data/repository/clime_repository.dart';
import 'package:clim_tur/app/feature/home/domain/repository/iclime_repository.dart';
import 'package:clim_tur/app/feature/home/domain/usercases/get_clime_local_usercase.dart';
import 'package:clim_tur/app/feature/home/domain/usercases/get_clime_usercase.dart';
import 'package:clim_tur/app/feature/home/domain/usercases/save_clime_local_usercase.dart';
import 'package:clim_tur/app/feature/home/presentation/cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';

final dependency = GetIt.instance;

Future<void> init() async {
  dependency.registerFactory(
    () => ClimeDatasource(),
  );
  dependency.registerFactory(
    () => ClimeLocalDatasource(),
  );
  dependency.registerFactory<IClimeRepository>(
    () => ClimeRepository(
      datasource: dependency(),
      datasourceLocal: dependency(),
    ),
  );
  dependency.registerFactory(
    () => GetClimeUsercase(
      repository: dependency(),
    ),
  );
  dependency.registerFactory(
    () => GetClimeLocalUsercase(
      repository: dependency(),
    ),
  );
  dependency.registerFactory(
    () => SaveLocalClimeUsercase(
      repository: dependency(),
    ),
  );

  dependency.registerFactory(
    () => HomeCubit(
      localUsercase: dependency(),
      saveLocalClimeUsercase: dependency(),
      usercase: dependency(),
    ),
  );
}
