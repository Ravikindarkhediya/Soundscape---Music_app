import 'package:flutter/material.dart';
import 'package:music_app/components/song_header.dart';
import 'package:music_app/components/song_tile.dart';
import 'package:music_app/components/trending_song_slider.dart';

class SongPage extends StatefulWidget {
  const SongPage({super.key});

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const SongHeader(),
                const SizedBox(
                  height: 20,
                ),
                const TrendingSongSlider(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cloud Song',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      'Device Song',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const SongTile(),
                const SongTile(),
                const SongTile(),
                const SongTile(),
                const SongTile(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
