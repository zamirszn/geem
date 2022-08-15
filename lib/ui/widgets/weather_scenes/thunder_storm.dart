import 'package:flutter/material.dart';
import 'package:geem/ui/animation/grow_animation.dart';
import 'package:geem/ui/animation/move_and_bounce_animation.dart';
import 'package:geem/ui/widgets/weather_scenes/cloudy.dart';
import 'package:geem/util/colors.dart';

class Thunder extends StatelessWidget {
  const Thunder({Key? key, required this.height}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: const AssetImage("images/thunder.png"),
      height: height,
    );
  }
}

class ThunderCloud extends StatelessWidget {
  const ThunderCloud({Key? key, required this.height}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: const AssetImage("images/thunder_cloud.png"),
      height: height,
    );
  }
}

class ThunderStorm extends StatefulWidget {
  const ThunderStorm({Key? key}) : super(key: key);

  @override
  State<ThunderStorm> createState() => _ThunderStormState();
}

class _ThunderStormState extends State<ThunderStorm> {
  @override


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        GrowAnimation(
            milliseconds: 4000,
            child: ThunderCloud(
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

class ThunderStormNight extends StatefulWidget {
  const ThunderStormNight({Key? key}) : super(key: key);

  @override
  State<ThunderStormNight> createState() => _ThunderStormNightState();
}

class _ThunderStormNightState extends State<ThunderStormNight> {
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
        GrowAnimation(
            milliseconds: 4000,
            child: ThunderCloud(
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
