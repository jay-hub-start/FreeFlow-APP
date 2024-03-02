import 'package:flutter/material.dart';
import 'package:freeflow/dbHelper/mongodb.dart';
import 'package:freeflow/screens/login_or_register.dart';
import 'screens/login_screen.dart';

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
            child: LoginOrRegisterPage(),
          ),
        ),
      ),
    );
  }
}
