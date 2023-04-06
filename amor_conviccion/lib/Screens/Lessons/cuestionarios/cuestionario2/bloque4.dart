import 'package:flutter/material.dart';

import '../../../../widgets/questionaire/abiertas/write_answer_widget.dart';
import '../../../../widgets/questionaire/results_button_widget.dart';

class Cuest2Bloq4 extends StatefulWidget {
  Cuest2Bloq4({Key? key}) : super(key: key);
  Map<String, bool> values = {
    'Responsabilidad': false,
    'Respeto': false,
    'Generosidad': false,
    'Comunicación': false,
    'Tolerancia': false,
    'Humildad': false,
    'Gratitud': false,
    'Honestidad': false,
    'Perdón': false
  };
  @override
  State<Cuest2Bloq4> createState() => _Cuest2Bloq4();
}

class _Cuest2Bloq4 extends State<Cuest2Bloq4> {
  late int page = 0;

  void changepage() {
    setState(() {
      if (page == 0) {
        page++;
      } else {
        page--;
      }
    });
  }

  List questions = [
    'Responsabilidad',
    'Respeto',
    'Generosidad',
    'Comunicación',
    'Tolerancia',
    'Humildad',
    'Gratitud',
    'Honestidad',
    'Perdón',
    'En relación con tus hijos  y en una escala del 1 al 10 ¿Te consideras un padre con autoridad?',
    '¿Qué considera que es lo más importante para tener un hijo(a) exitoso(a)?'
  ];
  late List answers = List.generate(11, (index) => '');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(child: page == 0 ? part1(size) : part2(size));
  }

  int cont = 0;
  late List keylist = widget.values.keys.toList();
  Widget part1(Size size) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Selecciona los valores que se practiquen en tu hogar',
            style: TextStyle(
              fontSize: size.width * 0.05,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: size.width,
          height: size.height * 0.7,
          child: ListView(
            shrinkWrap: true,
            children: widget.values.keys.map((String key) {
              return CheckboxListTile(
                checkColor: Colors.amber,
                title: Text(key),
                value: widget.values[key],
                onChanged: (value) {
                  setState(() {
                    widget.values[key] = !widget.values[key]!;
                  });
                },
              );
            }).toList(),
          ),
        ),
        Container(
          width: size.width * 0.4,
          height: size.height * 0.075,
          color: Colors.blue,
          child: ElevatedButton(
              onPressed: () => ({
                    for (int i = 0; i < keylist.length; i++)
                      {answers[i] = widget.values[keylist[i]]},
                    changepage()
                  }),
              child: const Icon(
                Icons.arrow_forward_rounded,
                size: 30,
              )),
        )
      ],
    );
  }

  var txtController = List.generate(2, (index) => TextEditingController());
  final _keyform = GlobalKey<FormState>();
  Widget part2(Size size) {
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          page = 0;
        });
        return false;
      },
      child: Form(
        key: _keyform,
        child: SizedBox(
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: size.width * 0.05, left: size.width * 0.05),
                child: WriteAnswer(
                  false,
                  questions[9],
                  txtController[0],
                  answers: (String val) => {
                    setState(() {
                      answers[9] = val;
                    })
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: size.width * 0.05, left: size.width * 0.05),
                child: WriteAnswer(
                  true,
                  questions[10],
                  txtController[1],
                  answers: (String val) => {
                    setState(() {
                      answers[10] = val;
                    })
                  },
                ),
              ),
              ResultButton()
                  .RBUtton(size, true, context, questions, answers, _keyform),
            ],
          ),
        ),
      ),
    );
  }
}
