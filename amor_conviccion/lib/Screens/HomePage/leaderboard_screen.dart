import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({Key? key}) : super(key: key);

  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  int i = 0;
  Color my = Colors.brown, checkMyColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var r = const TextStyle(color: Colors.black, fontSize: 30);
    var q = const TextStyle(color: Colors.black, fontSize: 22);
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: size.height*0.35,
          decoration: const BoxDecoration(
            color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
        ),
        Positioned(
            child: Container(
              margin: const EdgeInsets.only(top: 65.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 15.0, top: 10.0),
                    child: const Text('Tabla de lideres', style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Colors.white
                    ),)
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 15.0),
                    child: Text(
                      'Tablero de clasificacion ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                        fontFamily: 'Comfortaa',
                        color: Colors.white
                      ),
                    ),
                  ),
                  Flexible(
                      child: FutureBuilder<QuerySnapshot>(
                          future: FirebaseFirestore.instance.collection('puntuacion')
                              .where('puntos', isGreaterThanOrEqualTo: 0)
                          .orderBy('puntos', descending: true)
                              .get(),
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
                              i = 0;
                              int places =10;
                              if(documents.length<10){
                                places = documents.length;
                              }
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(width: 4, color: Colors.yellow.shade600),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: ListView.builder(
                                      itemCount: places,
                                      itemBuilder: (context, index) {
                                        if (index >= 1) {
                                          if (documents[index].get('puntos') != documents[index - 1].get('puntos')) {
                                            i++;
                                          }
                                        }
                                        return Padding(
                                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                                          child: InkWell(
                                            child: SizedBox(
                                              width: MediaQuery.of(context).size.width,
                                              child: Column(
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
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
                                                          : Padding(padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.025, 0, MediaQuery.of(context).size.width*0.025, 0),
                                                          child: Text(
                                                            (index + 1).toString(),
                                                            style: q,
                                                          ),
                                                      ),
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
                                                                                .fill)
                                                                    )
                                                                )
                                                            ),
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
                                                                      fontFamily: 'Comfortaa',
                                                                      color: Colors
                                                                          .deepPurple,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                                  maxLines: 6,
                                                                )),
                                                            Text("Puntos: " + documents[index].get('puntos').toString(),style: TextStyle(fontFamily: 'Comfortaa'),),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              );
                            }
                          }))
                ],
              ),
            )),
      ],
    );
  }
}
