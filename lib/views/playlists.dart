import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicmate/controllers/player/player_controller.dart';
import 'package:musicmate/controllers/player/playlists_controller.dart';
import 'package:musicmate/core/constant/approutes.dart';
import 'package:musicmate/views/widgets/customtextform.dart';

class PlayLists extends StatelessWidget {
  const PlayLists({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PlayerController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoute.addplaylist);
          },
          child: Icon(
            Icons.add,
            color: Colors.black,
          )),
      body: Center(
        child: Text("playlists", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class AddPlaylist extends StatelessWidget {
  const AddPlaylist({super.key});

  @override
  Widget build(BuildContext context) {
    PlaylistController playlistController = Get.put(PlaylistController());

    return Scaffold(
      key: playlistController.customerScreenState1,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 18),
        child: FloatingActionButton(
            onPressed: () {
              playlistController.createPlaylist(); 
            },
            child: Icon(
              Icons.done,
              color: Colors.black,
            )),
      ),
      appBar: AppBar(
        title: Text("Add your new playlist",
            style: TextStyle(color: Colors.white)),
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 15, left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomTextField(
              hinttext: "Enter your playlist name",
              labelText: "Playlist name",
              onChanged: (p0) {},
              controller: playlistController.playlistname,
            ),
            
            SizedBox(height: Get.height /15,)
          ],
        ),
      ),
    );
  }
}
