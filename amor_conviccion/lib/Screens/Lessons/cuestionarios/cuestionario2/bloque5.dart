import 'package:amor_conviccion/utils/cuestionarios.dart';
import 'package:amor_conviccion/widgets/questionaire/abiertas/write_answer_widget.dart';
import 'package:amor_conviccion/widgets/questionaire/results_button_widget.dart';
import 'package:flutter/material.dart';

class Cuest2Bloq5 extends StatefulWidget {
  const Cuest2Bloq5({Key? key}) : super(key: key);

  @override
  State<Cuest2Bloq5> createState() => _Cuest2Bloq5();
}

class _Cuest2Bloq5 extends State<Cuest2Bloq5> {
  final amorPerdon = CuestionarioBloque().amorYPerdon2;
  final _formKey = GlobalKey<FormState>();

  List<TextEditingController> txtcontroller =
      List.generate(6, (index) => TextEditingController());

  late List<String> answers = List.generate(amorPerdon.length, (index) => '');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: SizedBox(
        width: size.width * 0.9,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < amorPerdon.length; i++)
                WriteAnswer(
                  true,
                  amorPerdon[i],
                  txtcontroller[i],
                  answers: (String val) => setState(() {
                    answers[i] = val;
                  }),
                ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.01, bottom: size.height * 0.02),
                child: SizedBox(
                  child: ResultButton().RBUtton(
                      size, true, context, amorPerdon, answers, _formKey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
