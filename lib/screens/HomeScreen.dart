
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:latlong2/latlong.dart'; // Import the LatLng class
import "package:http/http.dart" as http;
import "dart:convert" as convert;
import "package:freeflow/controller/location_controller.dart";
import "package:freeflow/services/LocationService.dart";
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  final token;

  const HomeScreen({required this.token, Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String email;
  final LocationController locationController =
      Get.put<LocationController>(LocationController());
  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
    email = jwtDecodedToken["email"];
    LocationService.instance.getUserLocation(controller: locationController);
  }

  @override
  Widget build(BuildContext context) {
    final String apiKey = "ABiFHeA83XTON5zrWz2oTKuQjvLniaSB";
    final tomtomHQ = LatLng(52.376372, 4.908066);

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
                                locationController.userLocation.value?.latitude ?? 0.0,
                                locationController.userLocation.value?.longitude ?? 0.0
                                ),
                              initialZoom: 15),
                          children: [
                            TileLayer(
                              urlTemplate:
                                  "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                              userAgentPackageName: "com.example.app",
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