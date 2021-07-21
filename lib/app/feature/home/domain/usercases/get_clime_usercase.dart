import 'package:clim_tur/app/feature/home/domain/entity/clime_entity.dart';
import 'package:clim_tur/app/feature/home/domain/repository/iclime_repository.dart';
import 'package:clim_tur/core/network/dio/response/states/apiError/api_error.dart';
import 'package:dartz/dartz.dart';

class GetClimeUsercase {
  GetClimeUsercase({required IClimeRepository repository})
      : _repository = repository;
  final IClimeRepository _repository;

  Future<Either<ApiError, ClimeEntity>> call(String search) async {
    final result = await _repository.getClimes(search);
    return result;
  }
}
