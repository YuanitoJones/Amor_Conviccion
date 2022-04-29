import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget{
  final user = FirebaseAuth.instance.currentUser!;
  Widget avatar(){
    user.reload();
    bool flag = (user.photoURL) != null? true:false;
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('puntuacion')
            .where('correo', isEqualTo: user.email)
            .snapshots(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: const CircularProgressIndicator(),);
          }
          else if(snapshot.hasError){
            return Text('Algo salio mal');
          }
          else{
            var documents = (snapshot.data!).docs;
            if(documents != null){
              print (documents[0].get('nombre'));
            }
            return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index){
                  return Column(
                    children: <Widget>[
                      Text('UID: ' + user.uid,
                        style: const TextStyle(color: Colors.white, fontSize: 16),),
                      const SizedBox(height: 8,),
                      Text('Email: ' + user.email!,
                        style: const TextStyle(color: Colors.white, fontSize: 16),),
                    ],
                  );
                });
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return avatar();
  }
}