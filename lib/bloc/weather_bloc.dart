import 'package:bloc/bloc.dart';
import 'package:clone_weather/data/datasource/remote_datasource.dart';
import 'package:clone_weather/data/model/weather.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final RemoteDataSource remoteDataSource;

  WeatherBloc({required this.remoteDataSource}) : super(WeatherInitial()) {
    on<LoadWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        final data = await remoteDataSource.getWeather();
        emit(WeatherLoaded(data));
      } catch (e) {
        emit(WeatherError(e.toString()));
      }
    });
  }
}
