import 'package:weather/weather.dart';
import 'package:weather_app/utils/weather_utils.dart';
import '../models/weather_data.dart';

class WeatherService {
  final WeatherFactory _weatherFactory = WeatherFactory('10f7c9534998cf3f708ab32328b4707b');

  Future<WeatherData> getWeather(double lat, double lon) async {
    final current = await _weatherFactory.currentWeatherByLocation(lat, lon);
    final forecast = await _weatherFactory.fiveDayForecastByLocation(lat, lon);

    final hourlyForecast = forecast.take(12).map((f) {
      return HourlyForecast(
        time: f.date ?? DateTime.now(),
        temp: f.temperature?.celsius ?? 0.0,
        condition: mapStringToCondition(f.weatherMain ?? "")
      );
    }).toList();

    return WeatherData(
      city: current.areaName ?? "Unknown",
      temperature: current.temperature?.celsius ?? 0.0,
      feelsLike: current.tempFeelsLike?.celsius ?? 0.0,
      humidity: current.humidity?.toDouble() ?? 0.0,
      highTemp: current.tempMax?.celsius ?? 0.0,
      lowTemp: current.tempMin?.celsius ?? 0.0,
      weatherCondition: mapStringToCondition(current.weatherMain ?? ""),
      weatherCode: current.weatherIcon ?? "",
      hourly: hourlyForecast,
    );
  }
}
