import 'package:flutter/material.dart';
import 'package:geem/ui/animation/grow_animation.dart';
import 'package:geem/ui/animation/move_and_bounce_animation.dart';
import 'package:geem/ui/widgets/weather_scenes/cloudy.dart';
import 'package:geem/ui/widgets/weather_scenes/snowy.dart';
import 'package:geem/util/colors.dart';

class MistyWeather extends StatefulWidget {
  const MistyWeather({Key? key}) : super(key: key);

  @override
  State<MistyWeather> createState() => _MistyWeatherState();
}

class _MistyWeatherState extends State<MistyWeather> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        GrowAnimation(
            milliseconds: 4000,
            child: Snow(
              height: 160,
            )),
        MoveAndBouneAnimation(
          milliseconds: 5000,
          dx: -40,
          dy: 140,
          dx2: -20,
          dy2: 156,
          child: GrowAnimation(
            milliseconds: 1500,
            child: Snow(
              height: 60,
            ),
          ),
        ),
        // down cloud
        MoveAndBouneAnimation(
          milliseconds: 7000,
          dx: 220,
          dy: 130,
          dx2: 180,
          dy2: 150,
          child: GrowAnimation(
            milliseconds: 2500,
            child: Cloud(
              height: 70,
            ),
          ),
        ),
        // up cloud
        MoveAndBouneAnimation(
          milliseconds: 9000,
          dx: -70,
          dy: -20,
          dx2: -130,
          dy2: 10,
          child: Cloud(
            height: 80,
          ),
        ),
      ],
    );
  }
}

class MistyWeatherNight extends StatefulWidget {
  const MistyWeatherNight({Key? key}) : super(key: key);

  @override
  State<MistyWeatherNight> createState() => _MistyWeatherNightState();
}

class _MistyWeatherNightState extends State<MistyWeatherNight> {
  @override
  void initState() {
    setState(() {
      setNightColor();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        GrowAnimation(milliseconds: 4000, child: MoonCloud()),
        MoveAndBouneAnimation(
          milliseconds: 5000,
          dx: -40,
          dy: 140,
          dx2: -20,
          dy2: 156,
          child: GrowAnimation(
            milliseconds: 1500,
            child: Snow(
              height: 60,
            ),
          ),
        ),
        // down cloud
        MoveAndBouneAnimation(
          milliseconds: 7000,
          dx: 220,
          dy: 130,
          dx2: 180,
          dy2: 150,
          child: GrowAnimation(
            milliseconds: 2500,
            child: Cloud(
              height: 70,
            ),
          ),
        ),
        // up cloud
        MoveAndBouneAnimation(
          milliseconds: 9000,
          dx: -70,
          dy: -20,
          dx2: -130,
          dy2: 10,
          child: Snow(
            height: 80,
          ),
        ),
      ],
    );
  }
}
