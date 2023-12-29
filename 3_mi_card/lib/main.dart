// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.orange,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.jpg'),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //profile image
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50.0,
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.blueGrey[300],
                  child: ClipOval(
                      child: Image.asset('assets/images/toucan.png')),
                ),
              ),
              // user name
              Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: const Text(
                  'Toucan Payments',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Zeyada',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: const Text(
                  'FLUTTER DEVELOPER',
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 5.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
                color: Colors.white,
                alignment: Alignment.center,
                child: ListTile(
                  leading: Icon(Icons.home, color: Colors.teal),
                  title: Text('st no 2 , Hyd'),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
                color: Colors.white,
                alignment: Alignment.center,
                child: ListTile(
                  leading: Icon(Icons.phone, color: Colors.teal),
                  title: Text('+123456789'),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
                color: Colors.white,
                alignment: Alignment.center,
                child: ListTile(
                  leading: Icon(Icons.mail, color: Colors.teal),
                  title: Text('toucan@gmail.com'),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
