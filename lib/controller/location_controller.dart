import 'package:get/get.dart';
import 'package:location/location.dart';

class LocationController extends GetxController{
  final RxBool isAccessingLocation = RxBool(false);

  final Rx<LocationData?> userLocation = Rx<LocationData?>(null);
  final RxString errorDescription = RxString("");


  void updateIsAccessingLocation(bool b){
    isAccessingLocation.value = b;
  }

  void updateUserLocation(LocationData data){
    userLocation.value = data;
  }
}