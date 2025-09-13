import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

final player = AudioPlayer();

class Tile extends StatelessWidget {
  const Tile({
    super.key,
    required this.color,
    required this.noteSound,
  });

  final Color color;
  final String noteSound;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          await player.setAsset('assets/audio/$noteSound');
          player.play();
        },
        child: Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          color: color,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.circle,
                size: 30,
                color: Colors.white70,
              ),
              Icon(
                Icons.circle,
                size: 30,
                color: Colors.white70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
