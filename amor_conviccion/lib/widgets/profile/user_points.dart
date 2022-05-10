import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserPoints extends StatelessWidget{
  final user = FirebaseAuth.instance.currentUser!;

  UserPoints({Key? key}) : super(key: key);
  Widget userPoints(Size size){
    return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection('puntuacion')
            .where('correo', isEqualTo: user.email)
            .get(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          else if(snapshot.hasError){
            return Text('Algo salvo mal',
            style: TextStyle(
              fontSize: size.height*0.025,
              color: const Color.fromARGB(181, 0, 0, 0),
            ),);
          }
          else{
            var documents = (snapshot.data!).docs;
            return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index){
                  return Column(
                    children: <Widget>[
                      Text((documents[index].get('puntos').toString()),
                        style: const TextStyle(color: Colors.black54, fontSize: 30, fontWeight: FontWeight.bold),),
                    ],
                  );
                });
          }
        });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return userPoints(size);
  }
}