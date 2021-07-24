import 'package:clim_tur/app/feature/home/data/datasorce/clime_datasource.dart';
import 'package:clim_tur/app/feature/home/data/datasorce/clime_local_datasource.dart';
import 'package:clim_tur/app/feature/home/data/models/clime_model.dart';
import 'package:clim_tur/app/feature/home/data/models/weathe_forecast_model.dart';
import 'package:clim_tur/app/feature/home/data/repository/clime_repository.dart';
import 'package:clim_tur/app/feature/home/domain/entity/clime_entity.dart';
import 'package:clim_tur/app/feature/home/domain/repository/iclime_repository.dart';
import 'package:clim_tur/core/network/dio/response/api_result.dart';
import 'package:clim_tur/core/network/dio/response/states/apiError/api_error.dart';
import 'package:clim_tur/core/network/dio/response/states/success.dart';
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

class _MockDataSourceSuccess extends Mock implements ClimeDatasource {
  @override
  Future<ApiResult> getClime(String search) async {
    return Success(
      statusCode: 200,
      data: _tInstanceClimeModel.toMap(),
    );
  }
}

class _MockDataSourceError extends Mock implements ClimeDatasource {
  @override
  Future<ApiResult> getClime(String search) async {
    return ApiError(
      statusCode: 404,
    );
  }
}

class _MockLocalDataSourceSuccess extends Mock implements ClimeLocalDatasource {
  @override
  Future<ClimeEntity?> getClimeLocal(String search) async {
    return _tInstanceClimeModel;
  }

  @override
  Future<bool> saveClimeLocal(ClimeEntity climeEntity) async {
    return true;
  }
}

class _MockLocalDataSourceError extends Mock implements ClimeLocalDatasource {
  @override
  Future<ClimeEntity?> getClimeLocal(String search) async {
    return null;
  }

  @override
  Future<bool> saveClimeLocal(ClimeEntity climeEntity) async {
    return false;
  }
}

void main() {
  IClimeRepository repositorySuccess = ClimeRepository(
    datasource: _MockDataSourceSuccess(),
    datasourceLocal: _MockLocalDataSourceSuccess(),
  );
  IClimeRepository repositoryError = ClimeRepository(
    datasource: _MockDataSourceError(),
    datasourceLocal: _MockLocalDataSourceError(),
  );

  group(
    'Resquest ClimeRepository',
    () {
      test('Success Request', () async {
        final result = await repositorySuccess.getClimes('test');
        expect(result.isRight(), true);
      });

      test('Error Request', () async {
        final result = await repositoryError.getClimes('test');

        expect(result.isLeft(), true);
      });
    },
  );
  group(
    'Resquest Local',
    () {
      test('Success Request getClimesLocal', () async {
        final result = await repositorySuccess.getClimesLocal('ss');

        expect(result != null, true);
      });

      test('Error Request getClimesLocal', () async {
        final result = await repositoryError.getClimesLocal('ss');

        expect(result == null, true);
      });
    },
  );
  group(
    'Resquest Save',
    () {
      test('Success Request saveClimesLocal', () async {
        final result =
            await repositorySuccess.saveClimesLocal(_tInstanceClimeModel);

        expect(result, true);
      });

      test('Error Request saveClimesLocal', () async {
        final result =
            await repositoryError.saveClimesLocal(_tInstanceClimeModel);

        expect(result, false);
      });
    },
  );
}
