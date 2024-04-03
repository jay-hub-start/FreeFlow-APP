import 'package:flutter/material.dart';
import 'package:freeflow/help_settings_page.dart';
import 'package:freeflow/screens/Dashboard123.dart';
import 'package:freeflow/screens/login_or_register.dart';
import 'package:freeflow/resource_details_page.dart';
import 'package:freeflow/screens/resource_details_page.dart';
import 'package:freeflow/screens/resource_listed_page.dart';
import 'package:freeflow/screens/user_profile_page.dart';
void main() async {
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
            child: DashboardPage(),
          ),
        ),
      ),
    );
  }
}
