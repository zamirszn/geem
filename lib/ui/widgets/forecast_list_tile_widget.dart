import 'package:flutter/material.dart';
import 'package:geem/util/converters.dart';

class ForecastListTileWidget extends StatelessWidget {
  const ForecastListTileWidget(
      {Key? key,
      required this.time,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherIcon})
      : super(key: key);
  final String time;
  final int minTemp;
  final int maxTemp;
  final IconData weatherIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            convertTime(time),
            style: const TextStyle(
                fontSize: 17, color: Colors.white70, ),
          ),
          Row(
            children: [
              Text(
                "$maxTemp\u00B0",
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                "$minTemp\u00B0",
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.white30,
                ),
              ),
            ],
          ),
          Icon(
            weatherIcon,
            size: 20,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
