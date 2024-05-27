import 'package:flutter/material.dart';
import 'package:clima_no_name_company/services/weather.dart';
import 'package:clima_no_name_company/utilities/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LocationScreen extends StatefulWidget {
  var networkData;

  LocationScreen({this.networkData});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  late int temperature;
  late IconData weatherIcon;
  late Color backgroundColor;

  Weather weather = Weather();

  @override
  void initState() {
    super.initState();
    updateUI(widget.networkData);
  }

  void updateUI(dynamic networkData)
  {
    setState(() {
      temperature = networkData["main"]["temp"].toInt();
      weatherIcon = weather.getWeatherIcon(networkData["weather"][0]["id"]);
      backgroundColor = weather.getWeatherColor(networkData["weather"][0]["id"]);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color:
            backgroundColor, // this color might change according to weather condition
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 100.0,),
              Container(
                child: Icon(
                  weatherIcon,
                  size: 250.0,
                  color: kCloudyWeatherDarKColor,
                ),
              ),
              Container(
                child: Text(
                  '$temperature',
                  style: kTemperatureTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                child: Text(
                  'SUNDAY, 19 May',
                  textAlign: TextAlign.center,
                  style: kDateTextStyle,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: Icon(
                      Icons.location_on_outlined,
                      size: 50.0,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.search_outlined,
                        size: 50.0,
                        color: Colors.grey,
                      )
                  )
                ],
              ),
              SizedBox(
                width: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
