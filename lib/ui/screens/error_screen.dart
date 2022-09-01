import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    Key? key,
    required this.deviceScreen,
    required this.onPressed,
  }) : super(key: key);

  final Size deviceScreen;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Lottie.asset(
                animate: true,
                "lottie/cloud_attention.json",
                width: deviceScreen.width / 2,
              ),
            ),
            SizedBox(
              width: deviceScreen.width / 1.2,
              child: const Text(
                "Please make sure you have location & internet service enabled",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            TextButton.icon(
                icon: const Icon(
                  Icons.refresh_outlined,
                  color: Colors.black,
                ),
                onPressed: () {
                  onPressed();
                },
                label: const Text(
                  "Retry",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
