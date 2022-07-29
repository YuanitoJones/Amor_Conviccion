import 'package:amor_conviccion/utils/cuestionarios.dart';
import 'package:amor_conviccion/widgets/carrousel_widget.dart';
import 'package:amor_conviccion/widgets/questionaire/abiertas/write_answer_widget.dart';
import 'package:amor_conviccion/widgets/temper_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/questionaire/lines/unir_lineas.dart';

class CuestBloq4 extends StatefulWidget {
  const CuestBloq4({Key? key}) : super(key: key);

  @override
  State<CuestBloq4> createState() => _CuestBloq4();
}

class _CuestBloq4 extends State<CuestBloq4> {
  final Map bloque = CuestionarioBloque().anomia;

  TextEditingController textEditingController = TextEditingController();

  bool shouldpop = false;

  late String temperAnswer = ''; //Respesta de temperamento para usario
  late int famMember; // Recibe miembros
  late int famMembers = 0; // Cantidad de miembros de familia
  late List famTemper; // Lista para temperamento de x miembros de familia
  late int cont = 0; // Contador para guardar temperamentos en la lista anterior
  late String description = 'Melancólico'; // Descripcion de los temperamentos
  late bool temperdescription =
      false; // Muestra la descripcion de temperamentos
  final List debfor = ['Debilidades', 'Fortalezas'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List caracter =
        List.generate(bloque.length, (index) => bloque.keys.toList()[index]);

    List<TemperCardWidget> temperCards = List.generate(
        caracter.length,
        (index) => TemperCardWidget(
            caracter[index].toString(),
            bloque[caracter[index]]['Debilidades'],
            bloque[caracter[index]]['Fortalezas'],
            answers: (val) => setState(() => temperAnswer = val)));

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: (temperAnswer == '')
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: size.width * 0.05, left: size.width * 0.05),
                        child: Text(
                          'Selecciona la tarjeta con el temperamento que mas se adapte a ti',
                          style: TextStyle(
                              color: Colors.black, fontSize: size.width * 0.05),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.75,
                        child: Padding(
                            padding: EdgeInsets.only(
                                right: size.width * 0.05,
                                left: size.width * 0.05),
                            child: CarrouselWidget(temperCards)),
                      )
                    ],
                  )
                : WillPopScope(
                    onWillPop: () async {
                      setState(() {
                        temperAnswer = '';
                        famMembers = 0;
                        cont = 0;
                        textEditingController.text = '';
                        temperdescription = false;
                      });
                      return shouldpop;
                    },
                    child: Center(
                        child: (famMembers == 0)
                            ? Container(
                                width: size.width * 0.7,
                                height: size.height * 0.35,
                                padding:
                                    const EdgeInsets.fromLTRB(15, 10, 15, 5),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(80)),
                                    gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [Colors.grey, Colors.white])),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    WriteAnswer(
                                        false,
                                        'Cuantos integrantes tiene tu familia?',
                                        textEditingController,
                                        answers: (val) =>
                                            famMember = int.parse(val)),
                                    ElevatedButton(
                                        onPressed: () {
                                          famMembers = famMember;
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                          famTemper = List.generate(
                                              int.parse(
                                                  textEditingController.text),
                                              (index) => String);
                                          setState(() {});
                                        },
                                        child: const Text('Siguiente'))
                                  ],
                                ))
                            : SizedBox(
                                height: size.height,
                                child: Stack(
                                  children: [
                                    Column(
                                      children: [
                                        const Text(
                                          'Selecciona el temperamento de cada integrante de tu familia',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        LinesScreen(
                                          true,
                                          [
                                            'Miembro ${cont + 1}',
                                            'Melancólico',
                                            'Sanguíneo',
                                            'Colérico',
                                            'Flemático'
                                          ],
                                          50,
                                          true,
                                          answers: (val) => setState(
                                              () => famTemper[cont] = val),
                                          answersCallBack: (int val) {},
                                          descriptioncallback: (val) =>
                                              setState(() {
                                            description = val;
                                            temperdescription = true;
                                          }),
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                if (cont + 1 == famMembers) {
                                                  print(famTemper);
                                                } else {
                                                  cont++;
                                                }
                                              });
                                            },
                                            child: const Text('siguiente'))
                                      ],
                                    ),
                                    if (temperdescription)
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                            width: double.infinity,
                                            height: size.height * 0.27,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    style: BorderStyle.solid,
                                                    color: Colors.orange,
                                                    width: 2.5),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10))),
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: CloseButton(
                                                      color: Colors.red,
                                                      onPressed: () =>
                                                          setState(() {
                                                            temperdescription =
                                                                false;
                                                          })),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: <Widget>[
                                                    for (int i = 0;
                                                        i < debfor.length;
                                                        i++)
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Text(
                                                            debfor[i],
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    size.width *
                                                                        0.045),
                                                          ),
                                                          for (int j = 0;
                                                              j <
                                                                  bloque[description]
                                                                          [
                                                                          debfor[
                                                                              i]]
                                                                      .length;
                                                              j++)
                                                            Text(
                                                              bloque[description]
                                                                      [debfor[
                                                                          i]][j]
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: size
                                                                          .width *
                                                                      0.035),
                                                            )
                                                        ],
                                                      )
                                                  ],
                                                ),
                                              ],
                                            )),
                                      )
                                  ],
                                ),
                              )))));
  }
}
