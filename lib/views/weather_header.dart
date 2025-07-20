import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/enums/weather_conditions.dart';
import 'package:weather_app/utils/weather_utils.dart';
import 'package:weather_app/viewmodels/weather_viewmodel.dart';

class WeatherHeader extends StatelessWidget {
  const WeatherHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<WeatherViewModel>(context);
    final weather = vm.weather;
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            weather!.city,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 4),

          Text(
            getFormattedNow(),
            style: TextStyle(
              color: Colors.grey[850],
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),

          SizedBox(height: 10),

          Icon(
            getWeatherIcon(weather.weatherCondition),
            size: 100,
            color: Colors.amber,
          ),

          Text(
            formatTemperature(weather.temperature),
            style: TextStyle(
              fontSize: 64,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            weather.weatherCondition.displayName,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: 16),

          Text(
            "H: ${formatTemperature(weather.highTemp)}  L: ${formatTemperature(weather.lowTemp)}",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
