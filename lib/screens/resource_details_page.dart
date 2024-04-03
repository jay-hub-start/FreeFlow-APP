import 'package:flutter/material.dart';

class ResourceDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color.fromRGBO(209, 137, 3, 0.839),
              Color.fromRGBO(255, 189, 58, 0.941),
              Color.fromRGBO(173, 115, 1, 1),
              Color.fromRGBO(225, 161, 36, 0.94),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Resource Details',
                  style: TextStyle(
                    color: Colors.black, // Changed text color to black
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Resource Name',
                        style: TextStyle(
                          color: Colors.black, // Changed text color to black
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam scelerisque leo ac commodo consectetur.',
                        style: TextStyle(
                          color: Colors.black, // Changed text color to black
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Location',
                        style: TextStyle(
                          color: Colors.black, // Changed text color to black
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '1234 Example St, City, State, ZIP',
                        style: TextStyle(
                          color: Colors.black, // Changed text color to black
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Contact Information',
                        style: TextStyle(
                          color: Colors.black, // Changed text color to black
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Phone: (123) 456-7890\nEmail: example@example.com',
                        style: TextStyle(
                          color: Colors.black, // Changed text color to black
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Hours of Operation',
                        style: TextStyle(
                          color: Colors.black, // Changed text color to black
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Monday - Friday: 9:00 AM - 5:00 PM\nSaturday - Sunday: Closed',
                        style: TextStyle(
                          color: Colors.black, // Changed text color to black
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Eligibility Criteria',
                        style: TextStyle(
                          color: Colors.black, // Changed text color to black
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam scelerisque leo ac commodo consectetur.',
                        style: TextStyle(
                          color: Colors.black, // Changed text color to black
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Additional Requirements',
                        style: TextStyle(
                          color: Colors.black, // Changed text color to black
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam scelerisque leo ac commodo consectetur.',
                        style: TextStyle(
                          color: Colors.black, // Changed text color to black
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Implement action to view the resource on the map
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Color.fromRGBO(198, 133, 4, 0.9445),
                        ),
                        child: Text('View on Map'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}