import 'package:location/location.dart';

var userLocation = Location();
// enable user's location service
Future<bool> enableUserLocation() async {
  bool hasLocation = false;
  var locationServiceIsEnabled = await userLocation.serviceEnabled();

  if (locationServiceIsEnabled == true) {
    hasLocation = true;
  } else if (locationServiceIsEnabled == false) {
    locationServiceIsEnabled = await userLocation.requestService();
    if (locationServiceIsEnabled != true) {
      hasLocation = false;
    } else if (locationServiceIsEnabled == true) {
      hasLocation = true;
    }
  }

  return hasLocation;
}

Future<bool> getUserLocationPermission() async {
  // get users location permission
  bool hasLocationPermission = false;

  var locationPermissionGranted = await userLocation.hasPermission();
  if (locationPermissionGranted == PermissionStatus.granted) {
    hasLocationPermission = true;
 
  } else if (locationPermissionGranted == PermissionStatus.denied) {
    locationPermissionGranted = await userLocation.requestPermission();
    if (locationPermissionGranted != PermissionStatus.granted) {
      hasLocationPermission = false;
  
    }
    else if (locationPermissionGranted == PermissionStatus.granted){
      hasLocationPermission = true;
    }
  }
  return hasLocationPermission;
}

Future<LocationData> getUserLocation() async {
  LocationData currentLocation = await userLocation.getLocation();
  return currentLocation;
}
