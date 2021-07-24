part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  HomeLoaded(this.climeEntity);
  final ClimeEntity climeEntity;
}

class HomeLoadedError extends HomeState {}

class HomeLoadedLocalError extends HomeState {}
