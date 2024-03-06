import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:latlong2/latlong.dart'; // Import the LatLng class
import "package:http/http.dart" as http;
import "dart:convert" as convert;

class Dashboard extends StatefulWidget {
  final token;
  const Dashboard({required this.token, Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late String email;
  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
    email = jwtDecodedToken["email"];
  }

  @override
  Widget build(BuildContext context) {
    final String apiKey = "ABiFHeA83XTON5zrWz2oTKuQjvLniaSB";
    final tomtomHQ = LatLng(52.376372, 4.908066);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body:Stack(
          children: [
            FlutterMap(
              options: const MapOptions(
                initialCenter: LatLng(51, -0.1289,), 
                initialZoom: 3.2), 
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                userAgentPackageName: "com.example.app",
              ),
            ],
            ),
          ],
        ),
      );
  }
}
