import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:freeflow/screens/dashboard.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../components/CustomTextfield.dart';
import '../components/CustomButton.dart';
import 'package:freeflow/components/square_title.dart';
import './config.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});



  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isNotValidate = false;
  late SharedPreferences prefs;

  @override
  void initState(){
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async{
    prefs = await SharedPreferences.getInstance();
  }

  //sign user in method
  void signUserIn() {
    setState(() {
      _isNotValidate = false; // Reset validation flag

      if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
        _isNotValidate = true; // Set validation flag if any field is empty
      } else {
        // Implement sign-in logic here

        // Create object with email and password
        var regBody = {
          "email": usernameController.text,
          "password": passwordController.text,
        };
        debugPrint("started");
        // Send HTTP POST request
        http.post(
          Uri.parse(login),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(regBody),
        ).then((response) {
          //debugPrint(response.body); // Print response body to debug console
          var jsonResponse = jsonDecode(response.body);
          if(jsonResponse["status"]){
            var myToken = jsonResponse["token"];
            prefs.setString("token", myToken);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard(token: myToken)));
          }else{
            debugPrint("something went wrong");
          }
        }).catchError((error) {
          // Handle network error
          debugPrint(error.toString()); // Print error to debug console
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter, // Adjust gradient direction
            end: Alignment.topCenter, // Adjust gradient direction
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
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: 
                        Column(
                          children: [
                            SizedBox(height: 60),
                            Text(
                              "Welcome back you've been missed",
                             style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 32,
                                      fontWeight: FontWeight.w900,
                                    ),
                            ),
                          ],
                        ),
                        ),
                        const SizedBox(height: 25),
                        CustomTextField(
                          controller: usernameController,
                          hintText: "Email",
                          obscureText: false,
                          isNotValidate: _isNotValidate,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: passwordController,
                          hintText: "Password",
                          obscureText: true,
                          isNotValidate: _isNotValidate,
                        ),
                        const SizedBox(height: 25),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Forgot Password?",
                                style: TextStyle(color: Color.fromARGB(255, 71, 48, 1),
                                decoration: TextDecoration.underline),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 25),
                        CustomButton(onTap: signUserIn, text: "Login"),
                        const SizedBox(height: 20),
                        const Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.white,
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                "Continue with",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 71, 48, 1),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.white,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SquareTile(imagePath: 'lib/images/google.jpg'),
                            SizedBox(width: 25),
                            SquareTile(imagePath: 'lib/images/apple.jpg'),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Not a member?",
                            style: TextStyle(color:Colors.white, fontSize: 16),),
                            const SizedBox(width: 7),
                            GestureDetector(
                              onTap: widget.onTap,
                              child: const Text(
                                "Register now?",
                                style: TextStyle(
                                   color: Color.fromARGB(255, 71, 48, 1),
                                   fontSize: 16,
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
