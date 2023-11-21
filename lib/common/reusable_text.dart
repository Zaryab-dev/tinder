import 'package:flutter/material.dart';

Widget reusableText({
  required String text,
  double size = 14,
  FontWeight fontWeight = FontWeight.bold,
  String fontFamily = 'Round',
  Color textColor = Colors.black,
}) {
  return Text(
    text,
    style: TextStyle(
      color: textColor,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontSize: size,
    ),
  );
}
