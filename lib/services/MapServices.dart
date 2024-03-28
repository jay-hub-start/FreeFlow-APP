import 'dart:convert';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import "package:freeflow/controller/location_controller.dart";

class MapServices {
  String baseUrl = "https://api.openrouteservice.org/v2/directions/driving-car";
  String apiKey = "5b3ce3597851110001cf624814d54de343304006aec9160f7b661416";

  List<LatLng> polylines = [];
  List listOfPoints = [];

  Future<http.Response> getRouteUrl(
      {required String startPoint, required String endPoint}) async {
    String uri = '$baseUrl?api_key=$apiKey&start=$startPoint&end=$endPoint';
    return http.get(Uri.parse(uri));
  }

  Future<List<LatLng>> navigateToMarker(
      LocationController locationController, LatLng markerLocation) async {
    //https://api.openrouteservice.org/v2/directions/driving-car?api_key=5b3ce3597851110001cf624814d54de343304006aec9160f7b661416&start=34.7862631,-86.5847943&end=34.723507,-86.596464
    //https://api.openrouteservice.org/v2/directions/driving-car?api_key=5b3ce3597851110001cf624814d54de343304006aec9160f7b661416&start=8.681495,49.41461&end=8.687872,49.420318
    String startPoint =
        '${locationController.userLocation.value?.longitude},${locationController.userLocation.value?.latitude}';
    String endPoint = '${markerLocation.longitude},${markerLocation.latitude}';
    return await getRouteBetweenPoints(startPoint, endPoint);
  }

  Future<List<LatLng>> getRouteBetweenPoints(startPoint, endPoint) async {
    var response =
        await getRouteUrl(startPoint: startPoint, endPoint: endPoint);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      listOfPoints = data["features"][0]["geometry"]["coordinates"];
      return listOfPoints
          .map((e) => LatLng(e[1].toDouble(), e[0].toDouble()))
          .toList();
    }
    return []; // Return an empty list if the request fails
  }
}
