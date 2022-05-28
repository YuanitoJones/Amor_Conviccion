import 'package:amor_conviccion/services/UpdateInfo.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen(this.bloque, this.nombre, this.flag, {Key? key})
      : super(key: key);

  final int bloque; //Bloque de lecciones
  final String nombre; //Nombre de leccion
  final bool flag; //Leccion completada

  @override
  State<StatefulWidget> createState() => _VideoPlayerScreen();
}

class _VideoPlayerScreen extends State<VideoPlayerScreen> {
  late int cont = (widget.bloque == 1) ? 1 : 4;
  late String asset = 'assets/videos/video$cont.mp4';
  late ChewieController _chewieController;
  late VideoPlayerController _videoPlayerController;
  @override
  initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(asset);
    _chewieController = ChewieController(
      allowedScreenSleep: false,
      allowFullScreen: true,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitUp,
      ],
      videoPlayerController: _videoPlayerController,
      aspectRatio: 2 / 3,
      autoInitialize: false,
      autoPlay: false,
      showControls: true,
    );
    _chewieController.addListener(() {
      if (_chewieController.isFullScreen) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
      }
    });
    _videoPlayerController.addListener(() {
      if (_videoPlayerController.value.position ==
          _videoPlayerController.value.duration) {
        UpdateLesson lesson = UpdateLesson();
        if (!widget.flag) {
          switch (widget.bloque) {
            case 1:
              lesson.updateVideoCompleted('Drogodependencia', widget.nombre);
              break;
            case 2:
              lesson.updateVideoCompleted('Liderazgo', widget.nombre);
              break;
          }
        }
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.bloque == 2) {
      cont = 5;
    }
    asset = 'assets/videos/video$cont.mp4';
    print(asset);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.8,
              child: Chewie(
                controller: _chewieController,
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            SizedBox(
              height: size.height * 0.08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /*ElevatedButton(
                    onPressed: () {
                      if (cont == 1) {
                        Navigator.pop(context);
                      } else {
                        cont--;
                      }
                      setState(() {});
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.arrow_back_rounded),
                          const Text('Anterior'),
                        ]),
                  ),*/
                  ElevatedButton(
                    onPressed: () {
                      UpdateLesson lesson = UpdateLesson();
                      if (!widget.flag) {
                        switch (widget.bloque) {
                          case 1:
                            lesson.updateVideoCompleted(
                                'Drogodependencia', widget.nombre);
                            break;
                          case 2:
                            lesson.updateVideoCompleted(
                                'Liderazgo', widget.nombre);
                            break;
                        }
                      }
                      Navigator.pop(context);
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          const Text('Siquiente'),
                          Icon(Icons.arrow_forward_rounded)
                        ]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
