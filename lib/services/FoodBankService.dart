import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:async';
import "package:freeflow/components/CustomMarker.dart";
import "package:freeflow/controller/location_controller.dart";


class FoodBankService {
  FoodBankService._privateConstructor();

  static final FoodBankService _instance = FoodBankService._privateConstructor();

  static FoodBankService get instance => _instance;

Future<List<Marker>> addMarkers({required List<dynamic> apiData, required LocationController locationController, required Function(List<LatLng>) onPolylineUpdate, required GlobalKey<ScaffoldState> scaffoldKey}) async {
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
        width: 65,
        height: 65,
        child: CustomMarker(
          pathToAsset: 'lib/images/foodBank.svg',
          label: "food Bank labels",
          markerLocation: LatLng(lat, long), // Pass the marker's location
          locationController: locationController,
          onPolylineUpdate : onPolylineUpdate,
          scaffoldKey: scaffoldKey,
        ),
      ),
    );
  }

  return markers;
}

  Future<dynamic> getFoodBanks(address) async {
    final state = getStateAbbreviation(address.administrativeArea);
    try {
      final response = await http.post(
        Uri.https('www.feedingamerica.org', '/ws-api/GetOrganizationsByState', {
          'state': state,
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

String getStateAbbreviation(String stateFullName) {
  final stateAbbreviations = {
    'alabama': 'AL',
    'alaska': 'AK',
    'arizona': 'AZ',
    'arkansas': 'AR',
    'california': 'CA',
    'colorado': 'CO',
    'connecticut': 'CT',
    'delaware': 'DE',
    'florida': 'FL',
    'georgia': 'GA',
    'hawaii': 'HI',
    'idaho': 'ID',
    'illinois': 'IL',
    'indiana': 'IN',
    'iowa': 'IA',
    'kansas': 'KS',
    'kentucky': 'KY',
    'louisiana': 'LA',
    'maine': 'ME',
    'maryland': 'MD',
    'massachusetts': 'MA',
    'michigan': 'MI',
    'minnesota': 'MN',
    'mississippi': 'MS',
    'missouri': 'MO',
    'montana': 'MT',
    'nebraska': 'NE',
    'nevada': 'NV',
    'new hampshire': 'NH',
    'new jersey': 'NJ',
    'new mexico': 'NM',
    'new york': 'NY',
    'north carolina': 'NC',
    'north dakota': 'ND',
    'ohio': 'OH',
    'oklahoma': 'OK',
    'oregon': 'OR',
    'pennsylvania': 'PA',
    'rhode island': 'RI',
    'south carolina': 'SC',
    'south dakota': 'SD',
    'tennessee': 'TN',
    'texas': 'TX',
    'utah': 'UT',
    'vermont': 'VT',
    'virginia': 'VA',
    'washington': 'WA',
    'west virginia': 'WV',
    'wisconsin': 'WI',
    'wyoming': 'WY',
  };

  String stateFullNameLowerCase = stateFullName.toLowerCase();
  if (stateAbbreviations.containsKey(stateFullNameLowerCase)) {
    return stateAbbreviations[stateFullNameLowerCase]!;
  } else {
    return stateFullName.toUpperCase().substring(0, 2); // Fallback to first two characters
  }
}