import 'package:clim_tur/app/feature/home/data/datasorce/clime_datasource.dart';
import 'package:clim_tur/app/feature/home/data/models/clime_model.dart';
import 'package:clim_tur/app/feature/home/domain/entity/clime_entity.dart';
import 'package:clim_tur/app/feature/home/domain/repository/iclime_repository.dart';
import 'package:clim_tur/core/network/dio/response/states/apiError/api_error.dart';
import 'package:clim_tur/core/network/dio/response/states/success.dart';
import 'package:dartz/dartz.dart';

class ClimeRepository implements IClimeRepository {
  ClimeRepository({required ClimeDatasource datasource})
      : _datasource = datasource;
  final ClimeDatasource _datasource;
  @override
  Future<Either<ApiError, ClimeEntity>> getClimes(String search) async {
    final result = await _datasource.getClime(search);
    if (result is Success) {
      return Right(ClimeModel.fromJson(result.data as String));
    }
    return Left(ApiError(statusCode: 404));
  }
}
