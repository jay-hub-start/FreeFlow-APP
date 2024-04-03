import 'package:get/get.dart';
import"package:location/location.dart";
import 'package:permission_handler/permission_handler.dart' as handler;
import "package:freeflow/controller/location_controller.dart";

class LocationService{
  LocationService.init();

  static LocationService instance = LocationService.init();

  final Location _location = Location();

  Future<bool> checkForServiceAvailability() async{
    bool isEnabled = await _location.serviceEnabled();

//if the location is enabled
    if(isEnabled){
      //do nothing, return true
      return Future.value(true);
    } //else request the location
    isEnabled = await  _location.requestService();
    
    if(isEnabled){
      return Future.value(true);
    }
    //if user denied, then tell the user the location is not enabeld
    return Future.value(false);
  }


  Future<bool> checkForPermission() async{
    PermissionStatus status =  await _location.hasPermission();

    //user denied access to location
    if(status == PermissionStatus.denied){
      status = await  _location.requestPermission();

      if(status == PermissionStatus.granted){

        //accesss location of the user
        return true;
      }
      return false;
    }
    if(status == PermissionStatus.deniedForever){
      Get.snackbar("Permission Needed", "We use permission to get tour location in order to give you",
      onTap: (snack){
        //allows user to enable the location settings
        handler.openAppSettings();
      })
      .show();
      return false;
    }

    return Future.value(true);
  }

  Future<void> getUserLocation({required LocationController controller}) async{
      
      controller.isAccessingLocation(true);
      if (!(await checkForServiceAvailability())){
        controller.errorDescription.value = "Service not enabled";
        controller.isAccessingLocation(false);
        return;
      }
      if(!(await checkForPermission())){
        controller.errorDescription.value = "Permission not given";
        controller.isAccessingLocation(false);
        return;
      }
      final LocationData userLocation = await _location.getLocation();
      controller.updateUserLocation(userLocation);
      controller.isAccessingLocation(false);
    }

    
}