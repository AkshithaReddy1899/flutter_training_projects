import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.red,
            ),
            centerTitle: true,
            title: const Text('I am rich',
                style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 26,
                    color: Colors.purple,
                    fontFamily: 'Poppins')),
            backgroundColor: Colors.blueGrey[900]),
        body: Center(
          child: Image.asset('assets/images/diamond.png'),
        )
        /*Container(
          constraints: const BoxConstraints.expand(),
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(color: Colors.tealAccent, width: 15),
              image: const DecorationImage(
                image: AssetImage('assets/images/diamond.png'),
                fit: BoxFit.fill,
              )),
          child: const Center(
            child: Text('Image'),
          ),
        ),*/
      ),
    ),
  );
}
