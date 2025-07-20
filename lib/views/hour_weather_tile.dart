import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_data.dart';
import 'package:weather_app/utils/weather_utils.dart';

class HourWeatherTile extends StatelessWidget {
  final HourlyForecast forecast;

  const HourWeatherTile({super.key, required this.forecast});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,      
      // height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withValues(alpha: 0.9),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          spacing: 12,
          children: [
            Text(
              getFormattedHour(forecast.time),
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),

            Icon(
              getWeatherIcon(forecast.condition),
              size: 36,
              // color: Colors.amber,
            ),

            Text(
              formatTemperature(forecast.temp),
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
