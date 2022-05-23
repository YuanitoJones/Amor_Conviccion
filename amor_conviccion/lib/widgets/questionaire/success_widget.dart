import 'package:amor_conviccion/services/UpdateInfo.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen(
      this.bloque, this.nombre, this.flag, this.answers, this.puntos,
      {Key? key})
      : super(key: key);

  final int bloque; //Bloque de la leccion
  final String nombre; //Nombre de la leccion
  final bool flag; // Ya completo el curso anteriormente
  final List answers; //Respuestas del usuario
  final int puntos; //puntos del usuario
  @override
  _SuccessScreen createState() => _SuccessScreen();
}

class _SuccessScreen extends State<SuccessScreen> {
  late bool flag = widget.flag;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    UpdatePoints update = UpdatePoints();
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              if (!flag) {
                update.updatepoints(widget.puntos);
                UpdateLesson lesson = UpdateLesson();
                lesson.updateLessonCompleted(
                    widget.bloque, widget.nombre, widget.answers);
              }
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Container(
              width: size.width,
              height: size.height,
              color: const Color(0xFFFFFFFF),
            ),
          ),
          updatepoints(size, widget.bloque, widget.nombre),
        ],
      ),
    );
  }

  Widget updatepoints(Size size, int bloque, String name) {
    return SafeArea(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              (!flag) ? '¡Enhorabuena!' : '¡Buen trabajo!',
              style: const TextStyle(fontFamily: 'Comfortaa', fontSize: 40),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.1,
        ),
        (!flag)
            ? const Text(
                '¡Ganaste!',
                style: TextStyle(fontFamily: 'Comfortaa', fontSize: 35),
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
                    widget.puntos.toString(),
                    style:
                        const TextStyle(fontFamily: 'Comfortaa', fontSize: 40),
                  ),
                  const Text(
                    'Puntos de amor',
                    style: TextStyle(fontFamily: 'Comfortaa', fontSize: 15),
                  ),
                ],
              ),
              Container(
                width: size.width * 0.22,
                child: Image.asset('assets/Icons/noto_heartsuit.png'),
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * 0.25,
        ),
        const Text(
          'Toca para continuar',
          style: TextStyle(fontFamily: 'Comfortaa', fontSize: 30),
        ),
      ],
    ));
  }
}
