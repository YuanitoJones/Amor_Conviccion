import 'package:amor_conviccion/services/UpdateInfo.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
  late ChewieController _chewieController,
      _chewieController2,
      _chewieController3,
      _chewieController4;
  late VideoPlayerController _videoPlayerController,
      _videoPlayerController2,
      _videoPlayerController3,
      _videoPlayerController4;

  @override
  initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(asset);
    cont++;
    asset = 'assets/videos/video$cont.mp4';
    _videoPlayerController2 = VideoPlayerController.asset(asset);
    cont++;
    asset = 'assets/videos/video$cont.mp4';
    _videoPlayerController3 = VideoPlayerController.asset(asset);
    cont++;
    asset = 'assets/videos/video$cont.mp4';
    _videoPlayerController4 = VideoPlayerController.asset(asset);
    //chewie1
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
        showControls: true);

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
    //chewie 2
    _chewieController2 = ChewieController(
        allowedScreenSleep: false,
        allowFullScreen: true,
        deviceOrientationsAfterFullScreen: [
          DeviceOrientation.portraitUp,
        ],
        videoPlayerController: _videoPlayerController2,
        aspectRatio: 2 / 3,
        autoInitialize: false,
        autoPlay: false,
        showControls: true);

    _chewieController2.addListener(() {
      if (_chewieController2.isFullScreen) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
      }
    });
    //chewie 3
    _chewieController3 = ChewieController(
        allowedScreenSleep: false,
        allowFullScreen: true,
        deviceOrientationsAfterFullScreen: [
          DeviceOrientation.portraitUp,
        ],
        videoPlayerController: _videoPlayerController3,
        aspectRatio: 2 / 3,
        autoInitialize: false,
        autoPlay: false,
        showControls: true);

    _chewieController3.addListener(() {
      if (_chewieController3.isFullScreen) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
      }
    });
    //chewie 4
    _chewieController4 = ChewieController(
        allowedScreenSleep: false,
        allowFullScreen: true,
        deviceOrientationsAfterFullScreen: [
          DeviceOrientation.portraitUp,
        ],
        videoPlayerController: _videoPlayerController4,
        aspectRatio: 2 / 3,
        autoInitialize: false,
        autoPlay: false,
        showControls: true);

    _chewieController4.addListener(() {
      if (_chewieController4.isFullScreen) {
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
    _videoPlayerController.dispose();
    _videoPlayerController2.dispose();
    _videoPlayerController3.dispose();
    _videoPlayerController4.dispose();
    _chewieController.dispose();
    _chewieController2.dispose();
    _chewieController3.dispose();
    _chewieController4.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
                height: size.height * 0.8,
                child: Stack(
                  children: [
                    Positioned(
                      top: size.height * 0.4,
                      right: 0,
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: size.height * 0.03,
                        color: Colors.black54,
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.4,
                      left: 0,
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: size.height * 0.03,
                        color: Colors.black54,
                      ),
                    ),
                    CarouselSlider(
                      items: [
                        Chewie(controller: _chewieController),
                        Chewie(controller: _chewieController2),
                        Chewie(controller: _chewieController3),
                        Chewie(controller: _chewieController4),
                      ],
                      options: CarouselOptions(
                          aspectRatio: 2 / 3,
                          enableInfiniteScroll: false,
                          initialPage: 0,
                          enlargeCenterPage: true,
                          viewportFraction: 0.9),
                    )
                  ],
                )),
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
                  Container(
                    height: size.height * 0.07,
                    width: size.width * 0.4,
                    child: ElevatedButton(
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
