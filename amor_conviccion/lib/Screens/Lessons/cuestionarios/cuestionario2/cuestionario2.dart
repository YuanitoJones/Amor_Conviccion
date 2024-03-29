import 'package:amor_conviccion/Screens/Lessons/cuestionarios/cuestionario2/bloque5.dart';
import 'package:amor_conviccion/models/lessons_model.dart';
import 'package:flutter/material.dart';

import 'bloque2.dart';
import 'bloque3.dart';
import 'bloque4.dart';

class Cuestionario2Screen extends StatefulWidget {
  const Cuestionario2Screen({Key? key}) : super(key: key);

  @override
  State<Cuestionario2Screen> createState() => _Cuestionario2Screen();
}

class _Cuestionario2Screen extends State<Cuestionario2Screen> {
  @override
  Widget build(BuildContext context) {
    final lessonsModel =
        context.dependOnInheritedWidgetOfExactType<LessonsModel>();

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background/standard.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
                child: (lessonsModel!.bloque == 2)
                    ? const Cuest2Bloq2()
                    : (lessonsModel.bloque == 3)
                        ? Cuest2Bloq3()
                        : (lessonsModel.bloque == 4)
                            ? Cuest2Bloq4()
                            : (lessonsModel.bloque == 5)
                                ? const Cuest2Bloq5()
                                : Container()),
          )),
    );
  }
}
