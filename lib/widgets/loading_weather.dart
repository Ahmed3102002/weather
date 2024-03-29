import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/components/methods.dart';
import 'package:weather/cubits/get_weather_cubits/weather_cubit.dart';
import 'package:weather/widgets/appBarStyle.dart';
import 'package:weather/widgets/description_state.dart';

class LoadingWeather extends StatelessWidget {
  const LoadingWeather({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    GetWeatherCubit weatherCubit = BlocProvider.of<GetWeatherCubit>(context);
    String waitingText = "please waiting for transaction is processing";
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.02,
          vertical: MediaQuery.sizeOf(context).width * 0.07),
      decoration: BoxDecoration(
        image: DecorationImage(
            image:
                AssetImage(getWeatherImage(weatherCubit.weather?.weatherState)),
            fit: BoxFit.fitHeight),
      ),
      child: Column(
        children: [
          const AppBarStyle(),
          const Spacer(
            flex: 1,
          ),
          DescriptionState(title: waitingText.toUpperCase()),
          const CircularProgressIndicator(color: Colors.white),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
