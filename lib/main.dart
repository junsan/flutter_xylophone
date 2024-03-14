import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const Xylophone());
}

class Xylophone extends StatefulWidget {
  const Xylophone({super.key});

  @override
  State<Xylophone> createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {

  void playSound(int soundNum) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$soundNum.wav'));
  }

  Expanded buildKey({ required Color color, required int soundNum }) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.all(0))
        ),
        onPressed: () {
          playSound(soundNum);
        },
        child: Container(
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildKey(color: Colors.red, soundNum: 1),
          buildKey(color: Colors.orange, soundNum: 2),
          buildKey(color: Colors.yellow, soundNum: 3),
          buildKey(color: Colors.green, soundNum: 4),
          buildKey(color: Colors.teal, soundNum: 5),
          buildKey(color: Colors.blue, soundNum: 6),
          buildKey(color: Colors.purple, soundNum: 7),
        ],
      ),
    ));
  }
}
