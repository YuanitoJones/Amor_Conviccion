import 'package:amor_conviccion/widgets/profile/avatar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LeaderBoard extends StatefulWidget {
  LeaderBoard({Key? key}) : super(key: key);

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  int i = 0;
  Color my = Colors.brown, checkMyColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var r = TextStyle(color: Colors.black, fontSize: size.width * 0.07);
    var q = TextStyle(color: Colors.black, fontSize: size.width * 0.045);
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: size.height * 0.32,
          decoration: const BoxDecoration(
              color: Color(0xFF42ADE2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Positioned(
            child: Container(
          margin: const EdgeInsets.only(top: 65.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(
                      left: size.width * 0.05, top: size.height * 0.005),
                  child: Text(
                    'Tabla de líderes',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.08,
                        color: Colors.white),
                  )),
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.05, top: size.height * 0.03),
                child: Text(
                  'Tablero de clasificación ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: size.width * 0.04),
                ),
              ),
              Flexible(
                  child: FutureBuilder<QuerySnapshot>(
                      future: FirebaseFirestore.instance
                          .collection('puntuacion')
                          .where('puntos', isGreaterThanOrEqualTo: 0)
                          .orderBy('puntos', descending: true)
                          .get(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Algo salió mal');
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          var documents = (snapshot.data!).docs;
                          i = 0;
                          int places = 10;
                          if (documents.length < 10) {
                            places = documents.length;
                          }
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(15, 30, 15, 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 4, color: const Color(0xFFFF7E27)),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: ListView.builder(
                                  itemCount: places,
                                  itemBuilder: (context, index) {
                                    if (index >= 1) {
                                      if (documents[index].get('puntos') !=
                                          documents[index - 1].get('puntos')) {
                                        i++;
                                      }
                                    }
                                    return Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          size.width * 0.008,
                                          0,
                                          size.width * 0.008,
                                          size.height * 0.02),
                                      child: InkWell(
                                        child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                                              : Padding(
                                                                  padding: EdgeInsets.fromLTRB(
                                                                      MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.025,
                                                                      0,
                                                                      MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.025,
                                                                      0),
                                                                  child: Text(
                                                                    (index + 1)
                                                                        .toString(),
                                                                    style: q,
                                                                  ),
                                                                ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0,
                                                            bottom: 7.0),
                                                    child: Avatar(
                                                        photourl:
                                                            documents[index]
                                                                .get('imagen')),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      left: size.width * 0.035,
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Container(
                                                            width: size.width *
                                                                0.5,
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Row(
                                                              children: [
                                                                Flexible(
                                                                  child: Text(
                                                                    documents[
                                                                            index]
                                                                        .get(
                                                                            'nombre'),
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  ),
                                                                ),
                                                              ],
                                                            )),
                                                        Text(
                                                          "Puntos: ${documents[index].get('puntos')}",
                                                        ),
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
