import 'package:flutter/material.dart';
import 'package:weather_app/models/enums/weather_conditions.dart';

class WeatherGradients {
  static const Map<WeatherCondition, Map<String, Gradient>> gradients = {
    WeatherCondition.clear: {
      'day': LinearGradient(
        colors: [Color(0xFFA2CFFE), Color(0xFFFFF3B0)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      'night': LinearGradient(
        colors: [Color(0xFF0F2027), Color(0xFF203A43)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    },
    WeatherCondition.cloudy: {
      'day': LinearGradient(
        colors: [Color(0xFFD3DDE7), Color(0xFFE9F1F7)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      'night': LinearGradient(
        colors: [Color(0xFF2C3E50), Color(0xFF4CA1AF)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    },
    WeatherCondition.partlyCloudy: {
      'day': LinearGradient(
        colors: [Color(0xFFAEDFF7), Color(0xFFFFE9A3)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      'night': LinearGradient(
        colors: [Color(0xFF232526), Color(0xFF414345)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    },
    WeatherCondition.fog: {
      'day': LinearGradient(
        colors: [Color(0xFFDDE1E7), Color(0xFFF5F6F7)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      'night': LinearGradient(
        colors: [Color(0xFF636363), Color(0xFFA2AB58)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    },
    WeatherCondition.rain: {
      'day': LinearGradient(
        colors: [Color(0xFF92A9BD), Color(0xFFD3E5F3)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      'night': LinearGradient(
        colors: [Color(0xFF373B44), Color(0xFF4286f4)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    },
    WeatherCondition.thunderstorm: {
      'day': LinearGradient(
        colors: [Color(0xFF4A5568), Color(0xFFD1D5DB)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      'night': LinearGradient(
        colors: [Color(0xFF232526), Color(0xFF414345)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    },
    WeatherCondition.snow: {
      'day': LinearGradient(
        colors: [Color(0xFFE0F7FF), Color(0xFFF8FBFF)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      'night': LinearGradient(
        colors: [Color(0xFF1F1C2C), Color(0xFF928DAB)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    },
    WeatherCondition.drizzle: {
      'day': LinearGradient(
        colors: [Color(0xFFBCCCDC), Color(0xFFE8ECF0)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      'night': LinearGradient(
        colors: [Color(0xFF485563), Color(0xFF29323C)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    },
  };

  static Gradient? getGradient(WeatherCondition type, {bool isNight = false}) {
    return gradients[type]?[isNight ? 'night' : 'day']!;
  }
}
