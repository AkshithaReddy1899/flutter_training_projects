import 'package:location/location.dart';

class LocationClass {

  var latitude;
  var longitude;

  LocationClass({required this.latitude, required this.longitude});

  static LocationData? locationData;

  static getCurrentLocation () async {
    try {
      locationData = await Location.instance.getLocation();
      return locationData;
    }
    catch (e) {
      print(e);
    }
  }
}