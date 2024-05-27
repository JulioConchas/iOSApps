import 'package:flutter/material.dart';
import 'package:clima_no_name_company/utilities/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Weather {

  IconData getWeatherIcon(int condition)
  {
    if (condition < 300)
    {
      return FontAwesomeIcons.cloudBolt;
    }
    else if (condition < 400)
    {
      return FontAwesomeIcons.cloudRain;
    }
    else if (condition < 600)
    {
      return FontAwesomeIcons.umbrella;
    }
    else if (condition < 700)
    {
      return FontAwesomeIcons.snowman;
    }
    else if (condition < 800)
    {
      return FontAwesomeIcons.cloudMoon;
    }
    else if (condition == 800)
    {
      return FontAwesomeIcons.sun;
    }
    else if (condition <= 804) {
      return FontAwesomeIcons.cloud;
    }
    else
    {
      return FontAwesomeIcons.thinkPeaks;
    }
  }
  Color getWeatherColor(int condition)
  {
    if (condition == 800)
    {
      return kSunnyWeatherColor;
    }
    else
    {
      return kCloudyWeatherColor;
    }
  }
}