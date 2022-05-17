import 'dart:async';

import 'package:amor_conviccion/widgets/questionaire/fail_widget.dart';
import 'package:amor_conviccion/widgets/questionaire/question%20_field_widget.dart';
import 'package:amor_conviccion/widgets/questionaire/success_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CuestionarioScreen extends StatefulWidget{
  CuestionarioScreen(this.completed, {Key? key}) : super(key: key);

  _CuestionarioScreen createState() => _CuestionarioScreen();

  int puntos = 0;
  final bool completed;
}

class _CuestionarioScreen extends State<CuestionarioScreen>{


  Map<int, List> map1 = {
    0: ['1.- ¿De dónde viene la palabra adicto?',
      'De griego \“Pistis\”',
      'Del latín \“Addictus\”',
      'De latín \“Vitium\”'],
    1: ['2.- Menciona los 4 tipos de consumo.',
      'Experimental, ocasional, habitual, crónico compulsivo.',
      'A diario, frecuente, de vez en cuando, ocasional.',
      'Con los amigos, en fiestas, en mi casa, en reuniones sociales.'],
    2: ['3.- ¿Cuáles son los 3 tipos de adicciones?',
      'Compras compulsivas, consumo de alcohol, relaciones neuróticas.',
      'Actividades, relaciones y sustancias.',
      'Adicción a objetos, personas y drogas.'],
    3: ['4.- ¿Cómo saber si un hábito se puede convertir en una adicción?',
      'Si se hace a escondidas y si genera problemas.',
      'Si se hace a diario.',
      'Si se me resulta agradable y desagradable.'],
    4 : ['5.- ¿Cuántas sustancias tóxicas contienen un cigarro de tabaco?',
      'Más de 100.',
      'Más de 50.',
      'Más de 4,000.'],
    5: ['6.- ¿Cuál es la “mamá” de las drogas?',
      'La cocaína.',
      'El alcohol.','La heroína'],
    6: ['7.- ¿Qué características debe tener una sustancia para que se considere como una \"droga\"?',
      'Que genere ansiedad, dependencia y tolerancia.',
      'Que genere sensación de placer.',
      'Que genere sentimientos de culpa.'],
    7: ['8.- ¿Es lo mismo estar \"drogado\" a estar "borracho"?',
      'No',
      'Depende del grado de embriaguez',
      'Si'],
    8:['9.- ¿Cuáles son los 4 tipos de bebedores?',
      'Bebedor compulsivo, bebedor tranquilo, bebedor agresivo, bebedor triste.',
      'Bebedor social, bebedor fuerte, bebedor problema, alcohólico.',
      'Bebedor agresivo, bebedor alegre, bebedor conversador, bebedor tranquilo.']
  };

  late bool flag = true;

  late int question =1;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            QuestionField(flag, map1[0], 2, answersCallBack: (val) => setState(
                    () => widget.puntos += val),),
            QuestionField(flag, map1[1], 1, answersCallBack: (val) => setState(
                    () => widget.puntos += val),),
            QuestionField(flag, map1[2], 2, answersCallBack: (val) => setState(
                    () => widget.puntos += val),),
            QuestionField(flag, map1[3], 1, answersCallBack: (val) => setState(
                    () => widget.puntos += val),),
            QuestionField(flag, map1[4], 3, answersCallBack: (val) => setState(
                    () => widget.puntos += val),),
            QuestionField(flag, map1[5], 2, answersCallBack: (val) => setState(
                    () => widget.puntos += val),),
            QuestionField(flag, map1[6], 1, answersCallBack: (val) => setState(
                    () => widget.puntos += val),),
            QuestionField(flag, map1[7], 3, answersCallBack: (val) => setState(
                    () => widget.puntos += val),),
            QuestionField(flag, map1[8], 2, answersCallBack: (val) => setState(
                    () => widget.puntos += val),),

            ElevatedButton(
                onPressed: () => results(widget.puntos),
                child: Text('Terminar'))
          ],
        ),
      )
    );
  }
  void results(int points){
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => (points >= 6)? SuccessScreen('Lectura', widget.completed)
        : FailScreen()));
  }
}