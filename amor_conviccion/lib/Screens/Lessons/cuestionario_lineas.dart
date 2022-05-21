import 'package:amor_conviccion/utils/cuestionarios.dart';
import 'package:amor_conviccion/widgets/questionaire/abiertas/write_answer_widget.dart';
import 'package:amor_conviccion/widgets/questionaire/lines/unir_lineas.dart';
import 'package:amor_conviccion/widgets/questionaire/fail_widget.dart';
import 'package:amor_conviccion/widgets/questionaire/question%20_field_widget.dart';
import 'package:amor_conviccion/widgets/questionaire/success_widget.dart';
import 'package:flutter/material.dart';

class LineLessonScreen extends StatefulWidget{
  LineLessonScreen(this.completed, {Key? key}) : super(key: key);

  _LineLessonScreen createState() => _LineLessonScreen();

  int puntos = 0;
  final bool completed;
}

class _LineLessonScreen extends State<LineLessonScreen>{

  CuestionarioBloque bloque = CuestionarioBloque();

  late var answers=[0,0,0,0,0,0,0,0,0];
  late bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Completa los siguientes ejercicios!',
                    style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                LinesScreen(bloque.liderazgo[0], 1,
                  answersCallBack: (val) => setState(() => widget.puntos += val),
                  answers: (val)=> setState(()=> answers[0] = val),),
                Divider(color: Colors.yellow[700], indent: 10, thickness: 3,),
                LinesScreen(bloque.liderazgo[1], 2,
                  answersCallBack: (val) => setState(() => widget.puntos += val),
                  answers: (val)=> setState(()=> answers[1] = val),),
                Divider(color: Colors.yellow[700], indent: 10, thickness: 3,),
                LinesScreen(bloque.liderazgo[2], 1,
                  answersCallBack: (val) => setState(() => widget.puntos += val),
                  answers: (val)=> setState(()=> answers[2] = val),),
                Divider(color: Colors.yellow[700], indent: 10, thickness: 3,),
                LinesScreen(bloque.liderazgo[3], 3,
                  answersCallBack: (val) => setState(() => widget.puntos += val),
                  answers: (val)=> setState(()=> answers[2] = val),),
                Divider(color: Colors.yellow[700], indent: 10, thickness: 3,),
                WriteAnswer(true, bloque.liderazgo[4]),
                WriteAnswer(false, bloque.liderazgo[5]),
                ElevatedButton(
                    onPressed: () => results(widget.puntos),
                    child: const Text('Terminar'))
              ],
            ),
          ),
        )
    );
  }
  void results(int points){
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => (points >= 3)? SuccessScreen('linea', widget.completed, answers)
        : FailScreen()));
  }
}