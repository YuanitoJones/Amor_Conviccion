import 'package:amor_conviccion/utils/cuestionarios.dart';
import 'package:amor_conviccion/widgets/questionaire/abiertas/write_answer_widget.dart';
import 'package:amor_conviccion/widgets/questionaire/lines/unir_lineas.dart';
import 'package:flutter/material.dart';

import '../../widgets/questionaire/fail_widget.dart';
import '../../widgets/questionaire/success_widget.dart';

int puntos = 0; //calificacion inicial

class LineLessonScreen extends StatefulWidget {
  LineLessonScreen(this.bloque, this.nombre, this.completed, this.puntosl,
      {Key? key})
      : super(key: key);

  _LineLessonScreen createState() => _LineLessonScreen();

  final int bloque; //Bloque de la leccion
  final String nombre; //Nombre de la leccion
  final bool completed;
  final int puntosl; //puntos que asigna la leccion
}

class _LineLessonScreen extends State<LineLessonScreen> {
  CuestionarioBloque bloque = CuestionarioBloque();

  late var answers = ['', '', '', '', '', '', ''];
  late bool flag = true;
  @override
  void dispose() {
    puntos = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Completa los siguientes ejercicios!',
                style: TextStyle(
                    fontFamily: 'Comfortaa',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            LinesScreen(
              bloque.liderazgo[0],
              1,
              answersCallBack: (val) => setState(() => puntos += val),
              answers: (val) => setState(() => answers[0] = val),
            ),
            Divider(
              color: Colors.yellow[700],
              indent: 10,
              thickness: 3,
            ),
            LinesScreen(
              bloque.liderazgo[1],
              2,
              answersCallBack: (val) => setState(() => puntos += val),
              answers: (val) => setState(() => answers[1] = val),
            ),
            Divider(
              color: Colors.yellow[700],
              indent: 10,
              thickness: 3,
            ),
            LinesScreen(
              bloque.liderazgo[2],
              1,
              answersCallBack: (val) => setState(() => puntos += val),
              answers: (val) => setState(() => answers[2] = val),
            ),
            Divider(
              color: Colors.yellow[700],
              indent: 10,
              thickness: 3,
            ),
            LinesScreen(
              bloque.liderazgo[3],
              3,
              answersCallBack: (val) => setState(() => puntos += val),
              answers: (val) => setState(() => answers[3] = val),
            ),
            Divider(
              color: Colors.yellow[700],
              indent: 10,
              thickness: 3,
            ),
            WriteAnswer(
              true,
              bloque.liderazgo[4],
              answers: (val) => setState(() => answers[4] = val),
            ),
            WriteAnswer(
              false,
              bloque.liderazgo[5],
              answers: (val) => setState(() => answers[5] = val),
            ),
            ElevatedButton(
                onPressed: () => results(puntos), child: const Text('Terminar'))
          ],
        ),
      ),
    ));
  }

  void results(int points) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => (points >= 3)
                ? SuccessScreen(widget.bloque, widget.nombre, widget.completed,
                    answers, widget.puntosl)
                : FailScreen()));
  }
}
