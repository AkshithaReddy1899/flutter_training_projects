import 'package:flutter/material.dart';
import 'price_screen.dart';
import 'package:loader_overlay/loader_overlay.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.lightBlue,
          scaffoldBackgroundColor: Colors.white),
      home: LoaderOverlay(
        child: PriceScreen(),
      ),
    );
  }
}
