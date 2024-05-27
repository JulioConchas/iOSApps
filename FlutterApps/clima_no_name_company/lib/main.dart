import 'package:flutter/material.dart';
import 'package:clima_no_name_company/screens/main_screen.dart';

void main()  => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /***
       * ThemeData light is ok for now
       */
      theme: ThemeData.light(),
      home: MainScreen(),
    );
  }
}


