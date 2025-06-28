import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/weather_viewmodel.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<WeatherViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Weather")),
      body: vm.isLoading
          ? Center(child: CircularProgressIndicator())
          : vm.weather == null
              ? Center(child: Text("Unable to load weather"))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Location: ${vm.weather!.city}", style: TextStyle(fontSize: 18)),
                      Text("Temp: ${vm.weather!.temperature}°C"),
                      Text("Feels Like: ${vm.weather!.feelsLike}°C"),
                      Text("Humidity: ${vm.weather!.humidity}%"),
                      SizedBox(height: 20),
                      Text("12-hour Forecast:", style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          itemCount: vm.weather!.hourly.length,
                          itemBuilder: (context, index) {
                            final hour = vm.weather!.hourly[index];
                            return ListTile(
                              title: Text("${hour.time.hour}:00 - ${hour.temp}°C"),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
    );
  }
}
