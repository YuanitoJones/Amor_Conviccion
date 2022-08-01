import 'package:amor_conviccion/Screens/Lessons/cuestionarios/cuestionario/bloque1.dart';
import 'package:amor_conviccion/Screens/Lessons/cuestionarios/cuestionario/bloque2.dart';
import 'package:amor_conviccion/Screens/Lessons/cuestionarios/cuestionario/bloque3.dart';
import 'package:amor_conviccion/Screens/Lessons/cuestionarios/cuestionario/bloque4/bloque4.dart';
import 'package:amor_conviccion/models/lessons_model.dart';
import 'package:flutter/material.dart';

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

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
              child: (lessonsModel!.bloque == 1)
                  ? CuestBloq1()
                  : (lessonsModel.bloque == 2)
                      ? CuestBloq2()
                      : (lessonsModel.bloque == 3)
                          ? CuestBloq3()
                          : (lessonsModel.bloque == 4)
                              ? CuestBloq4()
                              : Container()),
        ));
  }
}
