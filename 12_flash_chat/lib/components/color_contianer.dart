// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ColorContianer extends StatelessWidget {
  const ColorContianer({required this.pickedColor, required this.onTap});

  final Color pickedColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: pickedColor,
        ),
        height: 30,
        width: 30,
      ),
    );
  }
}
