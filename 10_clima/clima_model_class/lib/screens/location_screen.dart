import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import '../services/weather.dart';

class LocationScreen extends StatefulWidget {
  late final Object? weatherData;

  LocationScreen({required this.weatherData});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late String city = '...';
  late double? temp = 0.0;
  late int weatherCondition = 0;
  var weatherIcon;
  late String weatherMessage = '...';

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
  }

  updateUI(weatherData) {
    city = weatherData.name;
    temp = weatherData.main.temp;
    weatherCondition = weatherData.weather[0].id;
    weatherMessage = WeatherModel.getMessage(temp!);
    weatherIcon = WeatherModel.getWeatherIcon(weatherCondition);
    print(city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CityScreen()));
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      temp != null ? '$temp°' : 'Loading...',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon != null ? weatherIcon : 'Loading...',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(city),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  weatherMessage,
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
