import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geem/network/internet_connectivity.dart';
import 'package:geem/network/location.dart';
import 'package:geem/services/forecast_requests.dart';
import 'package:geem/ui/animation/grow_ontap_animation.dart';
import 'package:geem/ui/icons/geem_icons_icons.dart';
import 'package:geem/ui/screens/error_screen.dart';
import 'package:geem/ui/screens/loading_screen.dart';
import 'package:geem/ui/screens/max_min_temp_forecast_screen.dart';
import 'package:geem/ui/widgets/colour_container.dart';
import 'package:geem/ui/widgets/daily_forecast_widget.dart';
import 'package:geem/ui/widgets/cities_bottomsheet.dart';
import 'package:geem/ui/widgets/weather_scenes/cloudy.dart';
import 'package:geem/ui/widgets/weather_scenes/mist.dart';
import 'package:geem/ui/widgets/weather_scenes/rainy.dart';
import 'package:geem/ui/widgets/weather_scenes/clear_sky.dart';
import 'package:geem/ui/widgets/weather_scenes/snowy.dart';
import 'package:geem/ui/widgets/weather_scenes/thunder_storm.dart';
import 'package:geem/util/constants.dart';
import 'package:geem/util/colors.dart';
import 'package:geem/util/converters.dart';
import 'package:location/location.dart';
import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:show_up_animation/show_up_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Color appColor_;
  late List<Color> appGradientColor_;
  bool isLoadingData = true;
  bool hasUserLocationData = false;
  bool hasLocationPermission = false;

  @override
  void initState() {
    super.initState();
    checkLocationPermission();
  }

  checkLocationPermission() {
    Future<bool> getPermission = getUserLocationPermission();
    getPermission.then((value) {
      hasLocationPermission = value;
      if (hasLocationPermission == true) {
        checkLocation();
      } else {
        hasUserLocationData = false;
      }
    });
  }

  checkLocation() {
    Future<bool> getLocation = enableUserLocation();
    getLocation.then((value) {
      hasUserLocationData = value;
      if (hasUserLocationData == true) {
        setState(() {
          isLoadingData = true;
        });
        getForecastByLocation();
      } else {
        setState(() {
          isLoadingData = false;
        });
      }
    });
  }

  void getForecastByCityName() {
    ForeCastRequest().getCurrentWeather(currentWeatherUrl).then(
      (weather) {
        setState(() {
          currentWeather = weather;
        });
      },
    );

    ForeCastRequest().getHourlyForeCast(hourlyForecastUrl).then((
      forecasts,
    ) {
      setState(() {
        hourlyForecasts = forecasts;
      });
    });
    setState(() {});
  }

  void getForecastByLocation() async {
    LocationData location = await getUserLocation();

    ForeCastRequest().getCurrentWeatherByLatLong(location).then((weather) {
      currentWeather = weather;
      isLoadingData = false;
      setState(() {});
    });

    ForeCastRequest().getHourlyForeCastByLatLong(location).then((
      forecasts,
    ) {
      hourlyForecasts = forecasts;
      setState(() {});
    });

    cityName.value = await getCityName(location.latitude, location.longitude);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => setState(() {}),
      // dont fucking think of removing this callback except you want sleepless nights
    );
    final Size deviceScreen = MediaQuery.of(context).size;

    return hasUserLocationData == false
        ? ErrorScreen(
            deviceScreen: deviceScreen,
            onPressed: () {
              checkLocationPermission();
            })
        : isLoadingData
            ? LoadingScreen(
                deviceScreen: deviceScreen,
              )
            : Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarBrightness: Brightness.light,
                    statusBarColor: appColor,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  leading: GrowOnTap(
                    duration: const Duration(milliseconds: 500),
                    onPressed: () {
                      showNotificaton("Getting forecast for your location");
                      getForecastByLocation();
                    },
                    child: const Icon(
                      GeemIcons.location,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                  title: Row(
                    children: [
                      GestureDetector(
                        onTap: () =>
                            showCitiesBottomSheet(context, deviceScreen),
                        child: ValueListenableBuilder(
                          valueListenable: cityName,
                          builder: (context, value, child) => SizedBox(
                            width: 80,
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              ('$value'),
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () =>
                            showCitiesBottomSheet(context, deviceScreen),
                        icon: const Icon(
                          GeemIcons.down_open_mini,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        if (hourlyForecasts != null) {
                          Navigator.of(context).push(PageAnimationTransition(
                              page: MaxMinTempScreen(
                                  hourlyForecasts: hourlyForecasts),
                              pageAnimationType: BottomToTopTransition()));
                        } else {
                          forecastError("No data yet, please wait");
                        }
                      },
                      icon: const Icon(
                        GeemIcons.calendar_alt,
                        size: 20,
                        color: Colors.black,
                      ),
                    )
                  ],
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                ),
                body: ColourContainer(
                  gradientColor: appGradientColor,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 80.0,
                      ),
                      SizedBox(
                        height: deviceScreen.height / 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AnimatedSwitcher(
                            duration: const Duration(seconds: 2),
                            child: checkWeatherType(),
                          ),
                        ),
                      ),
                      GrowOnTap(
                        duration: const Duration(milliseconds: 200),
                        onPressed: () {},
                        child: SizedBox(
                          height: deviceScreen.height / 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                //current weather name
                                currentWeather?.weather[0].main ?? "",
                                style: const TextStyle(fontSize: 20),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    currentWeather?.main.temp
                                            .round()
                                            .toString() ??
                                        "0",
                                    style: const TextStyle(fontSize: 90),
                                  ),
                                  const Text(
                                    "\u00B0",
                                    style: TextStyle(fontSize: 90),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(GeemIcons.wind),
                                  const SizedBox(width: 7),
                                  Row(
                                    children: [
                                      Text(
                                        currentWeather?.wind.speed
                                                ?.round()
                                                .toString() ??
                                            "0",
                                        style: const TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                      const Text(
                                        " km/h",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 20),
                                  const Icon(GeemIcons.droplet),
                                  const SizedBox(width: 7),
                                  Row(
                                    children: [
                                      Text(
                                        currentWeather?.main.humidity
                                                .toString() ??
                                            "0",
                                        style: const TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                      const Text(
                                        " %",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                          height: deviceScreen.height / 3,
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => ShowUpAnimation(
                              delayStart: const Duration(seconds: 0),
                              animationDuration: const Duration(seconds: 2),
                              curve: Curves.bounceIn,
                              direction: Direction.vertical,
                              offset: 0.9 * index,
                              child: HourlyForeCastWidget(
                                iconData: checkWeatherIcon(hourlyForecasts!
                                    .element[index].weather[0].icon),
                                temperature: hourlyForecasts
                                        ?.element[index].main.temp
                                        .round()
                                        .toString() ??
                                    "0 ",
                                time: hourlyForecasts?.element[index].dtTxt
                                        .toString() ??
                                    "00 ",
                              ),
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 0,
                            ),
                            itemCount: hourlyForecasts?.cnt ?? 0,
                          ))
                    ],
                  ),
                ),
              );
  }

  Widget checkWeatherType() {
    String? weatherType = currentWeather?.weather[0].icon;

    switch (weatherType) {
      // cloudy weathers start here
      case "01d":
        {
          appGradientColor = sunnyColor;
          appColor = geemYellow;

          return const ClearSky();
        }
      case "01n":
        {
          setNightColor();

          return const ClearSkyNight();
        }
      case "02d":
        {
          appGradientColor = cloudyColor;
          appColor = geemBlue;

          return const CloudyWeather();
        }
      case "02n":
        {
          setNightColor();

          return const CloudyWeatherNight();
        }
      case "03d":
        {
          appGradientColor = cloudyColor;
          appColor = geemBlue;

          return const CloudyWeather();
        }
      case "03n":
        {
          setNightColor();

          return const CloudyWeatherNight();
        }
      case "04d":
        {
          appGradientColor = cloudyColor;
          appColor = geemBlue;

          return const CloudyWeather();
        }
      case "04n":
        {
          setNightColor();

          return const CloudyWeatherNight();
        }
      case "09d":
        {
          appGradientColor = rainyColor;
          appColor = geemSkyBlue2;

          return const RainyWeather();
        }
      case "09n":
        {
          setNightColor();

          return const RainyWeatherNight();
        }
      case "10d":
        {
          appGradientColor = rainyColor;
          appColor = geemSkyBlue2;

          return const RainyWeather();
        }
      case "10n":
        {
          setNightColor();

          return const RainyWeatherNight();
        }
      case "11d":
        {
          appGradientColor = rainyColor;
          appColor = geemSkyBlue2;

          return const ThunderStorm();
        }
      case "11n":
        {
          setNightColor();

          return const ThunderStormNight();
        }
      case "13d":
        {
          appGradientColor = snowyColor;
          appColor = geemSnowWhite;

          return const SnowyWeather();
        }
      case "13n":
        {
          setNightColor();

          return const SnowyWeatherNight();
        }
      case "50d":
        {
          appGradientColor = snowyColor;
          appColor = geemSnowWhite;

          return const MistyWeather();
        }
      case "50n":
        {
          setNightColor();

          return const MistyWeatherNight();
        }

      default:
        {
          return Container();
        }
    }
  }
}
