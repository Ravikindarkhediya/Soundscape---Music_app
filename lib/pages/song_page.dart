import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/components/song_header.dart';
import 'package:music_app/components/song_tile.dart';
import 'package:music_app/components/trending_song_slider.dart';
import 'package:music_app/config/colors.dart';
import 'package:music_app/controller/song_data_controller.dart';
import 'package:music_app/pages/play_song_page.dart';

import '../controller/song_player_controller.dart';

class SongPage extends StatefulWidget {
  const SongPage({super.key});

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  @override
  Widget build(BuildContext context) {
    SongDataController songDataController = Get.put(SongDataController());
    SongPlayerController songPlayerController = Get.put(SongPlayerController());
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
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () {
                          songDataController.isDeviceSong.value = false;
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Cloud Song',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color: songDataController.isDeviceSong.value
                                      ? labelColor
                                      : primaryColor,
                                ),
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () {
                          songDataController.isDeviceSong.value = true;
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Device Song',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color: songDataController.isDeviceSong.value
                                      ? primaryColor
                                      : labelColor,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () =>
                      // jo device ma songs hase to...
                      songDataController.isDeviceSong.value
                          ? Column(
                              children: songDataController.localSongList.value
                                  .map((e) => SongTile(
                                        songName: e.title,
                                        onTap: () {
                                          songPlayerController
                                              .playLocalAudio(e);
                                          songDataController
                                              .findCurrentSongPlayingId(e.id);
                                          Get.to(const PlaySongPage());
                                        },
                                      ))
                                  .toList(),
                            )
                          // jo device ma songs na hoy to...
                          : const Column(
                              children: [
                                Text('Song Empty')
                                // SongTile(),
                                // SongTile(),
                                // SongTile(),
                                // SongTile(),
                                // SongTile(),
                              ],
                            ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
