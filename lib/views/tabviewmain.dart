import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:musicmate/controllers/maintabview_controller.dart';
import 'package:musicmate/controllers/player/player_controller.dart';
import 'package:musicmate/core/constant/approutes.dart';
import 'package:musicmate/views/home.dart';
import 'package:musicmate/views/player.dart';
import 'package:musicmate/views/playlists.dart';
import 'package:musicmate/views/widgets/bottomwidget.dart';

class MainTabView extends StatelessWidget {
  const MainTabView({super.key});

  @override
  Widget build(BuildContext context) {
    MainTabVireController controller = Get.put(MainTabVireController());
    Get.put(PlayerController());

    PlayerController _ = Get.put(PlayerController());
    return Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: controller.appTabs,
            controller: controller.tabController,
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.list_alt))],
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          title: Text(
            "Music Mate",
          ),
        ),
        // body: TabBarView(controller: controller.tabController, children: controller.appTabs.map((e) => Home()).toList())
        body: TabBarView(
          children: [Home(), PlayLists()],
          controller: controller.tabController,
        ),
        bottomNavigationBar: GetBuilder<PlayerController>(
          init: PlayerController(),
          initState: (_) {},
          builder: (_) {
            return Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                // color: Colors.grey[200],
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.grey.shade800, Colors.black26],
                      tileMode: TileMode.repeated,
                    ),
                    border: Border.symmetric(
                        vertical: BorderSide(color: Colors.white10, width: 0.4))),
                height: _.miniplayer.value ? 60 : 0,
                child: Obx(() => InkWell(
                    onTap: () {
                      Get.to(() => Player(data: _.songs),
                          transition: Transition.downToUp,
                          duration: const Duration(milliseconds: 500));
                    },
                    child: BottomWidget(
                      isplaying: _.isPlaying.value,
                      onPressed: () {
                        if (_.isPlaying.value) {
                          _.audioPlayer.pause();
                          _.isPlaying(false);
                        } else {
                          _.audioPlayer.play();
                          _.isPlaying(true);
                        }
                      },
                      songTitle: _.miniplayer.value
                          ? _.songs[_.playIndex.value].displayName
                              .replaceAll(".mp3", "")
                          : "",
                      onPressedNext: () {
                        _.playSongs(
                            _.songs[_.playIndex.value + 1].uri,
                            _.playIndex.value + 1,
                            _.songs[_.playIndex.value].displayName);
                      },
                    ))));
          },
        ));
  }
}


//Miniplayer(minHeight: 60, maxHeight: Get.height, backgroundColor: Colors.transparent, builder: (height, percentage) =>  ,)