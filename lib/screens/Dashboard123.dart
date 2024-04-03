import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/user_avatar.png'), // Replace with actual user avatar
              ),
              SizedBox(height: 20),
              Text(
                'Welcome back, User!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DashboardItem(
                    title: 'Resources',
                    icon: Icons.folder,
                    onPressed: () {
                      // Navigate to Resources page
                    },
                  ),
                  DashboardItem(
                    title: 'Job Opportunities',
                    icon: Icons.work,
                    onPressed: () {
                      // Navigate to Job Opportunities page
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DashboardItem(
                    title: 'User Profile',
                    icon: Icons.person,
                    onPressed: () {
                      // Navigate to User Profile page
                    },
                  ),
                  DashboardItem(
                    title: 'Settings',
                    icon: Icons.settings,
                    onPressed: () {
                      // Navigate to Settings page
                    },
                  ),
                ],
              ),
              SizedBox(height: 40),
              Text(
                'Resources Near Me',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Placeholder(), // Replace with your widget showing nearest resources
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const DashboardItem({
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Color.fromRGBO(209, 137, 3, 0.839),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        minimumSize: Size(150, 150),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DashboardPage(),
  ));
}
