import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget{
  final user = FirebaseAuth.instance.currentUser!;
  Widget avatar(){
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
            return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index){
                  return CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.yellow,
                    child: ClipOval(
                      child: Image.network(documents[index].get('imagen'), fit: BoxFit.fill, width: 140, height: 140,)
                    ),
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