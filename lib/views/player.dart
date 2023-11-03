import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicmate/controllers/player/player_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Player extends StatelessWidget {
  final List<SongModel>? data;
  const Player({super.key, this.data});

  @override
  Widget build(BuildContext context) {
        PlayerController controller = Get.put(PlayerController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Now Playing"),
        leading: IconButton(
            onPressed: () {
              // controller.rescan(); 
              Get.back();
            },
            icon: Icon(
              Icons.arrow_drop_down_outlined,
              size: 35,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Expanded(
              flex: 5,
              child: Obx(() => Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // color: Colors.amber,
                  ),
                  alignment: Alignment.center,
                  child: QueryArtworkWidget(
                    quality: 100,
                    id: data![controller.playIndex.value].id,
                    type: ArtworkType.AUDIO,
                    artworkHeight: Get.height / 1,
                    artworkWidth: Get.width / 1,
                    nullArtworkWidget: Icon(
                      Icons.music_note,
                      color: Colors.white,
                      size: 50,
                    ),
                  )))),
          SizedBox(
            height: 10,
          ),
          Expanded(
              flex: 4,
              child: Obx(() => Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ListTile(
                            isThreeLine: false,
                            title: Text(data![controller.playIndex.value]
                                .displayName
                                .replaceAll(".mp3", "")),
                            titleTextStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                            subtitle: Text(
                                "${data![controller.playIndex.value].artist}"),
                            subtitleTextStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white30),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_border_outlined,
                                  color: Colors.white,
                                  size: 30,
                                )),
                            textColor: Colors.white,
                            // contentPadding: EdgeInsets.only(top: 5),
                          ),
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Slider(
                                value: controller.value.value,
                                min: Duration(seconds: 0).inSeconds.toDouble(),
                                max: controller.max.value,
                                onChanged: (newValue) {
                                  controller.changeduration(newValue.toInt());
                                  newValue = newValue;
                                },
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${controller.position.value}",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "${controller.duration.value}",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: () {
                                   
                                    controller.playRandomSong(data![controller.playIndex.value +1].uri,
                                        controller.playIndex.value + 1 , data![controller.playIndex.value].displayName , );
                                         controller.toggleRandomMode(); 
                                    // controller.random(); 
                                    // print(controller.shuffle.value); 
                                    // // controller.audioPlayer.shuffle(); 
                                    // if(!controller.shuffle.value){
                                    //   data!.shuffle(); 
                                    // controller.playSongs(
                                    //     data![controller.playIndex.value +1].uri,
                                    //     controller.playIndex.value + 1 , data![controller.playIndex.value].displayName);

                                    //   controller.shuffle(true); 


                                    // }else{
                                    //   controller.shuffle(false); 
                                    //   data!.sort((a, b) => data!.length,);
                                      
                                    // }
                                        // controller.audioPlayer.play(); 
                                       
                                    // controller.audioPlayer.play(); 
                                    
                                  },
                                  icon: controller.isRandomMode.value ? Icon(
                                    Icons.shuffle_outlined,
                                    size: 30,
                                    color: Colors.white,
                                  ) : Icon(
                                    Icons.shuffle_on_outlined,
                                    size: 30,
                                    color: Colors.white,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    controller.playSongs(
                                        data![controller.playIndex.value -1].uri,
                                        controller.playIndex.value - 1, data![controller.playIndex.value].displayName);
                                  },
                                  icon: Icon(
                                    Icons.skip_previous,
                                    size: 30,
                                    color: Colors.white,
                                  )),
                              CircleAvatar(
                                  radius: 30,
                                  child: IconButton(
                                      onPressed: () {
                                        if (controller.isPlaying.value) {
                                          controller.audioPlayer.pause();
                                          controller.isPlaying(false);
                                        } else {
                                          controller.audioPlayer.play();
                                          controller.isPlaying(true);
                                        }
                                      },
                                      icon: controller.isPlaying.value
                                          ? Icon(
                                              Icons.pause,
                                              size: 30,
                                            )
                                          : Icon(
                                              Icons.play_arrow,
                                              size: 30,
                                            ))),
                              IconButton(
                                  onPressed: () {
                                    controller.playSongs(
                                        data![controller.playIndex.value +1].uri,
                                        controller.playIndex.value +1, data![controller.playIndex.value].displayName);
                                  },
                                  icon: Icon(
                                    Icons.skip_next,
                                    size: 30,
                                    color: Colors.white,
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.repeat,
                                    size: 30,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ))),
        ]),
      ),
    );
  }
}


    // Text("Music name"),
    //                 Text("Music Artist"),