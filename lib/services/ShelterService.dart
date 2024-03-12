import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ShelterService {
  ShelterService._privateConstructor();

  static final ShelterService _instance = ShelterService._privateConstructor();

  static ShelterService get instance => _instance;

  Future<dynamic> getShelters(lat, long, radius) async {
   // print(lat + " long " + long +" radius" + radius);
    try {
      final response = await http.get(
        Uri.https('homeless-shelter.p.rapidapi.com', '/location', {
          'lat': lat,
          'lng': long,
          'radius': radius, // Pass the user's state as a query parameter
        }),
        headers: {
          //'X-RapidAPI-Key': '64738349f1msh935d3abdce61e3ep1c9a95jsn4d9be5d57154',
          //'X-RapidAPI-Key': 'cd87f19713mshadabbf1b366486bp14c782jsn0c12ea959853',
          //'X-RapidAPI-Key': '0496f90468msh4edfce75ca61bfap1c3ff7jsn764c57f2d2b3',
          'X-RapidAPI-Key': '8294aa49ebmshb71665748d4fe54p1eb17cjsned95e02d2517',
          'X-RapidAPI-Host': 'homeless-shelter.p.rapidapi.com',
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
