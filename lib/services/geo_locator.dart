import 'package:geolocator/geolocator.dart';

class UserLocation {
  double? long;
  double? lat;

  UserLocation({this.long, this.lat});

  Future getUserCurrentLocation() async {
    try {
      Position userCurrentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      lat = userCurrentPosition.latitude;
      long = userCurrentPosition.longitude;
    } catch (e) {
      throw (e.toString());
    }
  }
}
