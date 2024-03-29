import 'package:amor_conviccion/Screens/Lessons/cuestionarios/cuestionario/bloque1.dart';
import 'package:amor_conviccion/Screens/Lessons/cuestionarios/cuestionario/bloque2.dart';
import 'package:amor_conviccion/Screens/Lessons/cuestionarios/cuestionario/bloque3.dart';
import 'package:amor_conviccion/Screens/Lessons/cuestionarios/cuestionario/bloque4/bloque4.dart';
import 'package:amor_conviccion/models/lessons_model.dart';
import 'package:flutter/material.dart';

import 'bloque5.dart';

class CuestionarioScreen extends StatefulWidget {
  CuestionarioScreen({Key? key}) : super(key: key);

  @override
  State<CuestionarioScreen> createState() => _CuestionarioScreen();
}

class _CuestionarioScreen extends State<CuestionarioScreen> {
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
                child: (lessonsModel!.bloque == 1)
                    ? CuestBloq1()
                    : (lessonsModel.bloque == 2)
                        ? CuestBloq2()
                        : (lessonsModel.bloque == 3)
                            ? CuestBloq3()
                            : (lessonsModel.bloque == 4)
                                ? const CuestBloq4()
                                : (lessonsModel.bloque == 5)
                                    ? CuestBloq5()
                                    : Container()),
          )),
    );
  }
}
