import 'package:flutter/material.dart';
import 'package:geem/ui/animation/grow_animation.dart';
import 'package:geem/ui/animation/move_and_bounce_animation.dart';
import 'package:geem/ui/widgets/weather_scenes/cloudy.dart';
import 'package:geem/util/colors.dart';

class RainyWeather extends StatefulWidget {
  const RainyWeather({Key? key}) : super(key: key);

  @override
  State<RainyWeather> createState() => _RainyWeatherState();
}

class _RainyWeatherState extends State<RainyWeather> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        GrowAnimation(milliseconds: 4000, child: RainCloud()),
        MoveAndBouneAnimation(
          milliseconds: 5000,
          dx: -40,
          dy: 140,
          dx2: -20,
          dy2: 156,
          child: GrowAnimation(
            milliseconds: 1500,
            child: Cloud(
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

class RainCloud extends StatelessWidget {
  const RainCloud({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage("images/rain_cloud.png"),
      height: 170,
    );
  }
}



class RainyWeatherNight extends StatefulWidget {
  const RainyWeatherNight({Key? key}) : super(key: key);

  @override
  State<RainyWeatherNight> createState() => _RainyWeatherNightState();
}

class _RainyWeatherNightState extends State<RainyWeatherNight> {
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
        GrowAnimation(milliseconds: 4000, child: RainCloud()),
        MoveAndBouneAnimation(
          milliseconds: 5000,
          dx: -40,
          dy: 140,
          dx2: -20,
          dy2: 156,
          child: GrowAnimation(
            milliseconds: 1500,
            child: Cloud(
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
