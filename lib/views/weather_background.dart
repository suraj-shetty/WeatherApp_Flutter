
import 'package:flutter/material.dart';
import 'package:weather_app/models/enums/weather_conditions.dart';
import 'package:weather_app/utils/weather_utils.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';

class WeatherBackground extends StatelessWidget {
  final WeatherCondition condition;
  final bool isNight;
  const WeatherBackground({super.key, required this.condition, required this.isNight});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return WeatherBg(
            weatherType: getWeatherTypeFor(condition, isNight),
            width: constraints.maxWidth,
            height: constraints.maxHeight,
          );
        },
      ),
    );
  }
}