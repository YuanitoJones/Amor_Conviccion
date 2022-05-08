import 'package:amor_conviccion/widgets/lesson_select_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LessonSelectionScreen extends StatefulWidget{
  final user = FirebaseAuth.instance.currentUser!;
  LessonSelectionScreen({Key? key}) : super(key: key);

  @override
  _LessonSelectionScreen createState() =>_LessonSelectionScreen();

}

class _LessonSelectionScreen extends State<LessonSelectionScreen>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
          .collection('Lecciones')
          .snapshots(),
          builder: (context, snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),);
            }else if (snapshot.hasError){
              return Text('Algo salio mal');
            }else{
              var documents = (snapshot.data!).docs;
              return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 50, 30, 0),
                        child: LessonSelect(documents[index].get('nombre')),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 45, 0, 0),
                        child: Text(documents[index].get('nombre'),
                          style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

}