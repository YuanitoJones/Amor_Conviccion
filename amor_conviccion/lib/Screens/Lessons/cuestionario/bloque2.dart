import 'package:flutter/material.dart';

import '../../../utils/cuestionarios.dart';
import '../../../widgets/questionaire/abiertas/write_answer_widget.dart';
import '../../../widgets/questionaire/results_button_widget.dart';

class CuestBloq2 extends StatefulWidget {
  CuestBloq2(
      this.nombloq, this.bloque, this.nombre, this.completed, this.puntosl,
      {Key? key})
      : super(key: key);

  int puntos = 0; //Puntuacion de evalacion inicial
  final String nombloq; //Nombre del bloque
  final int bloque; //Bloque de ejercicio
  final String nombre; //Nombre de la leccion
  final bool completed; //Se ha completado antes la leccion (otorga puntos o no)
  final int puntosl; //Puntos que otorga la leccion

  @override
  _CuestBloq2 createState() => _CuestBloq2();
}

class _CuestBloq2 extends State<CuestBloq2> {
  CuestionarioBloque cuestionario = CuestionarioBloque();
  late var lista = cuestionario.liderazgo2;
  late var answers2 = ['', '', ''];

  List<TextEditingController> txtcontroller =
      List.generate(3, (i) => TextEditingController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
        key: _formKey,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Responde las preguntas',
                style: TextStyle(
                    fontFamily: 'Comfortaa',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: size.height * 0.6,
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return WriteAnswer(true, lista[index], txtcontroller[index],
                        answers: (val) =>
                            setState(() => answers2[index] = val));
                  }),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            ResultButton().RBUtton(
                size,
                true,
                context,
                widget.nombloq,
                widget.bloque,
                widget.nombre,
                widget.completed,
                answers2,
                widget.puntosl),
          ],
        ));
  }
}
