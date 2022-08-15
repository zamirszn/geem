import 'package:flutter/material.dart';
import 'package:geem/ui/animation/grow_ontap_animation.dart';

import 'package:geem/util/colors.dart';
import 'package:geem/util/converters.dart';

class HourlyForeCastWidget extends StatelessWidget {
  const HourlyForeCastWidget({
    Key? key,
    required this.time,
    required this.temperature,
    required this.iconData,
  }) : super(key: key);
  final String time;
  final String temperature;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 10, bottom: 10),
      child: GrowOnTap(
        duration: const Duration(milliseconds: 300),
        onPressed: () {},
        child: SizedBox(
          height: 200,
          width: 135,
          child: Card(
            elevation: 0,
            color: Colors.white30,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(8)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  convertTime(time),
                  style: TextStyle(
                      fontSize: 15,
                    
                      fontWeight: FontWeight.normal,
                      color: geemBlack),
                ),
                Icon(
                  iconData,
                  color: Colors.white,
                  size: 50,
                ),
                Text(
                  "$temperature\u00B0",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: geemBlack),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
