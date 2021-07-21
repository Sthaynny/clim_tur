import 'package:clim_tur/app/feature/home/domain/entity/clime_entity.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';

abstract class IClimeRepository {
  Future<Either<Error, ClimeEntity>> getClimes(String search);
}
