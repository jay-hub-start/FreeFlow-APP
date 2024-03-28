import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:async';
import "package:freeflow/components/CustomMarker.dart";

class ShelterService {
  ShelterService._privateConstructor();

  static final ShelterService _instance = ShelterService._privateConstructor();

  static ShelterService get instance => _instance;

  Future<List<Marker>> addMarkers(
      {required shelterData,
      required,
      locationController,
      required Function(List<LatLng>) onPolylineUpdate,
      required GlobalKey<ScaffoldState> scaffoldKey}) async {
    List<Marker> shelterMarkers = shelterData!.map<Marker>((shelter) {
      
      double lat = double.parse(shelter['location'].split(',')[0]);
      double long = double.parse(shelter['location'].split(',')[1]);

      return Marker(
          key: UniqueKey(),
          point: LatLng(lat, long), // Use shelterlat and shelterlong
          width: 60,
          height: 60,
          child: CustomMarker(
              pathToAsset: 'lib/images/shelter.svg',
              label: "shelter labels",
              markerLocation: LatLng(lat, long), // Pass the marker's location
              locationController: locationController,
              onPolylineUpdate: onPolylineUpdate,
              scaffoldKey: scaffoldKey));
    }).toList();

    return shelterMarkers;
  }

  Future<dynamic> getShelters(lat, long, radius) async {
    // print(lat + " long " + long +" radius" + radius);
    try {
      final response = await http.get(
        Uri.https('homeless-shelter.p.rapidapi.com', '/location', {
          'lat': lat,
          'lng': long,
          'radius': 10, // Pass the user's state as a query parameter
        }),
        headers: {
          //'X-RapidAPI-Key': '64738349f1msh935d3abdce61e3ep1c9a95jsn4d9be5d57154',
          //'X-RapidAPI-Key': 'cd87f19713mshadabbf1b366486bp14c782jsn0c12ea959853',
          //'X-RapidAPI-Key': '0496f90468msh4edfce75ca61bfap1c3ff7jsn764c57f2d2b3',
          // 'X-RapidAPI-Key': '8294aa49ebmshb71665748d4fe54p1eb17cjsned95e02d2517',
          // 'X-RapidAPI-Host': 'homeless-shelter.p.rapidapi.com',
          'X-RapidAPI-Key': 'cb414fd23amsh303aa3fc68d771ap1c7b5ejsne1a5f30da634',
    'X-RapidAPI-Host': 'homeless-shelter.p.rapidapi.com'
        },
      );

      if (response.statusCode == 200) {
  final data = jsonDecode(response.body);

  return data;
} else {
  print('Request failed with status: ${response.statusCode}');
}

    } catch (e) {
      print('Error: $e');
    }
    return null;
  }
}
