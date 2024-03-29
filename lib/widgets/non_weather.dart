import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/components/methods.dart';
import 'package:weather/cubits/get_weather_cubits/weather_cubit.dart';
import 'package:weather/widgets/appBarStyle.dart';
import 'package:weather/widgets/description_state.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    GetWeatherCubit weatherCubit = BlocProvider.of<GetWeatherCubit>(context);
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.02,
            vertical: MediaQuery.sizeOf(context).width * 0.07),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  getWeatherImage(weatherCubit.weather?.weatherState)),
              fit: BoxFit.fitHeight),
        ),
        child: const Column(
          children: [
            AppBarStyle(),
            Spacer(
              flex: 1,
            ),
            DescriptionState(
                title: 'There isn`t weather yet 😩 \n Start searching now 🔍'),
            Spacer(
              flex: 2,
            ),
          ],
        ));
  }
}
