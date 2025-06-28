class WeatherData {
  final String city;
  final double temperature;
  final double feelsLike;
  final double humidity;
  final List<HourlyForecast> hourly;

  WeatherData({
    required this.city,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.hourly,
  });
}

class HourlyForecast {
  final DateTime time;
  final double temp;

  HourlyForecast({required this.time, required this.temp});
}