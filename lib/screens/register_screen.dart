import 'dart:convert';
import 'package:flutter/material.dart';
import '../components/CustomTextField.dart';
import '../components/CustomButton.dart';
import 'package:freeflow/components/square_title.dart';
import 'package:http/http.dart' as http;
import './config.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({Key? key, required this.onTap}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController cellNumberController = TextEditingController();

  bool _isNotValidate = false;

  void signUserUp() {
    setState(() {
      _isNotValidate = false; // Reset validation flag

      if (firstNameController.text.isEmpty ||
          lastNameController.text.isEmpty ||
          emailController.text.isEmpty ||
          passwordController.text.isEmpty ||
          confirmPasswordController.text.isEmpty) {
        _isNotValidate = true; // Set validation flag if any field is empty
      } else if (passwordController.text != confirmPasswordController.text) {
        _isNotValidate = true; // Set validation flag if passwords don't match
      } else {
        // Implement sign-up logic here

        // Create object with email and password
        var regBody = {
          'email': emailController.text,
          'password': passwordController.text,
        };

        // Send HTTP POST request
        http.post(
          Uri.parse(registration),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(regBody),
        ).then((response) {
          var jsonResponse = jsonDecode(response.body);
          if (jsonResponse['status'] == 200) {
            // Successful sign-up
            debugPrint('created an account');
          } else {
            // Handle server error
            debugPrint('failed to create an account');
          }
        }).catchError((error) {
          // Handle network error
        });
      }
    });
  }

  //define the variable used for spacing
  final double spaceBetween = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter, // Adjust gradient direction
            end: Alignment.topCenter, // Adjust gradient direction
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
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'Create Account',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 36,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: spaceBetween +5),
                        CustomTextField(
                          controller: firstNameController,
                          hintText: 'First Name',
                          obscureText: false,
                          isNotValidate: _isNotValidate,
                        ),
                        SizedBox(height: spaceBetween),
                        CustomTextField(
                          controller: lastNameController,
                          hintText: 'Last Name',
                          obscureText: false,
                          isNotValidate: _isNotValidate,
                        ),
                        SizedBox(height: spaceBetween),
                        CustomTextField(
                          controller: emailController,
                          hintText: 'Email',
                          obscureText: false,
                          isNotValidate: _isNotValidate,
                        ),
                        SizedBox(height: spaceBetween),
                        CustomTextField(
                          controller: passwordController,
                          hintText: 'Password',
                          obscureText: true,
                          isNotValidate: _isNotValidate,
                        ),
                        SizedBox(height: spaceBetween),
                        CustomTextField(
                          controller: confirmPasswordController,
                          hintText: 'Confirm password',
                          obscureText: true,
                          isNotValidate: _isNotValidate,
                        ),
                        SizedBox(height: spaceBetween),
                        CustomTextField(
                          controller: cellNumberController,
                          hintText: 'Cell Number(optional)',
                          obscureText: true,
                          isNotValidate: false,
                        ),
                        SizedBox(height: spaceBetween+8),
                        CustomButton(onTap: signUserUp, text: "Sign Up"),
                        const SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Already have an account?',
                            style: TextStyle(color:Colors.white, fontSize: 15),),
                            const SizedBox(width: 5),
                            GestureDetector(
                              onTap: widget.onTap,
                              child: const Text(
                                ' Login now',
                                style: TextStyle(
                                 color: Color.fromARGB(255, 71, 48, 1),
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline, // Add underline decoration
              
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
