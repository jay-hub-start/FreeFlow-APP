import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HelpScreen(),
    );
  }
}

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
        backgroundColor: Color.fromRGBO(198, 133, 4, 0.9445),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'How can we help you?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              HelpOption(
                title: 'Account Issues',
                gradientColors: [
                  Color.fromRGBO(228, 178, 86, 0.847),
                  Color.fromRGBO(198, 133, 4, 0.9445),
                ],
                response:
                    'To resolve account issues, please contact our support team.',
              ),
              HelpOption(
                title: 'Privacy Concerns',
                gradientColors: [
                  Color.fromRGBO(173, 115, 1, 1),
                  Color.fromRGBO(198, 133, 4, 0.9445),
                ],
                response:
                    'Your privacy is important to us. Please review our privacy policy or contact support for assistance.',
              ),
              HelpOption(
                title: 'Technical Support',
                gradientColors: [
                  Color.fromRGBO(225, 161, 36, 0.94),
                  Color.fromRGBO(198, 133, 4, 0.9445),
                ],
                response:
                    'For technical support, please check our knowledge base or contact our technical support team.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HelpOption extends StatelessWidget {
  final String title;
  final List<Color> gradientColors;
  final String response;

  const HelpOption(
      {Key? key,
      required this.title,
      required this.gradientColors,
      required this.response})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Text(
            response,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
