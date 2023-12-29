import 'package:flutter/material.dart';
import 'block.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Xylophone'),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Block(Colors.red, 'assets/note1.mp3'),
              Block(Colors.orange, 'assets/note2.mp3'),
              Block(Colors.yellow, 'assets/note3.mp3'),
              Block(Colors.greenAccent, 'assets/note4.mp3'),
              Block(Colors.green, 'assets/note5.mp3'),
              Block(Colors.blue, 'assets/note6.mp3'),
              Block(Colors.purple, 'assets/note7.mp3'),
            ],
          ),
        ),
      ),
    );
  }
}
