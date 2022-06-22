import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class ChewieWidget extends StatefulWidget {
  const ChewieWidget(this._videoPlayerController, {Key? key}) : super(key: key);

  final VideoPlayerController _videoPlayerController;

  @override
  _ChewieWidget createState() => _ChewieWidget();
}

class _ChewieWidget extends State<ChewieWidget> {
  late ChewieController chewiectrl;
  @override
  void initState() {
    super.initState();
    chewiectrl = ChewieController(
        allowedScreenSleep: false,
        allowFullScreen: true,
        deviceOrientationsAfterFullScreen: [
          DeviceOrientation.portraitUp,
        ],
        videoPlayerController: widget._videoPlayerController,
        aspectRatio: 2 / 3,
        autoInitialize: true,
        autoPlay: false,
        showControls: true);

    chewiectrl.addListener(() {
      if (chewiectrl.isFullScreen) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
      }
    });
  }

  @override
  void dispose() {
    chewiectrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(controller: chewiectrl);
  }
}
