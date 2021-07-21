import 'package:clim_tur/app/feature/home/domain/entity/clime_entity.dart';
import 'package:clim_tur/core/network/dio/response/states/apiError/api_error.dart';
import 'package:dartz/dartz.dart';

abstract class IClimeRepository {
  Future<Either<ApiError, ClimeEntity>> getClimes(String search);
}
