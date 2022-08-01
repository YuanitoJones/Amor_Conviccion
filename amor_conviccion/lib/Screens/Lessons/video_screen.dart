import 'package:amor_conviccion/services/UpdateInfo.dart';
import 'package:amor_conviccion/widgets/carrousel_widget.dart';
import 'package:amor_conviccion/widgets/video/chewie_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen(this.nombloq, this.bloque, this.nombre, this.flag,
      {Key? key})
      : super(key: key);

  final String nombloq; // Nombre del bloque
  final int bloque; //Bloque de lecciones
  final String nombre; //Nombre de leccion
  final bool flag; //Leccion completada

  @override
  State<StatefulWidget> createState() => _VideoPlayerScreen();
}

class _VideoPlayerScreen extends State<VideoPlayerScreen> {
  late int cont = (widget.bloque == 1) ? 1 : 5;
  late String asset = 'assets/videos/video$cont.mp4';

  final List _videoPlayerController =
      List.generate(4, (index) => VideoPlayerController);

  CarouselController carouselController = CarouselController();

  @override
  initState() {
    super.initState();

    for (int i = 0; i < _videoPlayerController.length; i++) {
      _videoPlayerController[i] = VideoPlayerController.asset(asset);
      cont++;
      asset = 'assets/videos/video$cont.mp4';
    }
  }

  @override
  void dispose() {
    for (int i = 0; i < _videoPlayerController.length; i++) {
      _videoPlayerController[i].dispose();
    }
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List chewies = List.generate(_videoPlayerController.length,
        (index) => ChewieWidget(_videoPlayerController[index]));
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              height: size.height * 0.8,
              child: CarrouselWidget(chewies),
            ),
            SizedBox(
              height: size.height * 0.07,
              width: size.width * 0.4,
              child: ElevatedButton(
                onPressed: () {
                  UpdateLesson lesson = UpdateLesson();
                  if (!widget.flag) {
                    lesson.updateCompleted(widget.nombloq, widget.nombre);
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
