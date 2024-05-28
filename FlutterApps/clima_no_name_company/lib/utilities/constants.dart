import 'package:flutter/material.dart';

String kOpenWeatherAPIUtl = "https://api.openweathermap.org/data/2.5/weather?";
String kOpenWeatherAPIKey = "<openWeatherAPIKey>";

// Colors
Color kCloudyWeatherColor = Color(0xFFD7F1FF);
Color kCloudyWeatherDarKColor = Color(0xFF5493CC);
Color kSunnyWeatherColor = Color(0xFFFFF9B5);

// TextStyles

TextStyle kTemperatureTextStyle = TextStyle(
  color: kCloudyWeatherDarKColor,
  fontSize: 100.0,
  fontWeight: FontWeight.w400,
);
TextStyle kDateTextStyle = TextStyle(
  color: Colors.grey.shade600,
  fontSize: 25.0,
  fontWeight: FontWeight.w600,
);