import 'package:flutter/material.dart';
import 'package:freeflow/screens/login_or_register.dart';

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
            child: LoginOrRegisterPage(),
          ),
        ),
      ),
    );
  }
}
