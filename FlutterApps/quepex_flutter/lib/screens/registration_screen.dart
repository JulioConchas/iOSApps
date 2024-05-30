import 'package:flutter/material.dart';

class RregistrationScreen extends StatefulWidget {
  @override
  State<RregistrationScreen> createState() => _RregistrationScreenState();
}

class _RregistrationScreenState extends State<RregistrationScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('QuePex✌🏽'),
      ),
      body: Center(
          child: Text('This is the registration screen')
      ),
    );
  }
}