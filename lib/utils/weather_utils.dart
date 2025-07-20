import 'package:flutter/material.dart';
import 'package:weather_app/models/enums/weather_conditions.dart';
import 'package:intl/intl.dart';

WeatherCondition mapStringToCondition(String input) {
  switch (input.toLowerCase()) {
    case 'clear':
      return WeatherCondition.clear;
    case 'clouds':
      return WeatherCondition.cloudy;
    case 'drizzle':
      return WeatherCondition.drizzle;
    case 'rain':
      return WeatherCondition.rain;
    case 'thunderstorm':
      return WeatherCondition.thunderstorm;
    case 'snow':
      return WeatherCondition.snow;
    case 'mist':
    case 'fog':
    case 'haze':
    case 'smoke':
    case 'dust':
    case 'sand':
    case 'ash':
      return WeatherCondition.fog;
    default:
      return WeatherCondition.unknown;
  }
}


IconData getWeatherIcon(WeatherCondition condition) {
  switch (condition) {
    case WeatherCondition.clear:
      return Icons.wb_sunny;
    case WeatherCondition.cloudy:
      return Icons.cloud;
    case WeatherCondition.partlyCloudy:
      return Icons.cloud_queue;
    case WeatherCondition.fog:
      return Icons.blur_on;
    case WeatherCondition.rain:
      return Icons.grain;
    case WeatherCondition.thunderstorm:
      return Icons.flash_on;
    case WeatherCondition.snow:
      return Icons.ac_unit;
    case WeatherCondition.drizzle:
      return Icons.grain;
    default:
      return Icons.help_outline;
  }
}

String formatTemperature(double temp) {
  final formatter = NumberFormat("##0"); // 0 or 1 decimal
  return "${formatter.format(temp)}°";
}

String getFormattedHour(DateTime date) {
  String formattedDate = DateFormat('h a').format(date);
  return formattedDate;
}

String getFormattedNow() {
  String formattedDate = DateFormat('EEEE, MMM d').format(DateTime.now());
  return formattedDate;
}