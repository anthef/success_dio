part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherData data;

  WeatherLoaded(this.data);
}

class WeatherError extends WeatherState {
  final String error;

  WeatherError(this.error);
}
