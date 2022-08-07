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
    return Column(
      children: <Widget>[
        Text(
            'Por cada integrante de tu familia, selecciona su lenguaje del amor'),
        FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance.collection('Lecciones1').get(),
            builder: (context, snapshot) {
              var documents = (snapshot.data!).docs;
              int famMembers = documents[0]
                  .get('Anomia')['cuestionario']['respuestas']
                  .length;
              answers = List.generate(famMembers, (index) => '');
              return Column(
                children: <Widget>[
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
                          Divider(
                            thickness: 2,
                            color: Colors.black,
                          )
                      ],
                    ),
                  ResultButton().RBUtton(size, true, context, answers, null)
                ],
              );
            })
      ],
    );
  }
}
