import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubits/weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubits/weather_states.dart';
import 'package:weather/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => GetWeatherCubit(),
      child: Builder(
        //هنا استخدمت builder علشان تديني context جديد احدث من context of bloc
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (BuildContext context, state) {
          return MaterialApp(
            title: 'weather_app',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              //primarySwatch: getWeatherColor(BlocProvider.of<GetWeatherCubit>(context).weather?.weatherState),
              // colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
              useMaterial3: false,
            ),
            home: const HomePage(),
          );
        }),
      ),
    );
  }
}
