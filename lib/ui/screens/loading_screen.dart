import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key, required this.deviceScreen}) : super(key: key);
  final Size deviceScreen;

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
                "lottie/cloud_loading.json",
                width: deviceScreen.width / 2,
              ),
            ),
            SizedBox(
              width: deviceScreen.width / 1.2,
              child: const Text(
                "Getting data , please wait",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
