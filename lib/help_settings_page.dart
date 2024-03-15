import 'package:flutter/material.dart';

class HelpSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help / Settings"),
        backgroundColor: Color.fromRGBO(228, 178, 86, 0.847),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color.fromRGBO(228, 178, 86, 0.847),
              Color.fromRGBO(198, 133, 4, 0.9445),
              Color.fromRGBO(173, 115, 1, 1),
              Color.fromRGBO(225, 161, 36, 0.94),
            ],
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.5),
                Colors.transparent,
              ],
            ),
          ),
          child: Center(
            child: Text(
              "Help / Settings Screen",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HelpSettingsPage(),
  ));
}
