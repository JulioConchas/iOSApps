import 'package:geolocator/geolocator.dart';

class Location {

  Future<Position> getCurrentLocation() async
  {
    LocationPermission permission;

    permission = await Geolocator.requestPermission();
    if ( permission == LocationPermission.deniedForever)
    {
      throw 'Permission for location were denied!';
    }
    else
    {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      return position;
    }
  }
  Future<String> getLat() async
  {
    Position position  = await getCurrentLocation();
    return position.latitude.toStringAsFixed(2);
  }
  Future<String> getLon() async
  {
    Position position  = await getCurrentLocation();
    return position.longitude.toStringAsFixed(2);
  }
}