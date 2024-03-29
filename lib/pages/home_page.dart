import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubits/weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubits/weather_states.dart';
import 'package:weather/widgets/error_weather.dart';
import 'package:weather/widgets/loading_weather.dart';
import 'package:weather/widgets/non_weather.dart';
import 'package:weather/widgets/weather_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    GetWeatherCubit weatherCubit = BlocProvider.of<GetWeatherCubit>(context);
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is InitialWeatherState) {
              return const NoWeather();
            } else if (state is LoadingWeatherState) {
              return const LoadingWeather();
            } else if (state is WeatherSuccessState) {
              return const WeatherBody();
            } else {
              return ErrorWeather(weatherCubit: weatherCubit);
            }
          },
        ),
      ),
    );
  }
}
