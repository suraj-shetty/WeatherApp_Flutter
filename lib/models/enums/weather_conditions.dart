enum WeatherCondition {
  clear,
  cloudy,
  partlyCloudy,
  fog,
  rain,
  thunderstorm,
  snow,
  drizzle,
  unknown,
}

extension WeatherTypeExtension on WeatherCondition {
  String get displayName {
    // Use `.name` if Dart 3+, or fallback to toString().split('.').last
    final raw = name; // or: toString().split('.').last for Dart <3

    return raw
        .replaceAllMapped(RegExp(r'([a-z])([A-Z])'), (match) => '${match[1]} ${match[2]}') // split camelCase
        .replaceFirstMapped(RegExp(r'^[a-z]'), (match) => match.group(0)!.toUpperCase()); // capitalize first letter
  }
}
