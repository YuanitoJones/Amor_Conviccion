import 'package:amor_conviccion/utils/cuestionarios.dart';
import 'package:amor_conviccion/widgets/questionaire/fail_widget.dart';
import 'package:amor_conviccion/widgets/questionaire/question%20_field_widget.dart';
import 'package:amor_conviccion/widgets/questionaire/success_widget.dart';
import 'package:flutter/material.dart';

class CuestionarioScreen extends StatefulWidget{
  CuestionarioScreen(this.completed, {Key? key}) : super(key: key);

  _CuestionarioScreen createState() => _CuestionarioScreen();

  int puntos = 0;
  final bool completed;
}

class _CuestionarioScreen extends State<CuestionarioScreen>{

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
                  child: Text('Pon a prueba tu conocimiento!',
                    style: TextStyle(
                        fontFamily: 'Comfortaa',
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                QuestionField(flag, bloque.drogodependencia[0], 2, answersCallBack: (val) => setState(
                        () => widget.puntos += val),answers: (val)=> setState(()=> answers[0] = val),),
                QuestionField(flag, bloque.drogodependencia[1], 1, answersCallBack: (val) => setState(
                        () => widget.puntos += val),answers: (val)=> setState(()=> answers[1] = val),),
                QuestionField(flag, bloque.drogodependencia[2], 2, answersCallBack: (val) => setState(
                        () => widget.puntos += val),answers: (val)=> setState(()=> answers[2] = val),),
                QuestionField(flag, bloque.drogodependencia[3], 1, answersCallBack: (val) => setState(
                        () => widget.puntos += val),answers: (val)=> setState(()=> answers[3] = val),),
                QuestionField(flag, bloque.drogodependencia[4], 3, answersCallBack: (val) => setState(
                        () => widget.puntos += val),answers: (val)=> setState(()=> answers[4] = val),),
                QuestionField(flag, bloque.drogodependencia[5], 2, answersCallBack: (val) => setState(
                        () => widget.puntos += val),answers: (val)=> setState(()=> answers[5] = val),),
                QuestionField(flag, bloque.drogodependencia[6], 1, answersCallBack: (val) => setState(
                        () => widget.puntos += val),answers: (val)=> setState(()=> answers[6] = val),),
                QuestionField(flag, bloque.drogodependencia[7], 3, answersCallBack: (val) => setState(
                        () => widget.puntos += val),answers: (val)=> setState(()=> answers[7] = val),),
                QuestionField(flag, bloque.drogodependencia[8], 2, answersCallBack: (val) => setState(
                        () => widget.puntos += val),answers: (val)=> setState(()=> answers[8] = val),),

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
        context, MaterialPageRoute(builder: (context) => (points >= 6)? SuccessScreen('Lectura', widget.completed, answers)
        : FailScreen()));
  }
}