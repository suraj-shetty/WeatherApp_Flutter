import 'package:flutter/material.dart';
import '../models/weather_data.dart';
import '../services/location_service.dart';
import '../services/weather_service.dart';

class WeatherViewModel extends ChangeNotifier {
  final _locationService = LocationService();
  final _weatherService = WeatherService();

  WeatherData? _weather;
  WeatherData? get weather => _weather;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> loadWeather() async {
    _isLoading = true;
    notifyListeners();

    final loc = await _locationService.getLocation();
    if (loc != null) {
      _weather = await _weatherService.getWeather(loc.latitude!, loc.longitude!);
    }

    _isLoading = false;
    notifyListeners();
  }
}