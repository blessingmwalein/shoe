import 'package:flutter/material.dart';

//create rounded button with text
Widget roundedButton(
    {required String text,
    required Color color,
    required Color textColor,
    required Function() onPressed}) {
  return SizedBox(
    width: double.infinity,
    height: 50,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    ),
  );
}