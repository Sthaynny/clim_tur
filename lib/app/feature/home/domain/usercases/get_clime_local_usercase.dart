import 'package:clim_tur/app/feature/home/domain/entity/clime_entity.dart';
import 'package:clim_tur/app/feature/home/domain/repository/iclime_repository.dart';

class GetClimeLocalUsercase {
  GetClimeLocalUsercase({required IClimeRepository repository})
      : _repository = repository;
  final IClimeRepository _repository;

  Future<ClimeEntity?> call(String search) async {
    final result = await _repository.getClimesLocal(search);
    return result;
  }
}
