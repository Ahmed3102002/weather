class WeatherModel {
  final String currentCity;
  final String currentRegion;
  final String currentCountry;
  final DateTime lastUpdated;
  final String date;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherState;
  final String weatherImage;

  WeatherModel(
      {required this.currentRegion,
      required this.currentCountry,
      required this.currentCity,
      required this.lastUpdated,
      required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherState,
      required this.weatherImage});

  factory WeatherModel.fromJson(weatherData) {
    return WeatherModel(
      currentCity: weatherData['location']['name'],
      currentRegion: weatherData['location']['region'],
      currentCountry: weatherData['location']['country'],
      lastUpdated: DateTime.parse(weatherData['current']['last_updated']),
      date: weatherData['forecast']['forecastday'][0]['date'],
      temp: weatherData['current']['temp_c'],
      maxTemp: weatherData['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: weatherData['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherImage: weatherData['current']['condition']['icon'],
      weatherState: weatherData['current']['condition']['text'],
    );
  }
}
