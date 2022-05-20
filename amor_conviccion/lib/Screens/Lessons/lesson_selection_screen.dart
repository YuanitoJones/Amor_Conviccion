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
    return SafeArea(
        child: Scaffold(
            body: Column(
              children: <Widget>[
                const Padding(padding: EdgeInsets.all(50),
                  child: Center(child: Text('Drogodependencia',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),),
                ),
                Flexible(
                  child: StreamBuilder<QuerySnapshot>(
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
                        return Column(
                          children: [
                            Column(
                              children: [
                                LessonSelect(documents[0].get('nombre'), documents[0].get('Completado'),1),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Text(
                                    'Lectura',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Comfortaa',
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                                      child: LessonSelect(documents[1].get('nombre'), documents[1].get('Completado'),2),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      child: Text(
                                        'Cuestionario',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Comfortaa',
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                                      child: LessonSelect(documents[2].get('nombre'), documents[2].get('Completado'),3),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      child: Text(
                                        'Video',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Comfortaa',
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        );
                      }
                    },
                  ),
                ),
              ],
            )
        )
    );
  }
}