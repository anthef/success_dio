part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

final class LoadWeather extends WeatherEvent {}
