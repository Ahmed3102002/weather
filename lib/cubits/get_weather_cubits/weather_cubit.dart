import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubits/weather_states.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(InitialWeatherState());
  WeatherModel? weather;
  bool search = false;
  getWeather({required String city}) async {
    try {
      weather = await WeatherServices().getCurrentWeather(city: city);
      emit(WeatherSuccessState());
      log('done ${weather?.currentCity}');
    } catch (error) {
      emit(WeatherFailedState());
      log('$error');
    }
  }

  void newWeather() {
    emit(LoadingWeatherState());
  }

  void searchBar() {
    search = !search;
    emit(SearchWeatherState());
  }
}
