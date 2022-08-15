import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geem/model/hourly_forecast.dart';
import 'package:geem/ui/animation/grow_ontap_animation.dart';
import 'package:geem/ui/icons/geem_icons_icons.dart';
import 'package:geem/ui/widgets/cities_bottomsheet.dart';
import 'package:geem/ui/widgets/forecast_list_tile_widget.dart';
import 'package:geem/ui/widgets/forecast_card_widget.dart';
import 'package:geem/util/colors.dart';
import 'package:geem/util/constants.dart';
import 'package:geem/util/converters.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MaxMinTempScreen extends StatefulWidget {
  const MaxMinTempScreen({Key? key, this.hourlyForecasts}) : super(key: key);

  final HourlyForecast? hourlyForecasts;

  @override
  State<MaxMinTempScreen> createState() => _WeeklyForecastScreenState();
}

class _WeeklyForecastScreenState extends State<MaxMinTempScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size deviceScreen = MediaQuery.of(context).size;
    final pageController = PageController();

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: geemBlackBlue,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: geemBlackBlue,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            GeemIcons.left,
            color: Colors.white,
          ),
        ),
        title: Row(
          children: [
            GestureDetector(
              onTap: () => showCitiesBottomSheet(context, deviceScreen),
              child: ValueListenableBuilder(
                valueListenable: cityName,
                builder: (context, value, child) => SizedBox(
                  width: 80,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    ('$value'),
                    style: const TextStyle(color: Colors.white, ),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () => showCitiesBottomSheet(context, deviceScreen),
              icon: const Icon(
                GeemIcons.down_open_mini,
                size: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: deviceScreen.height,
        color: geemBlackBlue,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: deviceScreen.height / 5,
                width: deviceScreen.width * 0.95,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  physics: const BouncingScrollPhysics(),
                  controller: pageController,
                  children: [
                    WeatherDetailWidget(
                      timeAgo: widget.hourlyForecasts!.element[0].dtTxt,
                      weatherImage: GrowOnTap(
                        duration: const Duration(milliseconds: 500),
                        onPressed: () {},
                        child: checkWeatherImage(
                          widget.hourlyForecasts!.element[0].weather[0].icon,
                        ),
                      ),
                      weatherText: widget.hourlyForecasts?.element[0].weather[0]
                              .description ??
                          "",
                    ),
                    WeatherDetailWidget(
                      timeAgo: widget.hourlyForecasts!.element[1].dtTxt,
                      weatherImage: GrowOnTap(
                        duration: const Duration(milliseconds: 500),
                        onPressed: () {},
                        child: checkWeatherImage(
                          widget.hourlyForecasts!.element[1].weather[0].icon,
                        ),
                      ),
                      weatherText: widget.hourlyForecasts?.element[1].weather[0]
                              .description ??
                          "",
                    ),
                    WeatherDetailWidget(
                      timeAgo: widget.hourlyForecasts!.element[2].dtTxt,
                      weatherImage: GrowOnTap(
                        duration: const Duration(milliseconds: 500),
                        onPressed: () {},
                        child: checkWeatherImage(
                          widget.hourlyForecasts!.element[2].weather[0].icon,
                        ),
                      ),
                      weatherText: widget.hourlyForecasts?.element[2].weather[0]
                              .description ??
                          "",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SmoothPageIndicator(
                controller: pageController,
                count: 3,
                axisDirection: Axis.horizontal,
                effect: const SlideEffect(
                    spacing: 8.0,
                    radius: 4.0,
                    dotWidth: 8,
                    dotHeight: 8,
                    strokeWidth: 1.5,
                    dotColor: Colors.grey,
                    activeDotColor: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 15,
                  bottom: 15,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "This week",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: deviceScreen.height / 1.5,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 0,
                  ),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, index) => ShowUpAnimation(
                    delayStart: const Duration(seconds: 0),
                    animationDuration: const Duration(seconds: 1),
                    curve: Curves.ease,
                    direction: Direction.vertical,
                    offset: 0.5 * index,
                    child: ForecastListTileWidget(
                      time: widget.hourlyForecasts?.element[index].dtTxt
                              .toString() ??
                          "00 ",
                      maxTemp: widget
                          .hourlyForecasts!.element[index].main.tempMax
                          .round(),
                      minTemp: widget
                          .hourlyForecasts!.element[index].main.tempMin
                          .round(),
                      weatherIcon: checkWeatherIcon(widget
                          .hourlyForecasts!.element[index].weather[0].icon),
                    ),
                  ),
                  itemCount: widget.hourlyForecasts?.cnt ?? 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
