import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  RoundedButton({required this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.blue, // Set your desired button color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), // Set the border radius
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}