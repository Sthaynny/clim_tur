import 'package:clim_tur/app/feature/home/domain/entity/clime_entity.dart';
import 'package:clim_tur/app/feature/home/domain/repository/iclime_repository.dart';

class SaveLocalClimeUsercase {
  SaveLocalClimeUsercase({required IClimeRepository repository})
      : _repository = repository;
  final IClimeRepository _repository;

  Future<bool> call(ClimeEntity climeEntity) async {
    return await _repository.saveClimesLocal(climeEntity);
  }
}
