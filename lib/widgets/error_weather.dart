import 'package:flutter/material.dart';
import 'package:weather/components/methods.dart';
import 'package:weather/cubits/get_weather_cubits/weather_cubit.dart';
import 'package:weather/widgets/appBarStyle.dart';
import 'package:weather/widgets/description_state.dart';

class ErrorWeather extends StatelessWidget {
  const ErrorWeather({
    super.key,
    required this.weatherCubit,
  });

  final GetWeatherCubit weatherCubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.02,
          vertical: MediaQuery.sizeOf(context).width * 0.07),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  getWeatherImage(weatherCubit.weather?.weatherState)),
              fit: BoxFit.fitHeight)),
      child: const Column(
        children: [
          AppBarStyle(),
          Spacer(
            flex: 1,
          ),
          DescriptionState(title: 'Oops There was an error,\nPlease try again'),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
