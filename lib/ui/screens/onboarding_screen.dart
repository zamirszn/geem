import 'package:flutter/material.dart';
import 'package:geem/ui/screens/home_screen.dart';
import 'package:geem/ui/widgets/liquid_swipe/liquid_swipe_card.dart';
import 'package:geem/ui/widgets/liquid_swipe/liquid_swipe_view.dart';
import 'package:geem/util/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LiquidSwipeOnboarding extends StatefulWidget {
  const LiquidSwipeOnboarding({Key? key}) : super(key: key);

  @override
  State<LiquidSwipeOnboarding> createState() => _LiquidSwipeOnboardingState();
}

class _LiquidSwipeOnboardingState extends State<LiquidSwipeOnboarding> {
  final _key = GlobalKey<LiquidSwipeState>();

  LiquidSwipeState? get liquidSwipeController => _key.currentState;

  bool isLastPage = false;
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
        key: _key,
        children: [
          /// First page
          LiquidSwipeCard(
            onTapName: () {},
            onSkip: () async {
              final navigator = Navigator.of(context);
              final prefs = await SharedPreferences.getInstance();
              prefs.setBool("showHome", true);
              navigator.pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
            name: "Geem",
            action: "Skip",
            image: const AssetImage("images/geem_logo.png"),
            title: "Get Precise",
            subtitle: "Weather Forecasts",
            body: "Best solution to get live and accurate forecasts \n"
                "in your city ",
            buttonColor: geemBlackBlue,
            titleColor: Colors.grey.shade700,
            subtitleColor: Colors.grey.shade900,
            bodyColor: geemBlackBlue,
            gradient: const LinearGradient(
              colors: [Colors.white, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),

          /// Second page
          LiquidSwipeCard(
            onTapName: () => liquidSwipeController?.previous(),
            onSkip: () async {
              final navigator = Navigator.of(context);
              final prefs = await SharedPreferences.getInstance();
              prefs.setBool("showHome", true);

              navigator.pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
            name: "Back",
            action: "Done",
            image: const AssetImage("images/cloud_sun.png"),
            title: "For",
            subtitle: "Outdoorsies",
            body: "Never miss an important event \n"
                "due to a heavy down pour or\n"
                "a stormy weather",
            buttonColor: Colors.white,
            titleColor: Colors.grey.shade500,
            subtitleColor: Colors.grey.shade200,
            bodyColor: Colors.white.withOpacity(0.8),
            gradient: LinearGradient(
              colors: [geemSkyBlue2, geemBlackBlue],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ],
      ),
    );
  }
}
