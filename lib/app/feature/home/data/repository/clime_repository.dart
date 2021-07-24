import 'package:clim_tur/app/feature/home/data/datasorce/clime_datasource.dart';
import 'package:clim_tur/app/feature/home/data/datasorce/clime_local_datasource.dart';
import 'package:clim_tur/app/feature/home/data/models/clime_model.dart';
import 'package:clim_tur/app/feature/home/domain/entity/clime_entity.dart';
import 'package:clim_tur/app/feature/home/domain/repository/iclime_repository.dart';
import 'package:clim_tur/core/network/dio/response/states/apiError/api_error.dart';
import 'package:clim_tur/core/network/dio/response/states/success.dart';
import 'package:dartz/dartz.dart';

class ClimeRepository implements IClimeRepository {
  ClimeRepository({
    required ClimeDatasource datasource,
    required ClimeLocalDatasource datasourceLocal,
  })   : _datasource = datasource,
        _datasourceLocal = datasourceLocal;
  final ClimeDatasource _datasource;
  final ClimeLocalDatasource _datasourceLocal;
  @override
  Future<Either<ApiError, ClimeEntity>> getClimes(String search) async {
    try {
      final result = await _datasource.getClime(search);
      if (result is Success) {
        return Right(ClimeModel.fromMap(result.data as Map<String, dynamic>));
      }
    } catch (e) {
      return Left(ApiError(statusCode: 401));
    }

    return Left(ApiError(statusCode: 404));
  }

  @override
  Future<ClimeEntity?> getClimesLocal() {
    return _datasourceLocal.getClimeLocal();
  }

  @override
  Future<bool> saveClimesLocal(ClimeEntity climeEntity) async {
    return await _datasourceLocal.saveClimeLocal(climeEntity);
  }
}
