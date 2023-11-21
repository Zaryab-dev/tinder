
import 'package:flutter/material.dart';

Widget reusableButton({required String text, required VoidCallback onPress,
  double size = 14,
  FontWeight fontWeight = FontWeight.bold,
  String fontFamily = 'Round',
  Color textColor = Colors.white,
}) {
  return MaterialButton(
    height: 50,
    minWidth: 400,
    color: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5)
    ),
    onPressed: onPress, child: Text(
    text,
    style: TextStyle(
      color: textColor,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontSize: size,
    ),
  ),);
}