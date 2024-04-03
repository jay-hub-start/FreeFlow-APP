import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart';

class LocationController extends GetxController{
  final RxBool isAccessingLocation = RxBool(false);

  final Rx<LocationData?> userLocation = Rx<LocationData?>(null);
  final RxString errorDescription = RxString("");

  Future<dynamic> getUserAddress({required lat, required long}) async{
    if (lat == null || long == null) return "";

    List<Placemark> placemarks = await placemarkFromCoordinates(double.parse(lat),double.parse(long));
    
  //   Placemark placeMark  = newPlace[0]; 
  // String name = placeMark.name;
  // String subLocality = placeMark.subLocality;
  // String locality = placeMark.locality;
  // String administrativeArea = placeMark.administrativeArea;
  // String postalCode = placeMark.postalCode;
  // String country = placeMark.country;
    return placemarks[0];
    }

  void updateIsAccessingLocation(bool b){
    isAccessingLocation.value = b;
  }

  void updateUserLocation(LocationData data){
    userLocation.value = data;
  }
}