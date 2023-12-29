import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Dicee',),
          backgroundColor: Colors.red,
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftDiceNumber = 1;
  var rightDiceNumber = 2;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    leftDiceNumber = Random().nextInt(6) + 1;
                  });
                },
                child: Image(
                  image: AssetImage('images/dice$leftDiceNumber.png'),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    rightDiceNumber = Random().nextInt(6) + 1;
                  });
                },
                child: Image(
                  image: AssetImage('images/dice$rightDiceNumber.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}