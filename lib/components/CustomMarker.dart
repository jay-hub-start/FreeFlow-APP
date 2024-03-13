import 'package:flutter/material.dart';
import "package:flutter_svg/flutter_svg.dart";
import 'package:latlong2/latlong.dart';
import "package:freeflow/controller/location_controller.dart";
import "../services/MapServices.dart";

final mapServices = MapServices();

Widget CustomMarker({
  required pathToAsset,
  required label,
  required LatLng markerLocation,
  required LocationController locationController,
  required Function(List<LatLng>) onPolylineUpdate,
  required GlobalKey<ScaffoldState> scaffoldKey,
}) {
  return GestureDetector(
    onTap: () {
      _handleMarkerTap(locationController, markerLocation, onPolylineUpdate);
    },
    child: SvgPicture.asset(
      pathToAsset,
      semanticsLabel: label,
    ),
  );
}

void _handleMarkerTap(
  LocationController locationController,
  LatLng markerLocation,
  Function(List<LatLng>) onPolylineUpdate,
) async {
  final newPolylines =
      await mapServices.navigateToMarker(locationController, markerLocation);
  onPolylineUpdate(newPolylines);
}
