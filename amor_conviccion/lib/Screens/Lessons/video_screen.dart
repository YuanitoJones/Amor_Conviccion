import 'dart:async';

import 'package:amor_conviccion/Screens/Lessons/lesson_selection_screen.dart';
import 'package:amor_conviccion/services/UpdateInfo.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import '../../services/authentication.dart';

class VideoPlayerScreen extends StatefulWidget{
  const VideoPlayerScreen(this.bloque, this.nombre, {Key? key}) : super(key: key);

  final int bloque;
  final String nombre;

  @override
  State<StatefulWidget> createState() => _VideoPlayerScreen();

}

class _VideoPlayerScreen extends State<VideoPlayerScreen> {

  final asset = 'assets/videos/verdad_dolor.mp4';
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  @override
  initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(asset);
    _chewieController = ChewieController(
      allowedScreenSleep: false,
      allowFullScreen: true,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
      videoPlayerController: _videoPlayerController,
      aspectRatio: _videoPlayerController.value.aspectRatio,
      autoInitialize: false,
      autoPlay: true,
      showControls: true,
    );
    _chewieController.addListener(() {
      if (_chewieController.isFullScreen) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      }
    });
    _videoPlayerController.addListener(() {
      if (_videoPlayerController.value.position ==
          _videoPlayerController.value.duration) {
        UpdateLesson lesson = UpdateLesson();
        lesson.updateVideoCompleted(widget.bloque, widget.nombre);
      }
    });
  }
  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Chewie(
            controller: _chewieController,
          ),
        ),
      ),
    );
  }
}