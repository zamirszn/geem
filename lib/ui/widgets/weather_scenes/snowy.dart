import 'package:flutter/material.dart';
import 'package:geem/ui/animation/grow_animation.dart';
import 'package:geem/ui/animation/move_and_bounce_animation.dart';
import 'package:geem/ui/widgets/weather_scenes/cloudy.dart';
import 'package:geem/util/colors.dart';

class SnowyWeather extends StatefulWidget {
  const SnowyWeather({Key? key}) : super(key: key);

  @override
  State<SnowyWeather> createState() => _SnowyWeatherState();
}

class _SnowyWeatherState extends State<SnowyWeather> {
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        GrowAnimation(
            milliseconds: 4000,
            child: Cloud(
              height: 170,
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
            child: Snow(
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

class Snow extends StatelessWidget {
  const Snow({Key? key, required this.height}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: const AssetImage("images/snow.png"),
      height: height,
    );
  }
}

class SnowyWeatherNight extends StatefulWidget {
  const SnowyWeatherNight({Key? key}) : super(key: key);

  @override
  State<SnowyWeatherNight> createState() => _SnowyWeatherNightState();
}

class _SnowyWeatherNightState extends State<SnowyWeatherNight> {
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
            child: Snow(
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
