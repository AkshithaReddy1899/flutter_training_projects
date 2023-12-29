import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final dynamic onPressed;
  final Color colour;

  const Button(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.colour});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
