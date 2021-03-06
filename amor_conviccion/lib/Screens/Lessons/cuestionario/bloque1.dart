import 'package:amor_conviccion/utils/cuestionarios.dart';
import 'package:flutter/material.dart';

import '../../../widgets/questionaire/question _field_widget.dart';
import '../../../widgets/questionaire/results_button_widget.dart';

class CuestBloq1 extends StatefulWidget {
  CuestBloq1(
      this.nombloq, this.bloque, this.nombre, this.completed, this.puntosl,
      {Key? key})
      : super(key: key);

  @override
  State<CuestBloq1> createState() => _CuestBloq1();

  int puntos = 0; //Puntuacion de evalacion inicial
  final String nombloq; //Nombre del bloque
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
        for (int i = 0; i < 9; i++)
          QuestionField(
            size,
            flag,
            mapa[i],
            qanswers[i],
            answersCallBack: (val) => setState(() => widget.puntos += val),
            answers: (val) => setState(() => answers[i] = val),
          ),
        Padding(
          padding: EdgeInsets.only(bottom: size.height * 0.03),
          child: ResultButton().RBUtton(
              size,
              result(widget.puntos),
              context,
              widget.nombloq,
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
