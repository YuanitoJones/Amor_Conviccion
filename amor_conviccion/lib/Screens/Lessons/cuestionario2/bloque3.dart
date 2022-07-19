import 'package:amor_conviccion/utils/cuestionarios.dart';
import 'package:amor_conviccion/widgets/questionaire/abiertas/write_answer_widget.dart';
import 'package:amor_conviccion/widgets/questionaire/results_button_widget.dart';
import 'package:amor_conviccion/widgets/video/youtube_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Cuest2Bloq3 extends StatefulWidget {
  Cuest2Bloq3(
      this.nombloq, this.bloque, this.nombre, this.completed, this.puntosl,
      {Key? key})
      : super(key: key);

  bool flag = false;
  final String nombloq; //Nombre del bloque
  final int bloque; //Bloque de la leccion
  final String nombre; //Nombre de la leccion
  final bool completed; //Se completo la lecion anteriormente
  final int puntosl; //puntos que asigna la leccion

  @override
  State<Cuest2Bloq3> createState() => _Cuest2Bloq3();
}

class _Cuest2Bloq3 extends State<Cuest2Bloq3> {
  late YoutubePlayerController _controller;

  List<TextEditingController> txtcontroller =
      List.generate(2, (index) => TextEditingController());
  List<String> answers = ['', ''];
  List preguntas = CuestionarioBloque().intimidad2;

  @override
  void initState() {
    super.initState();
    const video = 'https://youtu.be/7eO_23yq3pI';
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(video)!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        loop: false,
        isLive: false,
        forceHD: false,
      ),
    );
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: (!widget.flag)
            ? OrientationBuilder(
                builder: (BuildContext context, Orientation orientation) {
                  if (orientation == Orientation.landscape) {
                    return YtPlayer(_controller);
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('Video \'El pequeño Chango\''),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Con la cámara de un celular escanea el código para ver el '
                              'vídeo, o selecciona la opción "ver video para verlo '
                              'dentro de la aplicación".',
                              style: TextStyle(fontSize: size.width * 0.04),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          SizedBox(
                            width: size.width * 0.5,
                            child: Image.asset(
                              'assets/Icons/pequeno_chango.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          TextButton(
                              onPressed: () => setState(() {
                                    _controller.toggleFullScreenMode();
                                  }),
                              child: Text(
                                'Ver video',
                                style: TextStyle(fontSize: size.width * 0.05),
                              )),
                          ElevatedButton.icon(
                              label: Text('Siguiente'),
                              icon: Icon(Icons.arrow_forward_rounded),
                              onPressed: () => setState(() {
                                    widget.flag = !widget.flag;
                                  })),
                        ],
                      ),
                    );
                  }
                },
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WriteAnswer(true, preguntas[0], txtcontroller[0],
                      answers: (val) => setState(() => answers[0] = val)),
                  WriteAnswer(true, preguntas[0], txtcontroller[0],
                      answers: (val) => setState(() => answers[0] = val)),
                  ResultButton().RBUtton(
                      size,
                      true,
                      context,
                      widget.nombloq,
                      widget.bloque,
                      widget.nombre,
                      widget.completed,
                      answers,
                      widget.puntosl),
                ],
              ));
  }
}
