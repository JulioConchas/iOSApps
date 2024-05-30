import 'package:flutter/material.dart';

void main() => runApp(QuePex());
}

class QuePex extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black54),
        )
      ),
    );
  }
}
