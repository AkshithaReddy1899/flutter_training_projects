import 'package:flutter/material.dart';

const textStyle = TextStyle(
  fontSize: 16.0,
  color: Color(0xFF8D8E98),
);

class IconContent extends StatelessWidget {
  IconContent({required this.faIcon, required this.text});

  final IconData faIcon;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(faIcon, size: 60.0),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: textStyle,
        ),
      ],
    );
  }
}
