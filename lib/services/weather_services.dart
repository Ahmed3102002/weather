import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather/model/weather_model.dart';

class WeatherServices {
  final Dio dio = Dio();
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String key = 'd8fa679b21bf49389ad82554242402';
  final int days = 1;

  Future<WeatherModel> getCurrentWeather({required String city}) async {
    try {
      String api = '$baseUrl/forecast.json?key=$key&q=$city&days=$days';
      Response request = await dio.get(api);
      WeatherModel weatherData = WeatherModel.fromJson(request.data);
      log('${weatherData.lastUpdated}${weatherData.date}');
      return weatherData;
    } on DioException catch (e) {
      log('$e');
      final String error =
          e.response?.data['error']['message'] ?? 'Oops , there was an error';
      log(error);
      throw Exception(error);
    } catch (e) {
      log('$e');
      throw Exception('Something wrong ,try again later');
    }
  }
}
