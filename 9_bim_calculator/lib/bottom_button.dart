
import 'package:flutter/material.dart';

import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.text, required this.onPress});

  final String text;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 60.0,
        decoration: BoxDecoration(
          color: bottomContainerColor,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
