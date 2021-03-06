import 'package:amor_conviccion/utils/cuestionarios.dart';
import 'package:amor_conviccion/widgets/questionaire/abiertas/write_answer_widget.dart';
import 'package:amor_conviccion/widgets/questionaire/lines/unir_lineas.dart';
import 'package:flutter/material.dart';

import '../../../widgets/questionaire/fail_widget.dart';
import '../../../widgets/questionaire/success_widget.dart';

int puntos = 0; //calificacion inicial

class Cuest2Bloq2 extends StatefulWidget {
  const Cuest2Bloq2(
      this.nombloq, this.bloque, this.nombre, this.completed, this.puntosl,
      {Key? key})
      : super(key: key);

  @override
  _Cuest2Bloq2 createState() => _Cuest2Bloq2();

  final String nombloq; //Nombre del bloque
  final int bloque; //Bloque de la leccion
  final String nombre; //Nombre de la leccion
  final bool completed; //Se completo la lecion anteriormente
  final int puntosl; //puntos que asigna la leccion
}

class _Cuest2Bloq2 extends State<Cuest2Bloq2> {
  CuestionarioBloque bloque = CuestionarioBloque();

  List<TextEditingController> txtcontroller =
      List.generate(2, (index) => TextEditingController());

  final _formKey = GlobalKey<FormState>();

  late var answers = ['', '', '', '', '', '', ''];
  late var opc = [1, 2, 1, 3];
  late bool flag = true;
  @override
  void dispose() {
    puntos = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
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
        for (int i = 0; i < 4; i++)
          Column(
            children: <Widget>[
              LinesScreen(bloque.liderazgo[i], opc[i],
                  answersCallBack: (val) => setState(() => puntos += val),
                  answers: (val) => setState(() => answers[0] = val)),
              Divider(
                color: Colors.yellow[700],
                indent: 10,
                thickness: 3,
              ),
            ],
          ),
        Form(
            key: _formKey,
            child: Column(
              children: [
                WriteAnswer(
                  true,
                  bloque.liderazgo[4]![0],
                  txtcontroller[0],
                  answers: (val) => setState(() => answers[4] = val),
                ),
                WriteAnswer(
                  false,
                  bloque.liderazgo[5]![0],
                  txtcontroller[1],
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
    );
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
