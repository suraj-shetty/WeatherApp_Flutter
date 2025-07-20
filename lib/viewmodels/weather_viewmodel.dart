import 'package:flutter/material.dart';
import '../models/weather_data.dart';
import '../services/location_service.dart';
import '../services/weather_service.dart';
import 'package:weather_app/utils/weather_utils.dart';

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

  bool isNightTime() {
    if ((_weather?.sunrise != null)&& (_weather?.sunset != null)) {
      return !isDayTime(DateTime.now(), _weather!.sunrise!, _weather!.sunset!);
    }
    return !isDayTimeQuick(DateTime.now());
  }
}