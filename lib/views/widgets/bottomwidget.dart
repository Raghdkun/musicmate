import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomWidget extends GetView {
  final dynamic isplaying;
  final void Function()? onPressed;
  final void Function()? onPressedNext;

  final String? songTitle ;

  const BottomWidget({super.key, this.isplaying, this.onPressed, this.songTitle, this.onPressedNext});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: isplaying
              ? Icon(
                  Icons.pause,
                  size: 30,
                  color: Colors.white,
                )
              : Icon(
                  Icons.play_arrow,
                  size: 30,
                  color: Colors.white,

                ),
          onPressed: onPressed,
        ),
        SizedBox(width: 16),
        IconButton(
          icon: Icon(Icons.skip_next_outlined),
                  color: Colors.white,

          onPressed: onPressedNext
        ),
        SizedBox(width: 16),
        Text(songTitle!, style: TextStyle(color: Colors.white),),
      ],
    );
  }
}
