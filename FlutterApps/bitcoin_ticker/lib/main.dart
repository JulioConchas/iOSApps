import 'package:flutter/material.dart';
import 'screens/main_home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: const MainHomePage(title: 'jBitcoin Ticker'),
    );
  }
}
class SpinScreen extends StatefulWidget {
  const SpinScreen({super.key});

  @override
  State<SpinScreen> createState() => _SpinScreenState();
}

class _SpinScreenState extends State<SpinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('jBitcoin Ticker'),
      ),
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.blueGrey,
          size: 100.0,
        ),
      ),
    );
  }
}


