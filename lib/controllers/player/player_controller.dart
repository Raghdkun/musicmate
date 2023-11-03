import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:musicmate/core/constant/approutes.dart';
import 'package:musicmate/database/databasehelper.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class PlayerController extends GetxController {
  final audioQuery = OnAudioQuery();
  final audioPlayer = AudioPlayer();
  final MiniplayerController controller = MiniplayerController();
  var playIndex = 0.obs;
  var isPlaying = false.obs;
  var duration = "".obs;
  var position = "".obs;
  var max = 0.0.obs;
  var value = 0.0.obs;
  final RxBool isRandomMode = false.obs;
  // var shuffle = false.obs ;
  var indexShuffle = 0.obs;
  var songname = "".obs;
  var miniplayer = false.obs;
  final MiniplayerController miniplayerController = MiniplayerController();

  DatabaseHelper databaseHelper = DatabaseHelper.instance;

  Future<void> fetchSongs() async {
    songs.clear();
    songs.addAll(await audioQuery.querySongs(
      ignoreCase: true,
      orderType: OrderType.ASC_OR_SMALLER,
      sortType: null,
      uriType: UriType.EXTERNAL,
    ));
    update();
  }

  

  void toggleRandomMode() {
    isRandomMode.value = !isRandomMode.value;
  }

  void untoggleRandomMode() {
    isRandomMode.value = isRandomMode.value;
  }

  playRandomSong(uri, index, songname) async {
    if (isRandomMode.value) {
      final random = Random();
      final randomIndex = random.nextInt(songs.length);
      final randomSong = songs[randomIndex];
      songs.shuffle();
      playSongs(uri, index, songname);
      updatePosition();
      untoggleRandomMode();

      // Implement your audio player logic here
      // Play the randomSong using your audio player package
    } else {
      // Play the songs in their original order
      // songs.clear();
      fetchSongs();

      audioPlayer.load();
      updatePosition();

// playSongs(uri1, index1, songname1);
      playSongs(uri, index, songname);

      update();
      for (final song in songs) {
        // Implement your audio player logic here
        // Play the song using your audio player package
      }
    }
  }

  checkPermissions() async {
    var perm = await Permission.storage.request();
    if (perm.isGranted) {
      fetchSongs();
    } else {
      await Permission.storage.request();
    }
  }

  changeduration(sec) {
    var duration = Duration(seconds: sec);
    audioPlayer.seek(duration);
  }

  updatePosition() {
    audioPlayer.durationStream.listen((event) {
      duration.value = event.toString().split(".")[0];
      max.value = event!.inSeconds.toDouble();
    });
    audioPlayer.positionStream.listen((event) {
      position.value = event.toString().split(".")[0];
      value.value = event.inSeconds.toDouble();
    });
  }

  autoNext() {
    audioPlayer.positionStream.listen((event) {
      position.value = event.toString().split(".")[0];
      value.value = event.inSeconds.toDouble();
    });
    audioPlayer.seekToNext();
  }

  rescan() {
    audioQuery.queryAllPath();
  }

  playSongs(String? uri, index, songname) {
    playIndex.value = index;

    try {
      audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(uri!)));
      // audioPlayer.stop();
      audioPlayer.play();
      isPlaying(true);
      // songname.value = songname;
      updatePosition();
      // songname.value = songname;
    } on Exception catch (e) {
      print(e.toString());
    }
    miniplayer(true);
    update();
  }

  final RxList<SongModel> songs = <SongModel>[].obs;

  @override
  void onInit() {
    checkPermissions();
    fetchSongs();
    super.onInit();
  }
}
