import 'package:dio/dio.dart';
import 'package:clone_weather/data/model/weather.dart';

class RemoteDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.openweathermap.org/data/2.5/',
  ));

  Future<WeatherData> getWeather() async {
    final response = await dio.get('weather', queryParameters: {
      'lat': -6.269900,
      'lon': 106.756348,
      'appid': 'a0610dc0f62a16d799cdf9c543be40ac',
      'units': 'metric'
    });
    return WeatherData.fromJson(response.data);
  }
}
