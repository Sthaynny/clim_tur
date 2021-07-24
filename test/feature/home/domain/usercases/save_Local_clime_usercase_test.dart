import 'package:clim_tur/app/feature/home/data/models/clime_model.dart';
import 'package:clim_tur/app/feature/home/data/models/weathe_forecast_model.dart';
import 'package:clim_tur/app/feature/home/domain/entity/clime_entity.dart';
import 'package:clim_tur/app/feature/home/domain/repository/iclime_repository.dart';
import 'package:clim_tur/app/feature/home/domain/usercases/save_clime_local_usercase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

final _tInstanceClimeModel = ClimeModel(
    cod: 111,
    id: 44,
    name: 'asda',
    weather: [],
    weatherForecast: WeatherForecastModel(
      temp: 115,
      feelsLike: 15651,
      grndLevel: 545,
      humidity: 4554,
      pressure: 4545,
      seaLevel: 54545,
      tempMax: 4554,
      tempMin: 45545,
    ));

class _MockRepositorySuccess extends Mock implements IClimeRepository {
  @override
  Future<ClimeEntity?> getClimesLocal() async {
    return _tInstanceClimeModel;
  }

  @override
  Future<bool> saveClimesLocal(ClimeEntity climeEntity) async {
    return true;
  }
}

class _MockRepositoryError extends Mock implements IClimeRepository {
  @override
  Future<ClimeEntity?> getClimesLocal() async {
    return null;
  }

  @override
  Future<bool> saveClimesLocal(ClimeEntity climeEntity) async {
    return false;
  }
}

void main() {
  final _MockRepositorySuccess _repositorySuccess = _MockRepositorySuccess();
  final _MockRepositoryError _repositoryError = _MockRepositoryError();

  group(
    'Resquest GetLocalClimeUsercase',
    () {
      test('Success Request', () async {
        final SaveLocalClimeUsercase usercase =
            SaveLocalClimeUsercase(repository: _repositorySuccess);
        final result = await usercase(_tInstanceClimeModel);

        expect(result, true);
      });

      test('Error Request', () async {
        final SaveLocalClimeUsercase usercase =
            SaveLocalClimeUsercase(repository: _repositoryError);

        final result = await usercase(_tInstanceClimeModel);

        expect(result, false);
      });
    },
  );
}
