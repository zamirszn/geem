import 'package:flutter/material.dart';
import 'package:geem/ui/animation/grow_animation.dart';
import 'package:geem/ui/animation/move_and_bounce_animation.dart';

class CloudyWeather extends StatefulWidget {
  const CloudyWeather({
    Key? key,
  }) : super(key: key);

  @override
  State<CloudyWeather> createState() => _CloudyWeatherState();
}

class _CloudyWeatherState extends State<CloudyWeather> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        GrowAnimation(milliseconds: 4000, child: CloudSun()),
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

class CloudSun extends StatelessWidget {
  const CloudSun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage("images/cloud_sun.png"),
      height: 160,
    );
  }
}

class MoonCloud extends StatelessWidget {
  const MoonCloud({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage("images/moon_cloud.png"),
      height: 190,
    );
  }
}

class Cloud extends StatelessWidget {
  const Cloud({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: const AssetImage("images/cloud.png"),
      height: height,
    );
  }
}

class CloudyWeatherNight extends StatefulWidget {
  const CloudyWeatherNight({Key? key}) : super(key: key);

  @override
  State<CloudyWeatherNight> createState() => _CloudyWeatherNightState();
}

class _CloudyWeatherNightState extends State<CloudyWeatherNight> {
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
