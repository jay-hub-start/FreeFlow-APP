import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final bool isNotValidate;
  final double heightPercentage; // Add heightPercentage property
  final double fontSizePercentage;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.isNotValidate,
    this.heightPercentage = 0.07, // Set default height percentage
    this.fontSizePercentage = 0.024,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double textFieldHeight = screenHeight * heightPercentage;
    double fontSize = screenHeight * fontSizePercentage;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        height: textFieldHeight,
        child: TextField(
          style: TextStyle(color: Colors.white, fontSize: fontSize), // Set font size here
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            errorStyle: const TextStyle(color: Color.fromARGB(255, 236, 41, 27)),
            errorText: isNotValidate ? "Enter Proper Info" : null,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white, fontSize: fontSize), // Set hint text color and font size
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 182, 182, 182)),
            ),
          ),
        ),
      ),
    );
  }
}
