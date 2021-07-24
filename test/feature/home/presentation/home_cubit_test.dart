import 'package:bloc_test/bloc_test.dart';
import 'package:clim_tur/app/feature/home/data/models/clime_model.dart';
import 'package:clim_tur/app/feature/home/data/models/weathe_forecast_model.dart';
import 'package:clim_tur/app/feature/home/domain/entity/clime_entity.dart';
import 'package:clim_tur/app/feature/home/domain/usercases/get_clime_local_usercase.dart';
import 'package:clim_tur/app/feature/home/domain/usercases/get_clime_usercase.dart';
import 'package:clim_tur/app/feature/home/domain/usercases/save_clime_local_usercase.dart';
import 'package:clim_tur/app/feature/home/presentation/cubit/home_cubit.dart';
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

Future<void> main() async {
  HomeCubit? homeCubitSuccess;
  HomeCubit? homeCubitError;

  setUp(() {
    homeCubitSuccess = HomeCubit(
        saveLocalClimeUsercase: MockSaveLocalUseCase(),
        usercase: MockSearchUseCaseSuccess(),
        localUsercase: MockSearchLocalUseCaseSuccess());
    homeCubitError = HomeCubit(
        saveLocalClimeUsercase: MockSaveLocalUseCase(),
        usercase: MockSearchUseCaseError(),
        localUsercase: MockSearchLocalUseCaseError());
  });

  tearDown(() {
    homeCubitSuccess!.close();
    homeCubitError!.close();
  });

  group('Home (cubit): ', () {
    test(
      'Verificar estado inicial',
      () {
        expect(
          homeCubitSuccess!.state,
          isA<HomeInitial>(),
        );
        expect(
          homeCubitError!.state,
          isA<HomeInitial>(),
        );
      },
    );

    blocTest<HomeCubit, HomeState>(
      'get clime Success',
      build: () {
        return homeCubitSuccess!;
      },
      act: (bloc) async => bloc.loadClimeApi('asd'),
      expect: () => [
        isA<HomeLoading>(),
        isA<HomeLoaded>(),
      ],
    );
    blocTest<HomeCubit, HomeState>(
      'get clime Error',
      build: () {
        return homeCubitError!;
      },
      act: (bloc) async => bloc.loadClimeApi('asd'),
      expect: () => [
        isA<HomeLoading>(),
        isA<HomeLoadedError>(),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'get Local clime Success',
      build: () {
        return homeCubitSuccess!;
      },
      act: (bloc) async => bloc.loadClimeLocal('ss'),
      expect: () => [
        isA<HomeLoaded>(),
      ],
    );
  });
}

class MockSearchUseCaseSuccess extends Mock implements GetClimeUsercase {
  Future<Either<ApiError, ClimeEntity>> call(String search) async {
    return Right(_tInstanceClimeModel);
  }
}

class MockSearchUseCaseError extends Mock implements GetClimeUsercase {
  Future<Either<ApiError, ClimeEntity>> call(String search) async {
    return Left(ApiError(statusCode: 404));
  }
}

class MockSearchLocalUseCaseSuccess extends Mock
    implements GetClimeLocalUsercase {
  Future<ClimeEntity?> call(String search) async {
    return _tInstanceClimeModel;
  }
}

class MockSearchLocalUseCaseError extends Mock
    implements GetClimeLocalUsercase {
  Future<ClimeEntity?> call(String search) async {
    return null;
  }
}

class MockSaveLocalUseCase extends Mock implements SaveLocalClimeUsercase {
  Future<bool> call(ClimeEntity climeEntity) async {
    return true;
  }
}
