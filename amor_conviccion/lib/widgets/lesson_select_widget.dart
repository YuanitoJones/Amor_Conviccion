import 'package:amor_conviccion/Screens/HomePage/homePage.dart';
import 'package:amor_conviccion/Screens/HomePage/leaderboard_screen.dart';
import 'package:amor_conviccion/Screens/Lessons/video_screen.dart';
import 'package:amor_conviccion/Screens/SignIn/sign_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LessonSelect extends StatefulWidget{
  const LessonSelect(this.texto, this.flag,{Key? key, }) : super(key: key);

  final String texto;
  final bool flag;
  @override
  _LessonSelect createState() => _LessonSelect();

}

class _LessonSelect extends State<LessonSelect>{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 110,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 8.0,
          shadowColor: Colors.black.withOpacity(1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(90),

            side: (widget.flag)? BorderSide(color: Colors.green, width: 4): BorderSide(color: Colors.red, width: 4),
          ),
          primary: Colors.white
        ),
        child: Lessonicon(widget.texto),
        onPressed: (){
          if(widget.texto=='Imagen'){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const HomePage()));
          }else if(widget.texto == 'Lectura'){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const SignInScreen()));
          }else if(widget.texto == 'Video'){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const VideoPlayerScreen()));
          }
        },
      ),
    );

  }
  Icon Lessonicon(String texto){
    if(widget.texto=='Imagen'){
      return Icon(Icons.book, size: 70, color: Colors.blue,);
    }else if(widget.texto == 'Lectura'){
      return Icon(Icons.account_circle, size: 70, color: Colors.blue,);
    }else if(widget.texto == 'Video'){
      return Icon(Icons.video_call_rounded, size: 70, color: Colors.blue,);
    }else{
      return Icon(Icons.dangerous, size: 70, color: Colors.blue,);
    }
  }
}