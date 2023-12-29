import 'package:clima/services/data.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../services/location.dart';
import '../services/networking.dart';
import '../utilities/constants.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  bool ?isLoading;
  late var location;

  getLocation () async {
    setState(() {
      isLoading = true;
    });

    location = await LocationClass.getCurrentLocation();
    var latitude = location.latitude;
    var longitude = location.longitude;

    var url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiId&units=metric';
    
    ResponseModel response = await NetworkHelper.fetchWeather(url);
    
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(weatherData: response),
      ),
    );

    setState(() {
      isLoading = false;
    });
  }

  getPermission() async {
    if (await Permission.location.isGranted) {
      getLocation();
      return true;
    } else {
      Permission.location.request();
      getPermission();
    }
  }
  
  @override
  void initState() {
    super.initState();
    getPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingAnimationWidget.twistingDots(
          leftDotColor: Color.fromARGB(255, 141, 141, 141),
          rightDotColor: Color.fromARGB(255, 156, 156, 156),
          size: 200,
        ),
      ),
    );
  }
}
