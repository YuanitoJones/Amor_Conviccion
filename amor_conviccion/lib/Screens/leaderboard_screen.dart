import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeaderBoard extends StatefulWidget{
  const LeaderBoard({Key? key}) : super(key: key);


  @override
  _LeaderBoard createState() => _LeaderBoard();
}

class _LeaderBoard extends State<LeaderBoard>{

  Widget main(){
    return Scaffold();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: main(),
    );
  }
}