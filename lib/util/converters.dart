import 'package:flutter/material.dart';
import 'package:geem/model/current_weather.dart';
import 'package:geem/model/hourly_forecast.dart';

import 'package:geem/ui/icons/geem_icons_icons.dart';
import 'package:geem/ui/widgets/weather_scenes/clear_sky.dart';
import 'package:geem/ui/widgets/weather_scenes/cloudy.dart';
import 'package:geem/ui/widgets/weather_scenes/rainy.dart';
import 'package:geem/ui/widgets/weather_scenes/thunder_storm.dart';
import 'package:geem/util/colors.dart';
import 'package:intl/intl.dart';
import 'package:geocoding/geocoding.dart';
import 'package:overlay_support/overlay_support.dart';

CurrentWeather? currentWeather;

HourlyForecast? hourlyForecasts;

String convertMinute(String datetime) {
  final DateTime dateTime = DateTime.parse(datetime);
  final String dateTime12hoursFormat = DateFormat("h a ").format(dateTime);
  return dateTime12hoursFormat;
}

Future showNotificaton(String text) async {
  // snackbar to show error message
  showSimpleNotification(
    Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
    elevation: 0,
    background: geemBlackBlue,
    duration: const Duration(seconds: 4),
    slideDismissDirection: DismissDirection.horizontal,
  );
}

Future<String> getCityName(latitude, longitude) async {
  List<Placemark> placemarks =
      await placemarkFromCoordinates(latitude, longitude);
  Placemark firstResult = placemarks.first;
  return firstResult.locality.toString();
}

String convertTime(String datetime) {
  final DateTime dateTime = DateTime.parse(datetime);
  final String dateTime12hoursFormat =
      DateFormat("EEE, hh:mm a").format(dateTime);
  return dateTime12hoursFormat;
}

Widget checkWeatherImage(String icon) {
  switch (icon) {
    // cloudy weathers start here
    case "01d":
      {
        return const Sun();
      }
    case "01n":
      {
        return const MoonCloud();
      }
    case "02d":
      {
        return const CloudSun();
      }
    case "02n":
      {
        return const MoonCloud();
      }
    case "03d":
      {
        return const Cloud(height: 160);
      }
    case "03n":
      {
        return const MoonCloud();
      }
    case "04d":
      {
        return const Cloud(height: 160);
      }
    case "04n":
      {
        return const MoonCloud();
      }
    case "09d":
      {
        return const RainCloud();
      }
    case "09n":
      {
        return const RainCloud();
      }
    case "10d":
      {
        return const RainCloud();
      }
    case "10n":
      {
        return const RainCloud();
      }
    case "11d":
      {
        return const Thunder(height: 160);
      }
    case "11n":
      {
        return const ThunderCloud(height: 160);
      }
    case "13d":
      {
        return const Cloud(height: 160);
      }
    case "13n":
      {
        return const Cloud(height: 160);
      }
    case "50d":
      {
        return const Cloud(height: 160);
      }
    case "50n":
      {
        return const MoonCloud();
      }

    default:
      {
        return const Cloud(height: 160);
      }
  }
}

IconData checkWeatherIcon(String icon) {
  switch (icon) {
    // cloudy weathers start here
    case "01d":
      {
        return GeemIcons.cloud;
      }
    case "01n":
      {
        return GeemIcons.cloud_moon;
      }
    case "02d":
      {
        return GeemIcons.cloudy_sun;
      }
    case "02n":
      {
        return GeemIcons.cloud_moon;
      }
    case "03d":
      {
        return GeemIcons.cloud;
      }
    case "03n":
      {
        return GeemIcons.cloud_moon;
      }
    case "04d":
      {
        return GeemIcons.cloud_1;
      }
    case "04n":
      {
        return GeemIcons.cloud_moon;
      }
    case "09d":
      {
        return GeemIcons.cloud_rain;
      }
    case "09n":
      {
        return GeemIcons.cloud_moon_rain;
      }
    case "10d":
      {
        return GeemIcons.rain;
      }
    case "10n":
      {
        return GeemIcons.cloud_moon_rain;
      }
    case "11d":
      {
        return GeemIcons.cloud_flash;
      }
    case "11n":
      {
        return GeemIcons.cloud_flash;
      }
    case "13d":
      {
        return GeemIcons.cloud;
      }
    case "13n":
      {
        return GeemIcons.cloud;
      }
    case "50d":
      {
        return GeemIcons.cloud;
      }
    case "50n":
      {
        return GeemIcons.cloud_moon;
      }

    default:
      {
        return GeemIcons.cloud_flash;
      }
  }
}
