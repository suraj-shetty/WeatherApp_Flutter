import 'package:weather/weather.dart';
import '../models/weather_data.dart';

class WeatherService {
  final WeatherFactory _weatherFactory = WeatherFactory('043ee7850c2362dab3fba31a76a76ea3');

  Future<WeatherData> getWeather(double lat, double lon) async {
    final current = await _weatherFactory.currentWeatherByLocation(lat, lon);
    final forecast = await _weatherFactory.fiveDayForecastByLocation(lat, lon);

    final hourlyForecast = forecast.take(12).map((f) {
      return HourlyForecast(
        time: f.date ?? DateTime.now(),
        temp: f.temperature?.celsius ?? 0.0,
      );
    }).toList();

    return WeatherData(
      city: current.areaName ?? "Unknown",
      temperature: current.temperature?.celsius ?? 0.0,
      feelsLike: current.tempFeelsLike?.celsius ?? 0.0,
      humidity: current.humidity?.toDouble() ?? 0.0,
      hourly: hourlyForecast,
    );
  }
}
