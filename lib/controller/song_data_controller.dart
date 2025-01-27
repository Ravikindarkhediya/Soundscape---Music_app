import 'package:get/get.dart';
import 'package:music_app/controller/song_player_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class SongDataController extends GetxController {
  SongPlayerController songPlayerController = Get.put(SongPlayerController());
  final audioQuery = OnAudioQuery();
  RxList<SongModel> localSongList = <SongModel>[].obs;
  RxBool isDeviceSong = false.obs;
  RxInt currentPlayingSongIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    storagePermission();
  }

  Future<void> getLocalSong() async {
    try {
      localSongList.value = await audioQuery.querySongs(
        ignoreCase: true,
        orderType: OrderType.ASC_OR_SMALLER,
        sortType: null,
        uriType: UriType.EXTERNAL,
      );
    } catch (e) {
      print("Error loading songs: $e");
    }
  }

  void storagePermission() async {
    try {
      var permission = await Permission.storage.request();
      if (permission.isGranted) {
        print('Permission Granted');
        getLocalSong();
      } else {
        print('Permission Denied');
      }
    } catch (ex) {
      print(ex);
    }
  }

  // find the index of song
  void findCurrentSongPlayingId(int songId) {
    for (int index = 0; index < localSongList.length; index++) {
      if (localSongList[index].id == songId) {
        currentPlayingSongIndex.value = index;
        break;
      }
    }
    print('Current Playing Song Index: ${currentPlayingSongIndex.value}');
  }

  void playNextSong() async {
    try {
      if (currentPlayingSongIndex.value < localSongList.length - 1) {
        currentPlayingSongIndex.value++;
        SongModel nextSong = localSongList[currentPlayingSongIndex.value];
        songPlayerController.playLocalAudio(nextSong); // Play the next song
      } else {
        print("No more songs in the playlist."); // Handle the end of the playlist
      }
    } catch (e) {
      print("Exception in playNextSong(): $e");
    }
  }

  void playPreviousSong() async {
    try {
      if (currentPlayingSongIndex.value > 0) {
        currentPlayingSongIndex.value--;
        SongModel previousSong = localSongList[currentPlayingSongIndex.value];
        songPlayerController.playLocalAudio(previousSong); // Play the next song
      } else {
        print("No more songs in the playlist."); // Handle the end of the playlist
      }
    } catch (e) {
      print("Exception in playNextSong(): $e");
    }
  }
}
