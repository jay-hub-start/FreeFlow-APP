import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final double heightPercentage; // Add heightPercentage property
  final double fontSizePercentage;
  final String text;

  const CustomButton({
    Key? key,
    this.onTap,
    required this.text,
    this.heightPercentage = 0.07, // Set default height percentage
    this.fontSizePercentage = 0.035,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double buttonHeight = screenHeight * heightPercentage;
    double fontSize = screenHeight * fontSizePercentage;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: buttonHeight,
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 71, 48, 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: fontSize),
          ),
        ),
      ),
    );
  }
}
