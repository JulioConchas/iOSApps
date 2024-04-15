import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text(
            style: TextStyle(
              color: Colors.white
            ),
              'Love of My Heart'
          ),
          backgroundColor: Colors.blue[900],
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/myheart.png'),
          ),
        ),
        backgroundColor: Colors.grey[400],
      ),
    )
  );
}
