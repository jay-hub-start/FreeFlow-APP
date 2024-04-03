# freeflow

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## notes
we have added
dependencies:
  flutter:
    sdk: flutter
  http:
  shared_preferences:
  jwt_decoder:
  flutter_map: ^6.1.0
  latlong2: ^0.9.0

added these to the androidmanifest.xml file under android
<!-- Always include this permission -->
  <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />

  <!-- Include only if your app benefits from precise location access. -->
  <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />

  added to the ios
  info.plist under the ios folder
  	<key>NSLocationWhenInUseUsageDescription</key>
	<string>We need this permission to provide service to users</string>

  add these dependency
    location: ^5.0.3
  permission_handler: ^11.3.0

  now I am working on adding location permission to the app so we may request the users gps coordinates and base the app off of that location on login

  later in the story we will need to allow anonymous login
