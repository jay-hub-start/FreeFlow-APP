import 'package:flutter/material.dart';

class ResourceDetailsScreen extends StatelessWidget {
  final String resourceName;
  final String description;
  final String location;
  final String contactInfo;
  final String hoursOfOperation;
  final String eligibilityCriteria;
  final String additionalRequirements;

  ResourceDetailsScreen({
    required this.resourceName,
    required this.description,
    required this.location,
    required this.contactInfo,
    required this.hoursOfOperation,
    required this.eligibilityCriteria,
    required this.additionalRequirements,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resource Details'),
        backgroundColor: Color.fromRGBO(228, 178, 86, 0.847),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(228, 178, 86, 0.847),
              Color.fromRGBO(198, 133, 4, 0.9445),
              Color.fromRGBO(173, 115, 1, 1),
              Color.fromRGBO(225, 161, 36, 0.94),
            ],
          ),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              resourceName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            buildDetailText('Description:', description),
            buildDetailText('Location:', location),
            buildDetailText('Contact Info:', contactInfo),
            buildDetailText('Hours of Operation:', hoursOfOperation),
            buildDetailText('Eligibility Criteria:', eligibilityCriteria),
            buildDetailText('Additional Requirements:', additionalRequirements),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement your action here
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color.fromRGBO(228, 178, 86, 0.847),
              ),
              child: Text('View on Map'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDetailText(String label, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ResourceDetailsScreen(
      resourceName: 'Resource Name',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum quis nulla id urna vehicula fringilla.',
      location: 'Your Location',
      contactInfo: 'contact@example.com | (123) 456-7890',
      hoursOfOperation: 'Mon - Fri: 9 AM - 5 PM',
      eligibilityCriteria: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      additionalRequirements: 'Nulla eu nisi eget dolor sagittis posuere. Duis varius mauris in eros fringilla, et molestie nunc aliquet.',
    ),
  ));
}
