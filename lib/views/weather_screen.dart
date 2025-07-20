import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/weather_viewmodel.dart';
import 'package:weather_app/views/weather_header.dart';
import 'hour_weather_tile.dart';
import 'package:weather_app/utils/weather_gradients.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<WeatherViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.red,
      body: vm.isLoading
          ? Center(child: CircularProgressIndicator())
          : vm.weather == null
          ? Center(child: Text("Unable to load weather"))
          : Container(
              decoration: BoxDecoration(
                gradient: WeatherGradients.getGradient(
                  vm.weather!.weatherCondition,                  
                  isNight: false,
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WeatherHeader(),

                      SizedBox(height: 30),

                      Text(
                        "12-hour Forecast:",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 140,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: vm.weather!.hourly.length,
                          itemBuilder: (context, index) {
                            final hour = vm.weather!.hourly[index];
                            return HourWeatherTile(forecast: hour);
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
