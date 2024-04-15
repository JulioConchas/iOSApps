import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}
class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/jcAvatar.JPG'),
              ),
              Text(
                  'Julio Conchas',
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.white,
                  fontFamily: 'Caveat'
                ),
              ),
              Text(
                'SOFTWARE DEVELOPER',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.blueGrey[200],
                fontFamily: 'SourceCodePro',
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5
              ),
              ),
              SizedBox(
                width: 150,
                child: Divider(
                  color: Colors.blueGrey.shade200,
                ),
              ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                ),
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
                child:ListTile(
                  leading: Icon(
                      Icons.phone,
                      color: Colors.blueGrey.shade900,
                    ),
                    title: Text(
                      '+51 33 110 778 56',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'SourceCodePro',
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey.shade900,
                      ),
                    ),
                ),
              ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                ),
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
                child:ListTile(
                  leading: Icon(
                      Icons.email_outlined,
                      color: Colors.blueGrey.shade900,
                    ),
                    title: Text(
                      'conchasjimenez@gmail.com',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'SourceCodePro',
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey.shade900,
                      ),
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
