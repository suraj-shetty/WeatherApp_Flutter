import 'package:weather_app/models/enums/weather_conditions.dart';

class WeatherData {
  final String city;
  final double temperature;
  final double feelsLike;
  final double humidity;
  final double highTemp;
  final double lowTemp;
  final WeatherCondition weatherCondition;
  final String weatherCode;
  final DateTime? sunrise;
  final DateTime? sunset;
  final List<HourlyForecast> hourly;

  WeatherData({
    required this.city,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.highTemp,
    required this.lowTemp,
    required this.weatherCondition,
    required this.weatherCode,
    this.sunrise,
    this.sunset,
    required this.hourly,
  });
}

class HourlyForecast {
  final DateTime time;
  final double temp;
  final WeatherCondition condition;

  HourlyForecast({required this.time, required this.temp, required this.condition});
}