import 'package:amor_conviccion/Screens/HomePage/homePage.dart';
import 'package:amor_conviccion/Screens/HomePage/leaderboard_screen.dart';
import 'package:amor_conviccion/Screens/Lessons/cuestionario.dart';
import 'package:amor_conviccion/Screens/Lessons/video_screen.dart';
import 'package:amor_conviccion/Screens/SignIn/sign_in_screen.dart';
import 'package:amor_conviccion/services/authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LessonSelect extends StatefulWidget{
  const LessonSelect(this.texto, this.flag, this.lesson, {Key? key, }) : super(key: key);

  final int lesson;
  final String texto;
  final bool flag;
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

                  side: (widget.flag)? BorderSide(color: Colors.green, width: 3): BorderSide(color: Colors.red, width: 3),
                ),
                primary: Colors.white
            ),
            child: Lessonicon(widget.texto),
            onPressed: (){
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => (widget.texto=='Imagen')? const HomePage()
                  : (widget.texto=='Lectura')? CuestionarioScreen()
                  : (widget.texto == 'Video')? const VideoPlayerScreen()
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
    if(widget.texto=='Imagen'){
      return Icon(Icons.book, size: 60, color: Colors.blue,);
    }else if(widget.texto == 'Lectura'){
      return Icon(Icons.account_circle, size: 60, color: Colors.blue,);
    }else if(widget.texto == 'Video'){
      return Icon(Icons.video_call_rounded, size: 60, color: Colors.blue,);
    }else{
      return Icon(Icons.dangerous, size: 60, color: Colors.blue,);
    }
  }


  Widget buildEditIcon(Color color)=> buildCircle(
      child: buildCircle(
          child: Text(widget.lesson.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),),
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