import 'package:flutter/foundation.dart';
import 'package:geem/model/current_weather.dart';
import 'package:geem/model/hourly_forecast.dart';
import 'package:geem/network/internet_connectivity.dart';
import 'package:geem/util/api_key.dart';
import 'package:geem/util/constants.dart';
import 'package:http/http.dart' as http;

class ForeCastRequest {
// gets only the current weather by using the city name
  Future getCurrentWeather(currentWeatherUrl) async {
    try {
      final response = await http.get(Uri.parse(currentWeatherUrl));
      if (200 == response.statusCode) {
        final CurrentWeather currentWeather =
            currentWeatherFromJson(response.body);
        return currentWeather;
      } else {
        forecastError("Error connecting to server");
      }
    } catch (e) {
      forecastError("Error connecting to server");
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future getHourlyForeCast(hourlyForecastUrl) async {
    try {
      final response = await http.get(Uri.parse(hourlyForecastUrl));
      if (200 == response.statusCode) {
        final HourlyForecast hourlyforecast =
            hourForecastFromJson((response.body));
        return hourlyforecast;
      } else {
        forecastError("Error connecting to server");
      }
    } catch (e) {
      forecastError("Error connecting to server");
      if (kDebugMode) {
        print(e);
      }
    }
  }

  // gets only the current weather by using the city the users location [lat , long]
  Future<CurrentWeather?> getCurrentWeatherByLatLong(location) async {
    String currentWeatherUrlByLatLong =
        "http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric";
    try {
      final response = await http.get(Uri.parse(currentWeatherUrlByLatLong));
      if (200 == response.statusCode) {
        final CurrentWeather currentWeather =
            currentWeatherFromJson(response.body);
        return currentWeather;
      } else {
        forecastError("Error connecting to server");
      }
    } catch (e) {
      forecastError("Error getting your location's weather");
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  getHourlyForeCastByLatLong(location) async {
    String hourlyForecastUrlByLatLong =
        "http://api.openweathermap.org/data/2.5/forecast?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric&cnt=$daysCount";
    try {
      final response = await http.get(Uri.parse(hourlyForecastUrlByLatLong));
      if (200 == response.statusCode) {
        final HourlyForecast hourlyforecast =
            hourForecastFromJson((response.body));
        return hourlyforecast;
      } else {
        forecastError("Error connecting to server");
      }
    } catch (e) {
      forecastError("Error connecting to server");
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
