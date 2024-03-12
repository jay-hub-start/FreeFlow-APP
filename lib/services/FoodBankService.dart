import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:async';
import "package:freeflow/components/CustomMarker.dart";

class FoodBankService {
  FoodBankService._privateConstructor();

  static final FoodBankService _instance = FoodBankService._privateConstructor();

  static FoodBankService get instance => _instance;

Future<List<Marker>> addMarkers({required List<dynamic> apiData}) async {
  List<Marker> markers = [];

  for (var orgData in apiData) {
    Map<String, dynamic> org = orgData;
    Map<String, dynamic> address = org['MailAddress'];

    double lat = address['Latitude'];
    double long = address['Longitude'];

    markers.add(
      Marker(
        key: UniqueKey(),
        point: LatLng(lat, long),
        width: 60,
        height: 60,
        child: CustomMarker(pathToAsset: 'lib/images/shelter.svg', label: "shelter labels"),
      ),
    );
  }

  return markers;
}



  Future<dynamic> getFoodBanks(address) async {
    try {
      final response = await http.post(
        Uri.https('www.feedingamerica.org', '/ws-api/GetOrganizationsByState', {
          'state': 'AL',
          'orgFields': 'OrganizationID,MailAddress',
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["Organization"];
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }
}

