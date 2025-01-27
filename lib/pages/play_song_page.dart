import 'package:flutter/material.dart';
import 'package:music_app/components/play_song_header_button.dart';
import 'package:music_app/components/song_and_volume.dart';
import 'package:music_app/components/song_controller_button.dart';
import 'package:music_app/components/song_detail.dart';

class PlaySongPage extends StatelessWidget {
  const PlaySongPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              PlaySongHeaderButton(),
              SizedBox(
                height: 10,
              ),
              SongAndVolume(),
              SizedBox(
                height: 40,
              ),
              SongDetail(),
              SizedBox(
                height: 10,
              ),
              SongControllerButton(),
            ],
          ),
        ),
      ),
    );
  }
}
