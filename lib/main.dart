// File created by
// Mubarak Lawal <Geem>
// on 29/06/2022
// Flutter 3.0.5

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geem/ui/screens/home_screen.dart';
import 'package:geem/ui/screens/onboarding_screen.dart';
import 'package:geem/util/colors.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
  //   SystemUiOverlay.bottom,
  // ]);

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool("showHome") ?? false;
  runApp(GeemApp(showHome: showHome));
}

class GeemApp extends StatelessWidget {
  final bool showHome;
  const GeemApp({Key? key, required this.showHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return OverlaySupport.global(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "PulpDisplay",
          scrollbarTheme: ScrollbarThemeData(
            thickness: MaterialStateProperty.all(7),
            thumbColor: MaterialStateProperty.all(appColor),
          ),
          primaryColor: geemBlue,
        ),
        title: "Geem",
        home: showHome ? const HomeScreen() : const LiquidSwipeOnboarding(),
      ),
    );
  }
}
