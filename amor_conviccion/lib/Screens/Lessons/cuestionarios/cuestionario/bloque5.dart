import 'package:amor_conviccion/widgets/questionaire/lines/unir_lineas.dart';
import 'package:amor_conviccion/widgets/questionaire/results_button_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../utils/cuestionarios.dart';

class CuestBloq5 extends StatefulWidget {
  CuestBloq5({Key? key}) : super(key: key);

  late bool modalOpen = true;

  @override
  _CuestBloq5State createState() => _CuestBloq5State();
}

class _CuestBloq5State extends State<CuestBloq5> {
  final user = FirebaseAuth.instance.currentUser;
  double conheight = 0;
  late List<String> answers;
  final Map bloque = CuestionarioBloque().amorYPerdon;
  late String description =
      'Palabras de afirmación'; // Descripcion de los lenguajes del amor
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection('Lecciones1')
            .where('uid', isEqualTo: user!.uid)
            .get(),
        builder: (context, snapshot) {
          var documents = (snapshot.data)?.docs;
          int famMembers = documents?[0].get('Anomia')['cuestionario']
                      ['respuestas'] !=
                  null
              ? documents![0].get('Anomia')['cuestionario']['respuestas'].length
              : 0;
          answers = List.generate(famMembers, (index) => '');
          return answers.isNotEmpty
              ? Container(
                  color: widget.modalOpen ? Colors.black54 : Colors.transparent,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            size.width * 0.05,
                            size.height * 0.03,
                            size.width * 0.05,
                            size.height * 0.045),
                        child: !widget.modalOpen
                            ? Text(
                                'Por cada integrante de tu familia, selecciona el lenguaje del amor correspondiente',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: size.width * 0.05),
                              )
                            : Container(
                                width: size.width * 0.9,
                                height: size.height * 0.12,
                                color: Colors.white,
                                child: Stack(
                                  children: [
                                    Positioned(
                                        top: 0,
                                        right: 0,
                                        child: CloseButton(
                                          color: Colors.red,
                                          onPressed: (() => {
                                                setState(() =>
                                                    {widget.modalOpen = false})
                                              }),
                                        )),
                                    Positioned(
                                        width: size.width * 0.9,
                                        bottom: 0,
                                        child: Text(
                                          "Para conocer ms sobre opciones, toque cada uno de los recuadros",
                                          style: TextStyle(
                                              fontSize: size.width * 0.05),
                                          textAlign: TextAlign.center,
                                        ))
                                  ],
                                ),
                              ),
                      ),
                      for (int i = 0; i < famMembers; i++)
                        Column(
                          children: [
                            LinesScreen(
                              true,
                              [
                                (i == 0)
                                    ? 'Miembro ${i + 1} (Tú)'
                                    : 'Miembro ${i + 1}',
                                'Palabras de afirmación',
                                'Tiempo de calidad',
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
                              descriptioncallback: (val) => setState(() {
                                description = val;
                                conheight = 200;
                              }),
                            ),
                            // if (conheight != 0 && i != answers.length)
                            AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: double.infinity,
                                height: conheight,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        style: BorderStyle.solid,
                                        color: Colors.blue,
                                        width: 2.5),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: conheight != 0
                                    ? Wrap(
                                        children: [
                                          Stack(
                                            children: [
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: CloseButton(
                                                    color: Colors.red,
                                                    onPressed: () =>
                                                        setState(() {
                                                          conheight = 0;
                                                        })),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.3,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Center(
                                                      child: Text(
                                                        description,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize:
                                                                size.width *
                                                                    0.06),
                                                      ),
                                                    ),
                                                    Column(
                                                      children: [
                                                        for (int i = 0;
                                                            i <
                                                                bloque[description]
                                                                    .length;
                                                            i++)
                                                          Text(
                                                            bloque[description]
                                                                [i],
                                                            style: TextStyle(
                                                                fontSize:
                                                                    size.width *
                                                                        0.045),
                                                          )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    : Container()),
                            if (i < famMembers - 1)
                              const Divider(
                                thickness: 2,
                                color: Colors.black,
                              )
                          ],
                        ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.01,
                            bottom: size.height * 0.02),
                        child: ResultButton().RBUtton(size, true, context,
                            miembros(famMembers), answers, null),
                      )
                    ],
                  ),
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
