import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF0A0E20),
        ),
        scaffoldBackgroundColor: Color(0xFF0A0E20),
      ),
      home: MyHomePage(),
    );
  }
}

