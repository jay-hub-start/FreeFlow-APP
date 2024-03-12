import 'package:flutter/material.dart';
import "package:flutter_svg/flutter_svg.dart";

Widget CustomMarker({required pathToAsset, required label}){
      final Widget svg = SvgPicture.asset(
        pathToAsset,
        semanticsLabel: label);
  return svg;
}

