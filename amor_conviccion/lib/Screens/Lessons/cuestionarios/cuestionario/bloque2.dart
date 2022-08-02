import 'package:flutter/material.dart';

import '../../../../utils/cuestionarios.dart';
import '../../../../widgets/questionaire/abiertas/write_answer_widget.dart';
import '../../../../widgets/questionaire/results_button_widget.dart';

class CuestBloq2 extends StatefulWidget {
  CuestBloq2({Key? key}) : super(key: key);

  int puntos = 0; //Puntuacion de evaluacion inicial

  @override
  State<CuestBloq2> createState() => _CuestBloq2();
}

class _CuestBloq2 extends State<CuestBloq2> {
  CuestionarioBloque cuestionario = CuestionarioBloque();
  late var lista = cuestionario.liderazgo2;
  late List<String> answers = List.generate(3, (index) => '');

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
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Responde las preguntas',
                style: TextStyle(
                    fontSize: size.width * 0.055, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: size.height * 0.6,
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return WriteAnswer(true, lista[index], txtcontroller[index],
                        answers: (val) => setState(() => answers[index] = val));
                  }),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            ResultButton().RBUtton(size, true, context, answers, null),
          ],
        ));
  }
}
