import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicmate/controllers/player/player_controller.dart';
import 'package:musicmate/core/constant/approutes.dart';
import 'package:musicmate/core/constant/styles.dart';
import 'package:musicmate/views/player.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:miniplayer/miniplayer.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    PlayerController controller = Get.put(PlayerController());
    return Scaffold(
        // backgroundColor: Colors.amber,

        body: GetBuilder<PlayerController>(
      init: PlayerController(),
      builder: (controller) {
        if (controller.songs.isEmpty) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.songs.isEmpty) {
          return Center(
            child: Text("No Songs Found"),
          );
        } else {
          return Obx(() => ListView.builder(
                itemCount: controller.songs.length,
                itemBuilder: (context, index) => Container(
                  child: ListTile(
                    title: Text(
                      "${controller.songs[index].displayName.replaceAll(".mp3", "")}",
                      style: listTileStyle(),
                    ),
                    subtitle: Text(
                      "${controller.songs[index].artist}",
                      style: listTileStyle(),
                    ),
                    onTap: () {
                      controller.playSongs(
                        controller.songs[index].uri,
                        index,
                        controller.songs[index].displayName,
                      );
                      Get.to(() => Player(data: controller.songs),
                          transition: Transition.downToUp);
                    },
                    leading: QueryArtworkWidget(
                      id: controller.songs[index].id,
                      type: ArtworkType.AUDIO,
                      nullArtworkWidget: Icon(
                        Icons.music_note,
                        size: 25,
                        fill: BorderSide.strokeAlignCenter,
                      ),
                    ),
                    iconColor: Colors.white,
                    trailing: IconButton(
                      icon: controller.playIndex.value == index &&
                              controller.isPlaying.value
                          ? Icon(Icons.play_arrow)
                          : Container(),
                      onPressed: () {},
                    ),
                  ),
                ),
              ));
        }
      },
    )
        //   bottomSheet: FutureBuilder(builder: (context, snapshot1) => Miniplayer(
        //     minHeight: 70,
        //           maxHeight: Get.height,
        //           controller: controller.controller,

        //     builder: (height, percentage) {
        //       // height = 50 ;

        //       return Player(data: snapshot1.data,);
        //     },
        //   ),
        //   future: controller.audioQuery.querySongs(
        //     ignoreCase: true,
        //         orderType: OrderType.ASC_OR_SMALLER,
        //         sortType: null,
        //         uriType: UriType.EXTERNAL,
        //   ),
        // )
        );
  }
}
