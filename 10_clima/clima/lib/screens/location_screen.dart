import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import '../services/weather.dart';

// ignore: must_be_immutable
class LocationScreen extends StatefulWidget {
  final weatherData;

  LocationScreen({required this.weatherData});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late int weatherCondition;
  late String city;
  late int temp;
  var weatherIcon;
  late String weatherMessage;

  late Color backgroundColor;

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
    print(widget.weatherData);
  }

  void updateUI(weatherData) {
    weatherCondition = weatherData['weather'][0]['id'];
    temp = weatherData['main']["temp"].toInt();
    city = weatherData["name"];
    weatherIcon = WeatherModel.getWeatherIcon(weatherCondition);
    weatherMessage = WeatherModel.getMessage(temp);

    if (temp > 25) {
      setState(() {
        backgroundColor = Colors.red;
      });
    } else if (temp > 20) {
      backgroundColor = Colors.blue;
    } else if (temp < 10) {
      backgroundColor = Colors.green;
    } else {
      backgroundColor = Colors.pink;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        /*decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),*/
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Row(
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
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '$temp°',
                        style: kTempTextStyle,
                      ),
                      Text(
                        weatherIcon,
                        style: kConditionTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(city),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Text(
                    weatherMessage,
                    textAlign: TextAlign.right,
                    style: kMessageTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
