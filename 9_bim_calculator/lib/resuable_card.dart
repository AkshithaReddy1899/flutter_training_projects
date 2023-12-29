import 'package:flutter/material.dart';

class ReusableCard extends StatefulWidget {
  ReusableCard({required this.colour, this.cardChild, this.onPress});

  final Color colour;
  final Widget? cardChild;
  final VoidCallback? onPress;

  @override
  State<ReusableCard> createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: widget.colour,
        ),
        child: widget.cardChild,
      ),
    );
  }
}
