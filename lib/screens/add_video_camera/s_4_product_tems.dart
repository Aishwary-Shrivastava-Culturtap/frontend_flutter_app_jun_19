import 'dart:io';

import 'package:culturtap/provider/video_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class s_4_videoItem extends StatefulWidget {
  static const namedRoute = "/s_4_videoItem";

  // List list;
  s_4_videoItem({required this.clip, required this.index});
  File clip;
  int index;

  @override
  State<s_4_videoItem> createState() => _s_4_videoItemState();
}

class _s_4_videoItemState extends State<s_4_videoItem> {
  VideoPlayerController? videoController;
  bool play = false;

  // final String id;
  Future<void> _startVideoPlayer() async {
    if (widget.clip != null) {
      videoController = VideoPlayerController.file(widget.clip);

      await videoController!.setLooping(true);
      await videoController!.play();
    }
  }

  @override
  void initState() {
    super.initState();
    videoController = VideoPlayerController.file(widget.clip)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final loader_video_provider = Provider.of<video_provider>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(children: [
          GridTile(
        
          header: GridTileBar(
            backgroundColor: Color.fromARGB(0, 0, 0, 0),
            leading: CircleAvatar(
              backgroundColor: Color(0xffF2F2F2),
              radius: 14,
              child: Text(widget.index.toString(),
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
            ),
            trailing: IconButton(
              icon:const Icon(
                Icons.cancel_outlined,
              ),
              onPressed: () {
                
                loader_video_provider.delete(widget.index);
              },
            ),
            title: const Text(""),
          ),

            child: videoController!.value.isInitialized
              ?  AspectRatio(
                  aspectRatio: videoController!.value.aspectRatio,
                  child: VideoPlayer(videoController!),
                )
              :  Container(
                   color:   Colors.black,
                ),
        ),
        Align(
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {
              setState(() {
                play = false;
                videoController!.value.isPlaying
                    ? videoController!.pause()
                    : videoController!.play();
                ;
              });
            },
            child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black38,
                child: Icon(
                  !videoController!.value.isPlaying
                      ? Icons.play_arrow
                      : Icons.pause,
                  size: 30,
                )),
          ),
        )
      ]),
    );
  }
}
