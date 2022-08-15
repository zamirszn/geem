import 'package:flutter/material.dart';
import 'package:geem/util/converters.dart';
import 'package:show_up_animation/show_up_animation.dart';

class WeatherDetailWidget extends StatelessWidget {
  const WeatherDetailWidget({
    Key? key,
    required this.weatherImage,
    required this.weatherText,
    required this.timeAgo,
  }) : super(key: key);
  final Widget weatherImage;
  final String weatherText;
  final DateTime timeAgo;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(8)),
            color: Colors.white10,
            clipBehavior: Clip.none,
            elevation: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Row(
                    children: [
                      Text(
                        "There is going to be some\n"
                        "$weatherText outside at ${convertMinute(
                          timeAgo.toString(),
                        )} ",
                        style: const TextStyle(
                            fontSize: 19, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 25,
          top: -20,
          height: 100,
          child: ShowUpAnimation(
              delayStart: const Duration(seconds: 0),
              animationDuration: const Duration(seconds: 1),
              curve: Curves.ease,
              direction: Direction.horizontal,
              offset: .8,
              child: weatherImage),
        ),
      ],
    );
  }
}
