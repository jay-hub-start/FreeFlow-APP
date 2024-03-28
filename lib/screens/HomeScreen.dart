import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:latlong2/latlong.dart';
import "package:freeflow/controller/location_controller.dart";
import "package:freeflow/services/LocationService.dart";
import 'package:get/get.dart';
import "package:flutter_map_location_marker/flutter_map_location_marker.dart";
import "package:freeflow/services/ShelterService.dart";
import 'package:geocoding/geocoding.dart';
import 'dart:async';
import "package:freeflow/services/FoodBankService.dart";
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import "package:freeflow/services/MapServices.dart";

class HomeScreen extends StatefulWidget {
  final token;

  const HomeScreen({required this.token, Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String email, lat, long;
  double zoom = 15;
  double radius = 1.4; // Default radius value
  List<dynamic>? shelterData;
  late String userState; // Add userState variable
  Timer? _radiusTimer; // Timer instance variable
  late Placemark address;

  late List<LatLng> polylines = [];
  late List<LatLng> busPolylines = [];
  List listOfPoints = [];
  final mapServices = MapServices();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final LocationController locationController =
      Get.put<LocationController>(LocationController());
  List<Marker> shelterMarkers = [];

  @override
  void initState() {
    super.initState();

    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
    email = jwtDecodedToken["email"];

    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    await LocationService.instance
        .getUserLocation(controller: locationController);

    final locationData = locationController.userLocation.value;
    lat = locationData?.latitude.toString() ?? '';
    long = locationData?.longitude.toString() ?? '';
    address = await locationController.getUserAddress(lat: lat, long: long);
    updateMarkers();
  }

  void updatePolylines(List<LatLng> newPolylines) {
    setState(() {
      polylines = newPolylines;
    });
  }

  void updateBusRoutes() async {
    // busPolylines = mapServices.getBusRoute(startPoint, endPoint)
    debugPrint("open");
  }

  void updateMarkers() async {
    if (lat.isNotEmpty && long.isNotEmpty) {
      shelterData = await ShelterService.instance
          .getShelters(lat, long, 10);
      if (shelterData != null) {
        shelterMarkers.addAll(await ShelterService.instance.addMarkers(
            shelterData: shelterData,
            locationController: locationController,
            onPolylineUpdate: updatePolylines,
            scaffoldKey: scaffoldKey));
      } else {
        print('Shelter data not available');
      }
      List<dynamic> foodBankData =
          await FoodBankService.instance.getFoodBanks(address);
      shelterMarkers.addAll(await FoodBankService.instance.addMarkers(
          apiData: foodBankData,
          locationController: locationController,
          onPolylineUpdate: updatePolylines,
          scaffoldKey: scaffoldKey));
    } else {
      print('Location data not available');
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(
        () {
          return locationController.isAccessingLocation.value
              ? const Column(
                  children: [
                    CircularProgressIndicator(),
                    Text("Accessing Location")
                  ],
                )
              : locationController.errorDescription.value.isNotEmpty ||
                      locationController.userLocation.value == null
                  ? Column(
                      children: [
                        Text("${locationController.errorDescription.value}")
                      ],
                    )
                  : Stack(
                      children: [
                        FlutterMap(
                          options: MapOptions(
                            initialCenter: LatLng(
                              locationController.userLocation.value?.latitude ??
                                  0.0,
                              locationController
                                      .userLocation.value?.longitude ??
                                  0.0,
                            ),
                            initialZoom: zoom,
                            onPositionChanged: (mapPosition, isUserGesture) {
                              if (isUserGesture) {
                                // Cancel the previous timer if it's still active
                                _radiusTimer?.cancel();

                                // Update the radius variable when the user changes the visible radius
                                setState(() {
                                  lat =
                                      mapPosition.center?.latitude.toString() ??
                                          "";
                                  long = mapPosition.center?.longitude
                                          .toString() ??
                                      "";
                                  radius = mapPosition.zoom! / 10;
                                });

                                // Start a new timer to delay the printing action
                                _radiusTimer = Timer(
                                    const Duration(milliseconds: 2000), () {
                                  // Print the final radius value to the screen
                                  showSnackBar('Updating Map');
                                  print('(${lat},${long})');
                                  updateMarkers();
                                  updateBusRoutes();
                                });
                              }
                            },
                          ),
                          children: [
                            TileLayer(
                              urlTemplate:
                                  "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                              userAgentPackageName: "com.example.app",
                            ),
                            CurrentLocationLayer(),
                            MarkerLayer(
                              markers: shelterMarkers,
                            ),
                            PolylineLayer(
                              polylineCulling: false,
                              polylines: [
                                Polyline(
                                  points: polylines,
                                  color: Colors.blue,
                                  strokeWidth: 5,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    );
        },
      ),
    );
  }
}
