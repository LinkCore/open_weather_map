import 'package:geolocator/geolocator.dart';

import '../../common/app_text.dart';

class GeolocationProvider {
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error(AppText.locationServicesAreDisabled);
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return throw Exception();
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(AppText.locationPermissionsArePermanentlyDenied);
    }

    return await Geolocator.getCurrentPosition();
  }
}
