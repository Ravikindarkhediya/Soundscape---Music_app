import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class SongPlayerController extends GetxController {
  // Initialize Data Member
  final player = AudioPlayer();
  RxBool isPlaying = false.obs;
  RxString currentTime = '0'.obs;
  RxString totalTime = '0'.obs;
  RxDouble sliderValue = 0.0.obs;
  RxDouble sliderMaxValue = 0.0.obs;
  RxString songTitle = ''.obs;
  RxString songArtist = ''.obs;
  RxBool isLoop = false.obs;
  RxBool isShuffled = false.obs;
  RxDouble volumeLevel = 0.2.obs;

  //  TODO: Check the permission
  Future<bool> requestStoragePermission() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      return true;
    } else {
      print("Storage permission denied");
      return false;
    }
  }

  // TODO: PLay the devise Song
  void playLocalAudio(SongModel song) async {
    if (await requestStoragePermission()) {
      try {
        songTitle.value = song.title;
        songArtist.value = song.artist!;
        await player.setAudioSource(AudioSource.uri(Uri.file(song.data)));
        isPlaying.value = true;
        await player.play();
        updatePosition();
      } catch (e) {
        print("Exception playLocalAudio() : $e");
      }
    }
  }

//   TODO: Pause the Playing Song
  Future<void> pausePlaying() async {
    isPlaying.value = false;
    await player.pause();
  }

  Future<void> setLoopSong() async {
    if (isLoop.value) {
      await player.setLoopMode(LoopMode.off);
    } else {
      await player.setLoopMode(LoopMode.one);
    }
    isLoop.value = !isLoop.value;
  }

  Future<void> playingRandomSong() async {
    try {
      if (isShuffled.value == true) {
        await player.setShuffleModeEnabled(false); // Disable shuffle
      } else {
        await player.setShuffleModeEnabled(true); // Enable shuffle
      }
      isShuffled.value = !isShuffled.value;
    } catch (e) {
      print("Error toggling shuffle: $e");
    }
  }

// TODO: Resume the Playing Song
  Future<void> resumePlaying() async {
    isPlaying.value = true;
    await player.play();
  }

  // TODO: Change the volume
  void changeVolume(double value) {
    volumeLevel.value = value;
    player.setVolume(volumeLevel.value);
  }

  void changeSongSlide(Duration position) async {
    await player.seek(position);
  }

  void updatePosition() async {
    try {
      // Listen to position updates
      player.positionStream.listen((position) {
        sliderValue.value = position.inMilliseconds.toDouble();
        currentTime.value = formatDuration(position);
      });

      // Listen to duration updates
      player.durationStream.listen((duration) {
        if (duration != null) {
          sliderMaxValue.value = duration.inMilliseconds.toDouble();
          totalTime.value = formatDuration(duration);
        }
      });
    } catch (e) {
      print('updatePosition() Exception: $e');
    }
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes);
    final seconds = twoDigits(duration.inSeconds % 60);
    return '$minutes:$seconds';
  }
}
