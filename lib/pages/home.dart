import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clone_weather/data/datasource/remote_datasource.dart';
import 'package:clone_weather/bloc/weather_bloc.dart';
import 'package:clone_weather/data/model/weather.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(remoteDataSource: RemoteDataSource())..add(LoadWeather()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is WeatherLoaded) {
              final data = state.data;
              return ListView(
                children: [
                  ListTile(
                    title: Text('Temperature: ${data.main.temp}'),
                    subtitle: Text('Feels Like: ${data.main.feelsLike}'),
                  ),
                  ListTile(
                    title: Text('Humidity: ${data.main.humidity}%'),
                    subtitle: Text('Pressure: ${data.main.pressure} hPa'),
                  ),
                  ListTile(
                    title: Text('Wind Speed: ${data.wind.speed} m/s'),
                    subtitle: Text('Wind Direction: ${data.wind.deg}°'),
                  ),
                  ListTile(
                    title: Text('Visibility: ${data.visibility} meters'),
                  ),
                  ListTile(
                    title: Text('Weather: ${data.weather[0].description}'),
                    subtitle: Text('Condition: ${data.weather[0].main}'),
                  ),
                  ListTile(
                    title: Text('Cloudiness: ${data.clouds.all}%'),
                  ),
                  ListTile(
                    title: Text('Location: ${data.name}, ${data.sys.country}'),
                    subtitle: Text('Sunrise: ${DateTime.fromMillisecondsSinceEpoch(data.sys.sunrise * 1000).toLocal()}'),
                  ),
                  ListTile(
                    title: Text('Sunset: ${DateTime.fromMillisecondsSinceEpoch(data.sys.sunset * 1000).toLocal()}'),
                  ),
                ],
              );
            } else if (state is WeatherError) {
              return Center(child: Text(state.error));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
