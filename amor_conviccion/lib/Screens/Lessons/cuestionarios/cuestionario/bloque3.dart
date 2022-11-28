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
  late List<String> answers = ['', '', '', '', '', ''];
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Escriba por cada dedo de la mano sus prioridades',
            style: TextStyle(
                color: Colors.black,
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.bold),
          ),
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.75,
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
                          controller: txtcontroller[index],
                          onChanged: (texto) {
                            answers[index] = texto;
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
                            fillColor: const Color.fromRGBO(242, 242, 242, 1),
                            hintText: ('Prioridad ${index + 1}'),
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  width: size.width * 0.4,
                  height: size.height * 0.06,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          changepage();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Favor de llenar todos los campos')));
                        }
                      },
                      child: const Icon(
                        Icons.arrow_forward_rounded,
                        size: 30,
                      )),
                ),
              ),
            ],
          ),
        ),
      ],
    );
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
                        answers[5] = value;
                        if (value == 'Otro. Explique') {
                          answers[5] = txtcontroller[5].text;
                          flag = true;
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
                onChanged: (text) => answers[5] = text,
              ),
            ),
          ElevatedButton(
              onPressed: () => changepage(),
              child: const Icon(Icons.arrow_back_rounded, size: 30)),
          if (answers[5] != '')
            ResultButton().RBUtton(
                size,
                true,
                context,
                [
                  'prioridad 1',
                  'prioridad 2',
                  'prioridad 3',
                  'prioridad 4',
                  'prioridad 5',
                  '¿Qué estrategias utilizarías para enriquecer el tiempo de '
                      'relación con tus hijos?'
                ],
                answers,
                null)
        ],
      ),
    );
  }
}
