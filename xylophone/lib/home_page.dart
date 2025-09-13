import 'package:flutter/material.dart';
import 'package:xylophone/tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Xylophone',
          style: TextStyle(color: Colors.white70),
        )),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          const Tile(color: Colors.red, noteSound: 'note1.wav'),
          const Tile(color: Colors.orange, noteSound: 'note2.wav'),
          const Tile(color: Colors.yellow, noteSound: 'note3.wav'),
          const Tile(color: Colors.green, noteSound: 'note4.wav'),
          const Tile(color: Colors.blue, noteSound: 'note5.wav'),
          const Tile(color: Colors.purple, noteSound: 'note6.wav'),
          const Tile(color: Colors.pink, noteSound: 'note7.wav'),
        ],
      ),
    );
  }
}
