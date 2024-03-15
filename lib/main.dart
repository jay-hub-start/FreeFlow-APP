import 'package:flutter/material.dart';
import 'package:freeflow/dbHelper/mongodb.dart';
import 'package:freeflow/help_settings_page.dart';
import 'package:freeflow/resource_details_page.dart';
import 'package:freeflow/screens/login_or_register.dart';
import 'package:freeflow/screens/user_profile_page.dart';
import 'screens/help_settings_page.dart';
import 'screens/resource_details_page.dart';
void main() async {
  await MongoDatabase.connect();
  runApp(const MainApp());
}


class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            child: ResourceDetailsScreen(resourceName: '', contactInfo: '', hoursOfOperation: '', description: '', location: '', eligibilityCriteria: '', additionalRequirements: '',),
          ),
        ),
      ),
    );
  }
}
