import 'package:amor_conviccion/services/UpdateInfo.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(this.nombloq, this.bloque, this.nombre, this.flag,
      this.questions, this.answers, this.puntos,
      {Key? key})
      : super(key: key);

  final String nombloq; //Nombre del bloque
  final int bloque; //Bloque de la leccion
  final String nombre; //Nombre de la leccion
  final bool flag; // Ya completo el curso anteriormente
  final List questions; //preguntas del cuestionario
  final List answers; //Respuestas del usuario
  final int puntos; //puntos del usuario
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    UpdatePoints update = UpdatePoints();
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GestureDetector(
              onTap: () {
                if (!flag) {
                  update.updatepoints(puntos);
                  UpdateLesson lesson = UpdateLesson();
                  lesson.updateLessonCompleted(
                      nombloq, bloque, nombre, questions, answers);
                }
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Container(
                width: size.width,
                height: size.height,
                color: const Color(0xFFFFFFFF),
                child: Column(
                  children: [
                    Text(questions.toString()),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          (!flag) ? '¡Enhorabuena!' : '¡Buen trabajo!',
                          style: TextStyle(fontSize: size.width * 0.1),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    (!flag)
                        ? Text(
                            '¡Ganaste!',
                            style: TextStyle(fontSize: size.width * 0.07),
                          )
                        : Container(),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                puntos.toString(),
                                style: TextStyle(fontSize: size.width * 0.1),
                              ),
                              Text(
                                'Puntos de amor',
                                style: TextStyle(fontSize: size.width * 0.04),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: size.width * 0.22,
                            child:
                                Image.asset('assets/Icons/noto_heartsuit.png'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.25,
                    ),
                    Text(
                      'Toca para continuar',
                      style: TextStyle(fontSize: size.width * 0.075),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
