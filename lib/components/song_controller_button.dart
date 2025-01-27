import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/config/colors.dart';
import 'package:music_app/controller/song_data_controller.dart';

import '../controller/song_player_controller.dart';

class SongControllerButton extends StatelessWidget {
  const SongControllerButton({super.key});

  @override
  Widget build(BuildContext context) {
    SongPlayerController songPlayerController = Get.put(SongPlayerController());
    SongDataController songDataController = Get.put(SongDataController());

    return Material(
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          // TODO: Time of Song
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  songPlayerController.currentTime.value,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Expanded(
                  child: Obx(
                    () => Slider(
                      value: songPlayerController.sliderValue.value.clamp(
                        0.0,
                        songPlayerController.sliderMaxValue.value,
                      ),
                      onChanged: (value) {
                        songPlayerController.sliderValue.value = value;

                        // Seek the player to the new position
                        songPlayerController.changeSongSlide(
                          Duration(milliseconds: value.toInt()),
                        );
                      },
                      min: 0.0,
                      max: songPlayerController.sliderMaxValue.value,
                      activeColor: primaryColor,
                    ),
                  ),
                ),
                Text(
                  songPlayerController.totalTime.value,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          // TODO: Play/pause, next and previous song to
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: songDataController.playPreviousSong,
                child: const Icon(
                  Icons.skip_previous,
                  size: 35,
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              // add play-pause btn

              Obx(
                () {
                  final isPlaying = songPlayerController.isPlaying.value;

                  return InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      if (!isPlaying) {
                        songPlayerController.resumePlaying();
                      } else {
                        songPlayerController.pausePlaying();
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(17),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                        size: 35,
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(
                width: 50,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () {
                  songDataController.playNextSong();
                },
                child: const Icon(
                  Icons.skip_next,
                  size: 35,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          // TODO: Play/pause, next and previous song to
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  songPlayerController.playingRandomSong();
                },
                child: Obx(
                  () => Icon(
                    Icons.shuffle,
                    color:
                        songPlayerController.isShuffled.value ? primaryColor : labelColor,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  songPlayerController.setLoopSong();
                },
                child: Obx(
                  () => Icon(
                    Icons.repeat,
                    color: songPlayerController.isLoop.value ? primaryColor : labelColor,
                  ),
                ),
              ),
              Image.asset(
                'assets/icons/music_book.png',
                height: 20,
              ),
              Image.asset(
                'assets/icons/heart.png',
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
