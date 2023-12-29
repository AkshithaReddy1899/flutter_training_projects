import 'package:clima/services/data.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import '../services/networking.dart';
import '../screens/location_screen.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFieldInputDecoration,
                  onChanged: (formText) {
                    cityName = formText;
                  },
                ),
              ),
              TextButton(
                onPressed: () async {
                  var url =
                      'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiId&units=metric';

                  ResponseModel response =
                      await NetworkHelper.fetchWeather(url);

                  print(response.name);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          LocationScreen(weatherData: response),
                    ),
                  );

                  //Navigator.of(context).pop(response);
                  //pop:----refresh :----
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
