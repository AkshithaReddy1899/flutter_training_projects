import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ball.dart';

void main() => runApp(
      const MaterialApp(
        home: BallPage(),
      ),
    );

class BallPage extends StatelessWidget {
  const BallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.grey),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        title: const Text('Ask Me Anything'),
      ),
      body: const Ball(),
    );
  }
}
