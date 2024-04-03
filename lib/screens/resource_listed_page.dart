import 'package:flutter/material.dart';

void main() {
  runApp(AsaShelterApp());
}

class AsaShelterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Asa\'s Shelter'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '1234 Storm Drive',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'Huntsville AL, 35805',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 16.0),
              Text(
                '3.9 Miles',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  // Handle view route button press
                },
                child: Text('View Route'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Handle more info button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                child: Text('More Info'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}