import 'package:amor_conviccion/services/UpdateInfo.dart';
import 'package:amor_conviccion/widgets/video/chewie_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
  late int cont = (widget.bloque == 1) ? 1 : 5;
  late String asset = 'assets/videos/video$cont.mp4';
  late VideoPlayerController _videoPlayerController,
      _videoPlayerController2,
      _videoPlayerController3,
      _videoPlayerController4;

  CarouselController carouselController = CarouselController();

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
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _videoPlayerController2.dispose();
    _videoPlayerController3.dispose();
    _videoPlayerController4.dispose();
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
              height: size.height * 0.02,
            ),
            SizedBox(
                height: size.height * 0.8,
                child: Stack(
                  children: [
                    Center(
                      child: CarouselSlider(
                        carouselController: carouselController,
                        items: [
                          ChewieWidget(_videoPlayerController),
                          ChewieWidget(_videoPlayerController2),
                          ChewieWidget(_videoPlayerController3),
                          ChewieWidget(_videoPlayerController4),
                        ],
                        options: CarouselOptions(
                            aspectRatio: 2 / 3,
                            enableInfiniteScroll: false,
                            initialPage: 0,
                            enlargeCenterPage: true,
                            viewportFraction: 0.95),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ClipOval(
                        child: Container(
                          color: Colors.black54,
                          child: IconButton(
                            onPressed: () {
                              // Use the controller to change the current page
                              carouselController.nextPage();
                            },
                            icon: const Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ClipOval(
                        child: Container(
                          color: Colors.black54,
                          child: IconButton(
                            onPressed: () {
                              // Use the controller to change the current page
                              carouselController.previousPage();
                            },
                            icon: const Icon(
                              Icons.arrow_back_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: size.height * 0.07,
              width: size.width * 0.4,
              child: ElevatedButton(
                onPressed: () {
                  UpdateLesson lesson = UpdateLesson();
                  if (!widget.flag) {
                    switch (widget.bloque) {
                      case 1:
                        lesson.updateCompleted(
                            'Drogodependencia', widget.nombre);
                        break;
                      case 2:
                        lesson.updateCompleted('Liderazgo', widget.nombre);
                        break;
                    }
                  }
                  Navigator.pop(context);
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const <Widget>[
                      Text('Siquiente'),
                      Icon(Icons.arrow_forward_rounded)
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
