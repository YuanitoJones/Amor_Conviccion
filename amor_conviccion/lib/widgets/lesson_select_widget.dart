import 'package:amor_conviccion/Screens/HomePage/homePage.dart';
import 'package:amor_conviccion/Screens/HomePage/leaderboard_screen.dart';
import 'package:amor_conviccion/Screens/SignIn/sign_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LessonSelect extends StatefulWidget{
  const LessonSelect(this.texto, {Key? key, }) : super(key: key);

  final String texto;
  @override
  _LessonSelect createState() => _LessonSelect();

}

class _LessonSelect extends State<LessonSelect>{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 110,
      child: TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(90),
                  side: BorderSide(color: Colors.red),
                )
            )
        ),
        child: Icon(Icons.account_circle),
        onPressed: (){
          if(widget.texto=='Imagen'){
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const HomePage()));
          }else if(widget.texto == 'Lectura'){
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const SignInScreen()));
          }else if(widget.texto == 'video'){
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const LeaderBoard()));
          }
        },
      ),
    );
  }
}