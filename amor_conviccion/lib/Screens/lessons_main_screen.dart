import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainLessons extends StatefulWidget{
  const MainLessons({Key? key}) : super(key: key);


  @override
  _MainLessons createState() => _MainLessons();
}

class _MainLessons extends State<MainLessons>{

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