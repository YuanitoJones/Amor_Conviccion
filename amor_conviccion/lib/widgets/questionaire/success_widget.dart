import 'package:amor_conviccion/services/UpdateInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen(
      this.bloque, this.nombre, this.flag, this.answers, this.puntos,
      {Key? key})
      : super(key: key);

  final int bloque;
  final String nombre;
  final bool flag;
  final List answers;
  final int puntos;
  @override
  _SuccessScreen createState() => _SuccessScreen();
}

class _SuccessScreen extends State<SuccessScreen> {
  late bool flag = widget.flag;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: updatepoints(widget.bloque, widget.nombre),
    );
  }

  Widget updatepoints(int bloque, String name) {
    Size size = MediaQuery.of(context).size;
    UpdatePoints update = UpdatePoints();

    return GestureDetector(
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
          color: Colors.lightGreen,
          height: size.height,
          width: size.width,
          child: mensaje(),
        ));
  }

  Widget mensaje() {
    switch (widget.bloque) {
      case 1:
        return (flag)
            ? Center(
                child: Text(
                    'El curso ya se habia completdo anteriormente, ya no se asiganarán puntos.\nToca para continuar'))
            : Center(
                child: Text(
                    'Felicidades!\nAprobaste el curso y has obtenido ${widget.puntos} puntos\nToca para continuar'));
      case 2:
        if (widget.nombre == 'cuestionario 2') {
          return (flag)
              ? Center(
                  child: Text(
                      'El curso ya se habia completdo anteriormente, ya no se asiganarán puntos.\nToca para continuar'))
              : Center(
                  child: Text(
                      'Felicidades!\nAprobaste el curso y has obtenido ${widget.puntos} puntos\nToca para continuar'));
        } else {
          return Center(
              child: Text(
                  'Gracias por responder, apreciamos mucho tu sinceridad!!'));
        }
        break;
      default:
        return Container();
    }
  }
}
