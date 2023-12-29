import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../services/location.dart';
// import 'package:http/http.dart' as http;
import '../services/networking.dart';
import '../utilities/constants.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool isLoading = false;

  late var location;

  getLocation() async {
    setState(() {
      isLoading = true;
    });
    location = await LocationClass.getCurrentLocation();
    print('got location');
    var latitude = location.latitude;
    var longitude = location.longitude;

    var url = 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiId&units=metric';

    var response = await NetworkHelper.getWeather(url);
    print('got weather');

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

  void getPermission() async {
    print('got permisssion');
    if (await Permission.location.isGranted) {
      print('fetching location');
      getLocation();
    } else {
      Permission.location.request();
    }
  }

  @override
  void initState() {
    super.initState();
    print('asking permission');
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
