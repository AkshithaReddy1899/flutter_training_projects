import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class Block extends StatelessWidget {
  late Color _color;
  late String note;
  Block(Color color, String note) {
    this._color = color;
    this.note = note;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: _color,
        child: TextButton(
          onPressed: () async {
            AssetsAudioPlayer.newPlayer().open(
              Audio(note),
              showNotification: true,
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: _color,
          ),
          child: Text(''),
        ),
      ),
    );
  }
}
