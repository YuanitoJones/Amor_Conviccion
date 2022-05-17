import 'package:amor_conviccion/services/UpdateInfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../services/authentication.dart';

class SuccessScreen extends StatefulWidget{
  const SuccessScreen(this. name, this.flag,{Key? key}) : super(key: key);

  final String name;
  final bool flag;
  @override
  _SuccessScreen createState() => _SuccessScreen();
}

class _SuccessScreen extends State<SuccessScreen>{
  late bool flag = widget.flag;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: updatepoints(widget.name),
    );
  }
  
  Widget updatepoints(String name){
    Size size = MediaQuery.of(context).size;
    UpdatePoints update = UpdatePoints();

    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection('Lecciones')
          .where('nombre', isEqualTo: name)
          .get(),
        builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(),);
        }else if(snapshot.hasError){
          return const Text('Algio salio mal');
        }else{
          return GestureDetector(
            onTap: (){
              if(!flag){
                update.updatepoints(snapshot.data!.docs[0].get('puntos'));
                UpdateLesson lesson = UpdateLesson();
                lesson.updateCompleted('Lectura');
              }
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => const Authentication()));
            },
            child: Container(
              color: Colors.lightGreen,
                height: size.height,
                width: size.width,
                child: (flag)? Center(child: Text('El curso ya se habia completdo anteriormente, ya no se asiganarán puntos.\nToca para continuar')) : Center(
                    child: Text('Felicidades!\nAprobaste el curso y has obtenido ${snapshot.data!.docs[0].get('puntos')} puntos\nToca para continuar'))),
          );
        }
        });
  }
}