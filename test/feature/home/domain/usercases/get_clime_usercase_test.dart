import 'package:clim_tur/app/feature/home/data/models/clime_model.dart';
import 'package:clim_tur/app/feature/home/data/models/weathe_forecast_model.dart';
import 'package:clim_tur/app/feature/home/domain/entity/clime_entity.dart';
import 'package:clim_tur/app/feature/home/domain/repository/iclime_repository.dart';
import 'package:clim_tur/app/feature/home/domain/usercases/get_clime_usercase.dart';
import 'package:clim_tur/core/network/dio/response/states/apiError/api_error.dart';
import 'package:dartz/dartz.dart';
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
  Future<Either<ApiError, ClimeEntity>> getClimes(String search) async {
    return Right(_tInstanceClimeModel);
  }
}

class _MockRepositoryError extends Mock implements IClimeRepository {
  @override
  Future<Either<ApiError, ClimeEntity>> getClimes(String search) async {
    return Left(
      ApiError(
        statusCode: 404,
      ),
    );
  }
}

void main() {
  final _MockRepositorySuccess _repositorySuccess = _MockRepositorySuccess();
  final _MockRepositoryError _repositoryError = _MockRepositoryError();

  group(
    'Resquest GetClimeUsercase',
    () {
      test('Success Request', () async {
        final GetClimeUsercase usercase =
            GetClimeUsercase(repository: _repositorySuccess);
        final result = await usercase('test');

        expect(result.isRight(), true);
      });

      test('Error Request', () async {
        final GetClimeUsercase usercase =
            GetClimeUsercase(repository: _repositoryError);

        final result = await usercase('search');

        expect(result.isLeft(), true);
      });
    },
  );
}
