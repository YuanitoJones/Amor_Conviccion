import 'package:amor_conviccion/widgets/questionaire/lines/unir_lineas.dart';
import 'package:amor_conviccion/widgets/questionaire/results_button_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CuestBloq5 extends StatefulWidget {
  const CuestBloq5({Key? key}) : super(key: key);

  @override
  _CuestBloq5State createState() => _CuestBloq5State();
}

class _CuestBloq5State extends State<CuestBloq5> {
  final user = FirebaseAuth.instance.currentUser;

  late List<String> answers;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('Lecciones1').get(),
        builder: (context, snapshot) {
          var documents = (snapshot.data)?.docs;
          int famMembers = documents?[0].get('Anomia')['cuestionario']
                      ['respuestas'] !=
                  null
              ? documents![0].get('Anomia')['cuestionario']['respuestas'].length
              : 0;
          answers = List.generate(famMembers, (index) => '');
          return answers.isNotEmpty
              ? Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          size.width * 0.05,
                          size.height * 0.03,
                          size.width * 0.05,
                          size.height * 0.03),
                      child: Text(
                        'Por cada integrante de tu familia, selecciona su lenguaje del amor',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: size.width * 0.05),
                      ),
                    ),
                    for (int i = 0; i < famMembers; i++)
                      Column(
                        children: [
                          LinesScreen(
                            false,
                            [
                              (i == 0)
                                  ? 'Miembro ${i + 1} (Tú)'
                                  : 'Miembro ${i + 1}',
                              'Palabras de Afirmación',
                              'Tiempo de Calidad',
                              'Regalos',
                              'Actos de servicio',
                              'Contacto físico'
                            ],
                            50,
                            true,
                            answersCallBack: (int val) {},
                            answers: (String val) {
                              answers[i] = val;
                            },
                            descriptioncallback: (String val) {},
                          ),
                          if (i < famMembers - 1)
                            const Divider(
                              thickness: 2,
                              color: Colors.black,
                            )
                        ],
                      ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.01, bottom: size.height * 0.02),
                      child: ResultButton().RBUtton(size, true, context,
                          miembros(famMembers), answers, null),
                    )
                  ],
                )
              : SizedBox(
                  height: size.height,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(size.width * 0.1),
                      child: Text(
                        'Para acceder a esta leccion, primero debes completar el cuestionario de la unidad 4 \'Anomia\'',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: size.width * 0.06,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            letterSpacing: 0.5),
                      ),
                    ),
                  ),
                );
        });
  }

  List miembros(int members) {
    List miembros = List.generate(members, (index) => '');
    for (int i = 0; i < miembros.length; i++) {
      miembros[i] = 'Miembro ${i + 1}';
    }
    return miembros;
  }
}
