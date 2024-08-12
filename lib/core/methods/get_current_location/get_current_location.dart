import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../app_functions/app_functions.dart';

class GetCurrentLocation {
  Future<bool> checkPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location service is enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    // Check the location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    // Location service is enabled and permission is granted
    return true;
  }

  Future<Position> getCurrentPosition() async {
    bool hasPermission = await checkPermission();
    if (hasPermission) {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } else {
      Geolocator.openAppSettings();
      return Future.error('Permission Denied');
    }
  }

  Future<String> getAddressFromCoordinates(
      double latitude, double longitude, String locale) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
        localeIdentifier: locale,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        String address = AppFunctions.removeSubstrings(
            ' ${place.administrativeArea},${place.country}');
        return address;
      } else {
        return 'Address not found';
      }
    } catch (e) {
      print("Error: $e");
      return 'Error getting address';
    }
  }
}
