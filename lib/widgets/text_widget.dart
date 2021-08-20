import 'package:flutter/material.dart';

class Text_Widget extends StatelessWidget {
  final String text;
  final double font_size;
  final Color colour;
  final String font_family;
  Text_Widget(
      {required this.text,
      required this.font_size,
      required this.colour,
      required this.font_family});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: font_size, color: colour, fontFamily: font_family),
    );
  }
}
