import 'package:flutter/material.dart';

import '../../../../utils/cuestionarios.dart';
import '../../../../widgets/questionaire/results_button_widget.dart';

class CuestBloq3 extends StatefulWidget {
  CuestBloq3({Key? key}) : super(key: key);

  bool flag = false;
  @override
  State<CuestBloq3> createState() => _CuestBloq3();
}

CuestionarioBloque preguntas = CuestionarioBloque();

class _CuestBloq3 extends State<CuestBloq3> {
  CuestionarioBloque cuestionario = CuestionarioBloque();
  late var mapa = cuestionario.intimidad;
  late List<String> answers2 = ['', '', '', '', '', ''];
  late int page = 0;

  List<TextEditingController> txtcontroller =
      List.generate(6, (i) => TextEditingController());

  late List<String> opc = CuestionarioBloque().intimidad;
  String selectedValue = 'pending';

  final _formKey = GlobalKey<FormState>();

  bool flag = false;
  void changepage() {
    setState(() {
      if (page == 0) {
        page++;
      } else {
        page--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return (page == 0) ? part1(size) : part2(size);
  }

  Widget part1(Size size) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Escriba por cada dedo de la mano sus prioridades',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Comfortaa',
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: size.height * 0.7,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(
                          size.width * 0.05,
                          size.height * 0.02,
                          size.width * 0.05,
                          size.height * 0.02),
                      child: TextFormField(
                        onChanged: (texto) {
                          answers2[index] = texto;
                        },
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: size.width * 0.045,
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => value != null && value.isEmpty
                            ? 'No debe estar vacio'
                            : null,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                          counterText: "",
                          filled: true,
                          fillColor: const Color.fromRGBO(220, 220, 220, 1),
                        ),
                      ),
                    );
                  }),
            ),
            ElevatedButton(
                onPressed: () => changepage(), child: const Text('Siguiente'))
          ],
        ));
  }

  Widget part2(Size size) {
    return SizedBox(
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding:
                EdgeInsets.fromLTRB(size.width * 0.1, 0, size.width * 0.1, 0),
            child: Text(
              '¿Qué estrategias utilizarías para enriquecer el tiempo de '
              'relacion con tus hijos?',
              style: TextStyle(fontSize: size.width * 0.045),
            ),
          ),
          Column(
            children: opc.map((value) {
              return RadioListTile<String>(
                  activeColor: Colors.orange,
                  value: value,
                  groupValue: selectedValue,
                  title: Text(value),
                  onChanged: (value) => setState(() {
                        selectedValue = value!;
                        answers2[5] = value;
                        if (value == 'Otro. Explique') {
                          flag = true;
                          answers2[5] = txtcontroller[5].text;
                        }
                        if (value != 'Otro. Explique') flag = false;
                      }));
            }).toList(),
          ),
          if (flag)
            SizedBox(
              width: size.width * 0.8,
              child: TextFormField(
                controller: txtcontroller[5],
              ),
            ),
          ElevatedButton(
              onPressed: () => changepage(), child: const Text('Atrás')),
          ResultButton().RBUtton(size, true, context, answers2)
        ],
      ),
    );
  }
}
