import 'package:flutter/material.dart';
import 'package:geem/util/colors.dart';
import 'package:overlay_support/overlay_support.dart';

 // checkInternetStream() {
  //   checkInternetSubscription =
  //       InternetConnectionChecker().onStatusChange.listen((internetStatus) {
  //     final hasInterent_ = internetStatus == InternetConnectionStatus.connected;
  //     hasInternet = hasInterent_;

  //     // hasInternet ? getForecastByLocation() : () {} //can set state here
  //   });
  // }

// checkInternet() async {
//   hasInterent = await InternetConnectionChecker().hasConnection;

//   final Color color = hasInterent ? geemBlue : geemBlackBlue;
//   final String connection =
//       hasInterent ? "Connection is available" : "No internet connection";

//   showSimpleNotification(
//     Text(
//       connection,
//       style: TextStyle(color: color),
//     ),
//     elevation: 0,
//     background: geemLightBlue,
//     duration: const Duration(seconds: 5),
//     slideDismissDirection: DismissDirection.horizontal,
//   );
// }

Future forecastError(String errorText) async {
  // snackbar to show error message
  showSimpleNotification(
    Row(
      children: [
        const Icon(
          Icons.error_outline_outlined,
          color: Colors.red,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          errorText,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    ),
    elevation: 0,
    background: geemBlackBlue,
    duration: const Duration(seconds: 5),
    slideDismissDirection: DismissDirection.horizontal,
  );
}
