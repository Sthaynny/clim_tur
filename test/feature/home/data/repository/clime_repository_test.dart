import 'package:clim_tur/app/feature/home/data/datasorce/clime_datasource.dart';
import 'package:clim_tur/app/feature/home/data/models/clime_model.dart';
import 'package:clim_tur/app/feature/home/data/models/weathe_forecast_model.dart';
import 'package:clim_tur/app/feature/home/data/repository/clime_repository.dart';
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

class _MockDataSource extends Mock implements ClimeDatasource {
  @override
  Future<ApiResult> getClime(String search) async {
    return Success(
      statusCode: 200,
      data: _tInstanceClimeModel.toJson(),
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

void main() {
  IClimeRepository repository = ClimeRepository(datasource: _MockDataSource());

  group(
    'Resquest ClimeRepository',
    () {
      test('Success Request', () async {
        final result = await repository.getClimes('test');
        expect(result.isRight(), true);
      });

      test('Error Request', () async {
        repository = ClimeRepository(
          datasource: _MockDataSourceError(),
        );
        final result = await repository.getClimes('test');

        expect(result.isLeft(), true);
      });
    },
  );
}
