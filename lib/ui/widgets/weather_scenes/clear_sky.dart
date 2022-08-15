import 'package:flutter/material.dart';
import 'package:geem/ui/animation/grow_animation.dart';
import 'package:geem/ui/animation/move_and_bounce_animation.dart';
import 'package:geem/ui/widgets/weather_scenes/cloudy.dart';

class ClearSky extends StatefulWidget {
  const ClearSky({Key? key}) : super(key: key);

  @override
  State<ClearSky> createState() => _ClearSkyState();
}

class _ClearSkyState extends State<ClearSky> {
  

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        GrowAnimation(
          milliseconds: 2000,
          child: Sun(),
        ),
        MoveAndBouneAnimation(
          milliseconds: 5000,
          dx: -120,
          dy: -50,
          dx2: -100,
          dy2: -40,
          child: GrowAnimation(
            milliseconds: 1500,
            child: Butterfly(height: 120),
          ),
        ),
        MoveAndBouneAnimation(
          milliseconds: 7000,
          dx: 220,
          dy: 60,
          dx2: 180,
          dy2: 80,
          child: GrowAnimation(
            milliseconds: 1000,
            child: Butterfly2(),
          ),
        ),
      ],
    );
  }
}

class Sun extends StatelessWidget {
  const Sun({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage("images/sun.png"),
      height: 160,
    );
  }
}

class Butterfly2 extends StatelessWidget {
  const Butterfly2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(10),
      child: const Image(
        image: AssetImage("images/butterfly.png"),
        height: 90,
      ),
    );
  }
}

class Butterfly extends StatelessWidget {
  const Butterfly({Key? key, required this.height}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: const AssetImage("images/butterfly.png"),
      height: height,
    );
  }
}

class Star extends StatelessWidget {
  const Star({Key? key, required this.height}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: const AssetImage("images/star1.png"),
      height: height,
    );
  }
}

class ClearSkyNight extends StatefulWidget {
  const ClearSkyNight({Key? key}) : super(key: key);

  @override
  State<ClearSkyNight> createState() => _ClearSkyNightState();
}

class _ClearSkyNightState extends State<ClearSkyNight> {
 

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        GrowAnimation(
          milliseconds: 2000,
          child: MoonCloud(),
        ),
        MoveAndBouneAnimation(
          milliseconds: 5000,
          dx: -120,
          dy: -50,
          dx2: -100,
          dy2: -40,
          child: GrowAnimation(
            milliseconds: 1500,
            child: Star(
              height: 70,
            ),
          ),
        ),
        MoveAndBouneAnimation(
          milliseconds: 7000,
          dx: 220,
          dy: 60,
          dx2: 180,
          dy2: 80,
          child: GrowAnimation(
            milliseconds: 1000,
            child: Star(
              height: 60,
            ),
          ),
        ),
      ],
    );
  }
}
