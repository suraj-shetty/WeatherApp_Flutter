
import 'package:flutter/material.dart';
import 'package:weather_app/models/enums/weather_conditions.dart';
import 'package:intl/intl.dart';
import 'package:flutter_weather_bg_null_safety/utils/weather_type.dart' show WeatherType;

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
    case 'smoke':
    case 'sand':
    case 'ash':
    case 'dust':
      return WeatherCondition.dust;
    case 'haze':
      return WeatherCondition.haze;
    case 'fog':
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

WeatherType getWeatherTypeFor(WeatherCondition condition, bool isNight) {
  switch (condition) {
    case WeatherCondition.clear:
      if (isNight == true) {
        return WeatherType.sunnyNight;
      } else {
        return WeatherType.sunny;
      }

    case WeatherCondition.cloudy:
    if (isNight == true) {
        return WeatherType.cloudyNight;
      } else {
        return WeatherType.cloudy;
      }
      

    case WeatherCondition.drizzle:
      return WeatherType.lightRainy;

    case WeatherCondition.fog:
      return WeatherType.foggy;

    case WeatherCondition.partlyCloudy:
      return WeatherType.cloudy;

    case WeatherCondition.rain:
      return WeatherType.middleRainy;

    case WeatherCondition.snow:
      return WeatherType.middleSnow;

    case WeatherCondition.thunderstorm:
      return WeatherType.thunder;

    case WeatherCondition.dust:
      return WeatherType.dusty;

    case WeatherCondition.haze:
      return WeatherType.hazy;

    case WeatherCondition.unknown:
      return WeatherType.overcast;
  }
}

bool isDayTime(DateTime now, DateTime sunrise, DateTime sunset) {
  return now.isAfter(sunrise) && now.isBefore(sunset);
}

bool isDayTimeQuick(DateTime now) {
  final hour = now.hour;
  return hour >= 6 && hour < 18; // 6 AM to 5:59 PM
}