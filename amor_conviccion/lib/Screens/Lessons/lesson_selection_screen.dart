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
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.all(35),
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
                      LessonSelect(documents[0].get('nombre'), documents[0].get('Completado')),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                            child: LessonSelect(documents[1].get('nombre'), documents[1].get('Completado')),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                            child: LessonSelect(documents[2].get('nombre'), documents[2].get('Completado')),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      )
                    ],
                  );
                }
              },
            ),
            /*child: StreamBuilder<QuerySnapshot>(
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
                  return
                    ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (context, index){
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(85, 30, 0, 10),
                            child: LessonSelect(documents[index].get('nombre'), documents[index].get('Completado')),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 30, 75, 0),
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
            ),*/
          ),
        ],
      )
    );
  }
}