import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(XylophoneMain());
}

class XylophoneMain extends StatelessWidget {

  AudioPlayer player = AudioPlayer();

  XylophoneMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: noteButton(player, 1, Colors.red),
              ),
              Expanded(
                  child: noteButton(player, 2, Colors.orange),
              ),
              Expanded(
                  child: noteButton(player, 3, Colors.yellow),
              ),
              Expanded(
                child: noteButton(player, 4, Colors.green),
              ),
              Expanded(
                child: noteButton(player, 5, Colors.teal),
              ),
              Expanded(
                child: noteButton(player, 6, Colors.blue),
              ),
              Expanded(
                child: noteButton(player, 7, Colors.purple),
              ),
            ],
          ),
        ),
      ),
    );
  }
  TextButton noteButton(AudioPlayer player, int assetNumber, Color color)
  {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
      ),
      onPressed: (){
        //AudioPlayer player = new AudioPlayer();
        player.play(AssetSource('note$assetNumber.wav'));
      },
      child: Text(''),
    );
  }
}
