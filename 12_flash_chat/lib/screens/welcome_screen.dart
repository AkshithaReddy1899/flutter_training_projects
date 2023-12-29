// ignore_for_file: sized_box_for_whitespace, library_private_types_in_public_api, use_key_in_widget_constructors, avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/services/button.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      // upperBound: 100.0,
    );

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller!);

    controller?.forward();

    controller?.addListener(() {
      setState(() {});
    });

    Firebase.initializeApp().whenComplete(() {
      print('firebase initialization done');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation!.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 60.0,
                    child: Center(
                      child:
                          Image.asset('images/logo.png', fit: BoxFit.fitWidth),
                    ),
                  ),
                ),
                const Text(
                  'Flash Chat',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            Button(
              text: 'Log In',
              colour: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            Button(
              text: 'Register',
              colour: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
