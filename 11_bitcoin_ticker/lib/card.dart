import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  const CardComponent({super.key, required this.text});

  final text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 25.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
