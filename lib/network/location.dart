import 'package:location/location.dart';

var userLocation = Location();
// enable user's location service
Future enableUserLocation() async {
  var locationServiceIsEnabled = await userLocation.serviceEnabled();
  if (!locationServiceIsEnabled) {
    locationServiceIsEnabled = await userLocation.requestService();
    if (!locationServiceIsEnabled) {
      return;
    }
  }
}

Future getUserLocationPermission() async {
  // get users location permission
  var locationPermissionGranted = await userLocation.hasPermission();
  if (locationPermissionGranted == PermissionStatus.denied) {
    locationPermissionGranted = await userLocation.requestPermission();
    if (locationPermissionGranted != PermissionStatus.granted) {
      return;
    }
  }
}

Future<LocationData> getUserLocation() async {
  LocationData currentLocation = await userLocation.getLocation();
  return currentLocation;
}
