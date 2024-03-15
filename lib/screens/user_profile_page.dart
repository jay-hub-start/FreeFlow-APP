import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:freeflow/screens/user_profile_page.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../components/CustomTextfield.dart';
import '../components/CustomButton.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final cellNumberController = TextEditingController();

  bool _isNotValidate = false;
  late SharedPreferences prefs;

  String? get updateProfileURL => null;

  @override
  void initState() {
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  void updateProfile() {
    setState(() {
      _isNotValidate = false;

      if (usernameController.text.isEmpty ||
          passwordController.text.isEmpty ||
          nameController.text.isEmpty ||
          cellNumberController.text.isEmpty) {
        _isNotValidate = true;
      } else {
        // Implement profile update logic here

        var profileData = {
          "name": nameController.text,
          "email": usernameController.text,
          "password": passwordController.text,
          "cell_number": cellNumberController.text,
        };

        // Example of how to send data to server
        http.post(
          Uri.parse(updateProfileURL!),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(profileData),
        ).then((response) {
          var jsonResponse = jsonDecode(response.body);
          if (jsonResponse["status"] == 200) {
            // Profile updated successfully
            // Navigate to another screen or update UI accordingly
          } else {
            debugPrint("Error updating profile");
          }
        }).catchError((error) {
          debugPrint(error.toString());
        }).whenComplete(() {
          setState(() {});
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
        backgroundColor: Color.fromRGBO(228, 178, 86, 0.847), // Set the app bar color
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
                Colors.black.withOpacity(0.5), // Add opacity to black color
                Colors.transparent, // To blend with existing gradient
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircleAvatar(
                // Display user's picture
                radius: 50,
                // Add your picture logic here
              ),
              SizedBox(height: 20),
              CustomTextField(
                controller: nameController,
                hintText: "Name",
                obscureText: false,
                isNotValidate: _isNotValidate,
              ),
              SizedBox(height: 10),
              CustomTextField(
                controller: usernameController,
                hintText: "Email",
                obscureText: false,
                isNotValidate: _isNotValidate,
              ),
              SizedBox(height: 10),
              CustomTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
                isNotValidate: _isNotValidate,
              ),
              SizedBox(height: 10),
              CustomTextField(
                controller: cellNumberController,
                hintText: "Cell Number",
                obscureText: false,
                isNotValidate: _isNotValidate,
              ),
              SizedBox(height: 20),
              CustomButton(
                onTap: updateProfile,
                text: "Update Profile",
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle button press for Saved Applications
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(228, 178, 86, 0.847), // Set the button background color
                ),
                child: Text("Saved Applications"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
