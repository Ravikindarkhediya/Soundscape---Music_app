import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/controller/song_player_controller.dart';

class SongDetail extends StatelessWidget {
  const SongDetail({super.key});

  @override
  Widget build(BuildContext context) {
    SongPlayerController songPlayerController = Get.put(SongPlayerController());
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.play_arrow_outlined),
            const SizedBox(
              width: 5,
            ),
            Text(
              '210 Plays',
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  child: Text(
                songPlayerController.songTitle.value,
                style: Theme.of(context).textTheme.bodyLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              )),
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.save_alt_outlined,
                size: 28,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  songPlayerController.songArtist.value,
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
