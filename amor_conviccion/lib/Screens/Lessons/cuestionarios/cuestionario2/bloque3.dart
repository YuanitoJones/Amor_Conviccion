import 'package:amor_conviccion/utils/cuestionarios.dart';
import 'package:amor_conviccion/widgets/questionaire/abiertas/write_answer_widget.dart';
import 'package:amor_conviccion/widgets/questionaire/results_button_widget.dart';
import 'package:amor_conviccion/widgets/video/youtube_player_widget.dart';
import 'package:flutter/material.dart';

class Cuest2Bloq3 extends StatefulWidget {
  Cuest2Bloq3({Key? key}) : super(key: key);

  bool flag = false;

  @override
  State<Cuest2Bloq3> createState() => _Cuest2Bloq3();
}

class _Cuest2Bloq3 extends State<Cuest2Bloq3> {
  List<TextEditingController> txtcontroller =
      List.generate(2, (index) => TextEditingController());
  List<String> answers = ['', ''];
  List preguntas = CuestionarioBloque().intimidad2;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: (!widget.flag)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Video \'El pequeño Chango\'',
                  style: TextStyle(fontSize: size.width * 0.05),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Con la cámara de un celular escanea el código para ver el '
                    'vídeo, o selecciona la opción "ver video para verlo '
                    'dentro de la aplicación".',
                    style: TextStyle(fontSize: size.width * 0.045),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const YtPlayer()));
                        }),
                    child: Text(
                      'Ver video',
                      style: TextStyle(fontSize: size.width * 0.05),
                    )),
                SizedBox(
                  width: size.width * 0.45,
                  height: size.height * 0.06,
                  child: ElevatedButton(
                      onPressed: () => setState(
                            () {
                              widget.flag = !widget.flag;
                            },
                          ),
                      child: const Icon(
                        Icons.arrow_forward_rounded,
                        size: 30,
                      )),
                )
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WriteAnswer(true, preguntas[0], txtcontroller[0],
                    answers: (val) => setState(() => answers[0] = val)),
                WriteAnswer(true, preguntas[1], txtcontroller[1],
                    answers: (val) => setState(() => answers[1] = val)),
                ResultButton()
                    .RBUtton(size, true, context, preguntas, answers, null),
              ],
            ),
    );
  }
}
