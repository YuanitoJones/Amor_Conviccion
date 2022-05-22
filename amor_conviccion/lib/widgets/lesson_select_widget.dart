import 'package:amor_conviccion/Screens/HomePage/homePage.dart';
import 'package:amor_conviccion/Screens/HomePage/leaderboard_screen.dart';
import 'package:amor_conviccion/Screens/Lessons/cuestionario.dart';
import 'package:amor_conviccion/Screens/Lessons/cuestionario_lineas.dart';
import 'package:amor_conviccion/Screens/Lessons/lecture_screen.dart';
import 'package:amor_conviccion/Screens/Lessons/video_screen.dart';
import 'package:amor_conviccion/Screens/SignIn/sign_in_screen.dart';
import 'package:amor_conviccion/services/authentication.dart';
import 'package:amor_conviccion/widgets/questionaire/lines/unir_lineas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LessonSelect extends StatefulWidget{
  const LessonSelect(this.bloque, this.texto, this.flag, this.lesson, {Key? key, }) : super(key: key);

  final int bloque;//Bloque de lecciones
  final int lesson;//Numero de leccion
  final String texto;//Nombre de leccion
  final bool flag;//completado de la leccion
  @override
  _LessonSelect createState() => _LessonSelect();

}

class _LessonSelect extends State<LessonSelect>{
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 110,
          height: 110,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 8.0,
                shadowColor: Colors.black.withOpacity(1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(90),

                  side: (widget.flag)? const BorderSide(color: Colors.green, width: 3): const BorderSide(color: Colors.red, width: 3),
                ),
                primary: Colors.white
            ),
            child: Lessonicon(widget.texto),
            onPressed: (){
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => (widget.texto=='lectura')? const LectureScreen()
                  : (widget.texto=='cuestionario')? CuestionarioScreen(widget.bloque, widget.flag)
                  : (widget.texto == 'video')? VideoPlayerScreen(widget.bloque, widget.texto)
                  : (widget.texto == 'cuestionario 2')? LineLessonScreen(widget.flag)
                  : const Authentication()));
            },
          ),
    ),
    Positioned(
        child: buildEditIcon(Colors.blue),
          top: 0,
          right: 0,
        ),
      ],
    );

  }
  Icon Lessonicon(String texto){
    if(widget.texto=='lectura'){
      return const Icon(Icons.book, size: 60, color: Colors.blue,);
    }else if(widget.texto == 'cuestionario'){
      return const Icon(Icons.account_circle, size: 60, color: Colors.blue,);
    }else if(widget.texto == 'cuestionario 2') {
      return const Icon(Icons.account_circle, size: 60, color: Colors.blue,);
    }else if(widget.texto == 'video'){
      return const Icon(Icons.video_call_rounded, size: 60, color: Colors.blue,);
    }else{
      return const Icon(Icons.dangerous, size: 60, color: Colors.blue,);
    }
  }


  Widget buildEditIcon(Color color)=> buildCircle(
      child: buildCircle(
          child: Text(widget.lesson.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),),
          all: 12,
          color: color),
      all: 1.5,
      color: (widget.flag)? Colors.green : Colors.red,);



  Widget buildCircle({
  required Widget child,
    required double all,
    required Color color
}) => ClipOval(
    child: Container(
      padding: EdgeInsets.all(all),
      color: color,
      child: child,
    ),
  );
}