
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicmate/views/playlists.dart';
import 'package:on_audio_query/on_audio_query.dart';
class PlaylistController extends GetxController {
  final OnAudioQuery _audioQuery = OnAudioQuery();

  RxList<PlaylistModel> playlist = <PlaylistModel>[].obs;
GlobalKey customerScreenState1 = GlobalKey();

    
     TextEditingController playlistname = TextEditingController(); 

  getallPlayLists(){
    _audioQuery.queryPlaylists(); 
    update(); 
  }

  void createPlaylist() async {
    // Create the playlist in the on_audio_query package
    if (playlistname.text.isEmpty){
     Get.snackbar('Error', 'Your Form Is Empty');
    }else {
      
       final playlistId = await _audioQuery.createPlaylist(playlistname.text);
 if (playlistId != null) {
      Get.snackbar('Success', 'Playlist created successfully!');
    } else {
      Get.snackbar('Error', 'Failed to create playlist!');
    }
    }
    

    // Store the playlist name and ID in your own table or collection
    // You can use a database package like sqflite or shared_preferences
    // to store and retrieve the playlist names and IDs

   
  }

  void addToPlaylist(String playlistName, SongModel song) async {
    // Retrieve the playlist ID from your own table or collection
    final playlistId = await getPlaylistId(playlistName);

    if (playlistId != null) {
      final result = await _audioQuery.addToPlaylist(playlistId, song.id);
      if (result) {
        Get.snackbar('Success', 'Song added to playlist!');
      } else {
        Get.snackbar('Error', 'Failed to add song to playlist!');
      }
    } else {
      Get.snackbar('Error', 'Playlist not found!');
    }
  }

  Future<int> getPlaylistId(String playlistName) async {
    // Retrieve the playlist ID from your own table or collection
    // You can use a database package like sqflite or shared_preferences
    // to retrieve the playlist ID based on the playlist name
    return 1 ; 
  }
}