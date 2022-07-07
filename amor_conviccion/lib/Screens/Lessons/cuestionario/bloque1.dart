import 'package:amor_conviccion/utils/cuestionarios.dart';
import 'package:flutter/material.dart';

import '../../../widgets/questionaire/question _field_widget.dart';
import '../../../widgets/questionaire/results_button_widget.dart';

class CuestBloq1 extends StatefulWidget {
  CuestBloq1(this.bloque, this.nombre, this.completed, this.puntosl, {Key? key})
      : super(key: key);

  @override
  _CuestBloq1 createState() => _CuestBloq1();

  int puntos = 0; //Puntuacion de evalacion inicial
  final int bloque; //Bloque de ejercicio
  final String nombre; //Nombre de la leccion
  final bool completed; //Se ha completado antes la leccion (otorga puntos o no)
  final int puntosl; //Puntos que otorga la leccion

}

class _CuestBloq1 extends State<CuestBloq1> {
  CuestionarioBloque cuestionario = CuestionarioBloque();
  late var mapa = cuestionario.drogodependencia;
  late bool flag = true;
  late var answers = ['', '', '', '', '', '', '', '', ''];
  late var qanswers = [2, 1, 2, 1, 3, 2, 1, 3, 2];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Pon a prueba tu conocimiento!',
            style: TextStyle(
                fontFamily: 'Comfortaa',
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        QuestionField(
          size,
          flag,
          mapa[0],
          qanswers[0],
          answersCallBack: (val) => setState(() => widget.puntos += val),
          answers: (val) => setState(() => answers[0] = val),
        ),
        QuestionField(
          size,
          flag,
          mapa[1],
          qanswers[1],
          answersCallBack: (val) => setState(() => widget.puntos += val),
          answers: (val) => setState(() => answers[1] = val),
        ),
        QuestionField(
          size,
          flag,
          mapa[2],
          qanswers[2],
          answersCallBack: (val) => setState(() => widget.puntos += val),
          answers: (val) => setState(() => answers[2] = val),
        ),
        QuestionField(
          size,
          flag,
          mapa[3],
          qanswers[3],
          answersCallBack: (val) => setState(() => widget.puntos += val),
          answers: (val) => setState(() => answers[3] = val),
        ),
        QuestionField(
          size,
          flag,
          mapa[4],
          qanswers[4],
          answersCallBack: (val) => setState(() => widget.puntos += val),
          answers: (val) => setState(() => answers[4] = val),
        ),
        QuestionField(
          size,
          flag,
          mapa[5],
          qanswers[5],
          answersCallBack: (val) => setState(() => widget.puntos += val),
          answers: (val) => setState(() => answers[5] = val),
        ),
        QuestionField(
          size,
          flag,
          mapa[6],
          qanswers[6],
          answersCallBack: (val) => setState(() => widget.puntos += val),
          answers: (val) => setState(() => answers[6] = val),
        ),
        QuestionField(
          size,
          flag,
          mapa[7],
          qanswers[7],
          answersCallBack: (val) => setState(() => widget.puntos += val),
          answers: (val) => setState(() => answers[7] = val),
        ),
        QuestionField(
          size,
          flag,
          mapa[8],
          qanswers[8],
          answersCallBack: (val) => setState(() => widget.puntos += val),
          answers: (val) => setState(() => answers[8] = val),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: size.height * 0.03),
          child: ResultButton().RBUtton(
              size,
              result(widget.puntos),
              context,
              widget.bloque,
              widget.nombre,
              widget.completed,
              answers,
              widget.puntosl),
        ),
      ],
    );
  }

  bool result(int points) {
    if (points >= 6) {
      return true;
    }
    return false;
  }
}
