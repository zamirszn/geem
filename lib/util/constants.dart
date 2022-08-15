import 'package:flutter/material.dart';
import 'package:geem/util/api_key.dart';

final ValueNotifier<String> cityName = ValueNotifier<String>("Location");
const int daysCount = 10;
String currentWeatherUrl =
    "https://api.openweathermap.org/data/2.5/weather?q=${cityName.value}&appid=$apiKey&units=metric";
String hourlyForecastUrl =
    "https://api.openweathermap.org/data/2.5/forecast?q=${cityName.value}&appid=$apiKey&units=metric&cnt=$daysCount";
