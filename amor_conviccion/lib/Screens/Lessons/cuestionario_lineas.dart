import 'package:amor_conviccion/utils/cuestionarios.dart';
import 'package:amor_conviccion/widgets/questionaire/abiertas/write_answer_widget.dart';
import 'package:amor_conviccion/widgets/questionaire/lines/unir_lineas.dart';
import 'package:flutter/material.dart';

import '../../widgets/questionaire/fail_widget.dart';
import '../../widgets/questionaire/success_widget.dart';

int puntos = 0; //calificacion inicial

class LineLessonScreen extends StatefulWidget {
  const LineLessonScreen(
      this.nombloq, this.bloque, this.nombre, this.completed, this.puntosl,
      {Key? key})
      : super(key: key);

  @override
  _LineLessonScreen createState() => _LineLessonScreen();

  final String nombloq;
  final int bloque; //Bloque de la leccion
  final String nombre; //Nombre de la leccion
  final bool completed;
  final int puntosl; //puntos que asigna la leccion
}

class _LineLessonScreen extends State<LineLessonScreen> {
  CuestionarioBloque bloque = CuestionarioBloque();

  TextEditingController txt1Controller = TextEditingController();
  TextEditingController txt2Controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  late var answers = ['', '', '', '', '', '', ''];
  late bool flag = true;
  @override
  void dispose() {
    puntos = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Completa los siguientes ejercicios!',
                style: TextStyle(
                    fontFamily: 'Comfortaa',
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: size.height * 0.005,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Une con una linea los recuadros azules con la respuesta correcta del recuadro  rojo!',
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontSize: size.width * 0.045,
                ),
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
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    WriteAnswer(
                      true,
                      bloque.liderazgo[4],
                      txt1Controller,
                      answers: (val) => setState(() => answers[4] = val),
                    ),
                    WriteAnswer(
                      false,
                      bloque.liderazgo[5],
                      txt2Controller,
                      answers: (val) => setState(() => answers[5] = val),
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    SizedBox(
                      height: size.height * 0.065,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            size.width * 0.25, 0, size.width * 0.25, 0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              results(puntos);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Favor de llenar los campos obligatorios')));
                            }
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const <Widget>[
                                Text('Siquiente'),
                                Icon(Icons.arrow_forward_rounded)
                              ]),
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: size.height * 0.03,
            ),
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
                ? SuccessScreen(widget.nombloq, widget.bloque, widget.nombre,
                    widget.completed, answers, widget.puntosl)
                : FailScreen(widget.puntosl)));
  }
}
