import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({Key? key}) : super(key: key);

  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {


  FirebaseFirestore firestore = FirebaseFirestore.instance;

  int i = 0;
  Color my = Colors.brown, checkMyColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    var r = const TextStyle(color: Colors.purpleAccent, fontSize: 34);
    return Stack(
      children: <Widget>[
        Scaffold(
            body: Container(
              margin: const EdgeInsets.only(top: 65.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 15.0, top: 10.0),
                    child: RichText(
                        text: const TextSpan(
                            text: "Leader",
                            style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                  text: " Board",
                                  style: TextStyle(
                                      color: Colors.pink,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold)
                              )
                            ]
                        )
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      'Global Rank Board: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Flexible(
                      child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('puntuacion')
                              .where('puntos', isGreaterThanOrEqualTo: 0)
                              .orderBy('puntos', descending: true)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError){
                              return Text('Algo salio mal');
                            }
                            else if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            else{
                              var documents = (snapshot.data!).docs;
                              if(documents != null){
                                print (documents[0].get('nombre'));
                              }
                              i = 0;
                              return ListView.builder(
                                  itemCount: documents.length,
                                  itemBuilder: (context, index) {
                                    print(index);
                                    if (index >= 1) {
                                      print('Greater than 1');
                                      if (documents[index]
                                          .get('puntos') ==
                                          documents[index - 1]
                                              .get('puntos')) {
                                        print('Igual');
                                      } else {
                                        i++;
                                      }
                                    }

                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0, vertical: 5.0),
                                      child: InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: i == 0
                                                      ? Colors.amber
                                                      : i == 1
                                                      ? Colors.grey
                                                      : i == 2
                                                      ? Colors.brown
                                                      : Colors.white,
                                                  width: 3.0,
                                                  style: BorderStyle.solid),
                                              borderRadius:
                                              BorderRadius.circular(5.0)),
                                          width: MediaQuery.of(context).size.width,
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        top: 7.0, left: 10.0, bottom: 7.0),
                                                    child: Row(
                                                      children: <Widget>[
                                                        CircleAvatar(
                                                            child: Container(
                                                                decoration: BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    image: DecorationImage(
                                                                        image: NetworkImage(documents[index]
                                                                            .get('imagen')),
                                                                        fit: BoxFit
                                                                            .fill)))),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 20.0, top: 10.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Container(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              documents[index].get('nombre'),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .deepPurple,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                              maxLines: 6,
                                                            )),
                                                        Text("Points: " + documents[index].get('puntos').toString()),
                                                      ],
                                                    ),
                                                  ),
                                                  Flexible(child: Container()),
                                                  i == 0
                                                      ? Text("🥇", style: r)
                                                      : i == 1
                                                      ? Text(
                                                    "🥈",
                                                    style: r,
                                                  )
                                                      : i == 2
                                                      ? Text(
                                                    "🥉",
                                                    style: r,
                                                  )
                                                      : const Text(''),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            }
                          }))
                ],
              ),
            )),
      ],
    );
  }
}