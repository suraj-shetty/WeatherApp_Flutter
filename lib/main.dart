import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/weather_viewmodel.dart';
import 'views/weather_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => WeatherViewModel()..loadWeather(),
      child: MaterialApp(home: WeatherScreen()),
    ),
  );
}

