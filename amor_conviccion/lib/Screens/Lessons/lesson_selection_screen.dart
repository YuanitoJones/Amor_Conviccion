import 'package:amor_conviccion/widgets/lesson_select_widget.dart';
import 'package:flutter/material.dart';

class LessonSelectionScreen extends StatefulWidget{
  const LessonSelectionScreen(this.map, this.bloque, {Key? key}) : super(key: key);

  final map;
  final bloque;
  @override
  _LessonSelectionScreen createState() =>_LessonSelectionScreen();

}

class _LessonSelectionScreen extends State<LessonSelectionScreen>{
  late var info = lessonSelect();
  late int lessonNumber=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
              children: <Widget>[
                Padding(padding: const EdgeInsets.all(50),
                  child: Center(child: Text(info['nombre'].toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Createlessons('video'),
                        Createlessons('lectura'),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Divider(thickness: 3, indent: 15, color: Colors.black,),
                    ),
                    AbsorbPointer(
                      absorbing: false,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Createlessons('cuestionario'),
                          Createlessons('cuestionario2'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
        )
    );
  }

  Widget Createlessons(String leccion){
    try{
      lessonNumber++;
      setState((){});
      return Column(
        children: [
          LessonSelect(widget.bloque, info[leccion]['nombre'], info[leccion]['completado'],lessonNumber),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(
              info[leccion]['nombre'].toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Comfortaa',
                fontSize: 20,
              ),
            ),
          ),
        ],
      );
    }catch(NoSuchMethodError){
      return Container();
    }
  }

  lessonSelect() {
    switch(widget.bloque){
      case 1:
        return widget.map['Drogodependencia'];
      case 2:
        return widget.map['Liderazgo'];
    }
  }
}