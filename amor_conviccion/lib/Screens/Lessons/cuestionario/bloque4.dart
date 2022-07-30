import 'package:amor_conviccion/utils/cuestionarios.dart';
import 'package:amor_conviccion/widgets/carrousel_widget.dart';
import 'package:amor_conviccion/widgets/questionaire/abiertas/write_answer_widget.dart';
import 'package:amor_conviccion/widgets/temper_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/questionaire/lines/unir_lineas.dart';
import '../../../widgets/questionaire/results_button_widget.dart';

class CuestBloq4 extends StatefulWidget {
  const CuestBloq4(
      this.nombloq, this.bloque, this.nombre, this.completed, this.puntosl,
      {Key? key})
      : super(key: key);

  final String nombloq;
  final int bloque;
  final String nombre;
  final bool completed;
  final int puntosl;

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
  double conheight = 0;
  final List debfor = ['Debilidades', 'Fortalezas'];
  late bool flag =
      false; // Bool para diferncia entre boton siguiente y el qe termina la leccion

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

    return (temperAnswer == '')
        ? SizedBox(
            height: size.height,
            child: Column(
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
                          right: size.width * 0.05, left: size.width * 0.05),
                      child: CarrouselWidget(temperCards)),
                )
              ],
            ),
          )
        : WillPopScope(
            onWillPop: () async {
              setState(() {
                temperAnswer = '';
                famMembers = 0;
                cont = 0;
                textEditingController.text = '';
                conheight = 0;
                flag = false;
              });
              return shouldpop;
            },
            child: SizedBox(
              height: size.height,
              child: Center(
                  child: (famMembers == 0)
                      ? Container(
                          width: size.width * 0.7,
                          height: size.height * 0.35,
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(80)),
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [Colors.grey, Colors.white])),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              WriteAnswer(
                                  false,
                                  'Cuantos integrantes tiene tu familia?',
                                  textEditingController,
                                  answers: (val) => famMember = int.parse(val)),
                              ElevatedButton(
                                  onPressed: () {
                                    famMembers = famMember;
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();

                                    famTemper = List.generate(
                                        int.parse(textEditingController.text) +
                                            1,
                                        (index) => String);
                                    famTemper[0] = temperAnswer;
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * 0.05,
                                        right: size.width * 0.05),
                                    child: Text(
                                      'Selecciona el temperamento de cada integrante de tu familia',
                                      style: TextStyle(
                                          fontSize: size.width * 0.05),
                                    ),
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
                                        () => famTemper[cont + 1] = val),
                                    answersCallBack: (int val) {},
                                    descriptioncallback: (val) => setState(() {
                                      description = val;
                                      conheight = size.height * 0.3;
                                    }),
                                  ),
                                  (!flag)
                                      ? Container(
                                          width: size.width * 0.5,
                                          height: size.height * 0.065,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  if (cont + 2 == famMembers) {
                                                    flag = true;
                                                  }
                                                  cont++;
                                                });
                                              },
                                              child: Text(
                                                'siguiente',
                                                style: TextStyle(
                                                    fontSize:
                                                        size.width * 0.04),
                                              )),
                                        )
                                      : ResultButton().RBUtton(
                                          size,
                                          true,
                                          context,
                                          widget.nombloq,
                                          widget.bloque,
                                          widget.nombre,
                                          widget.completed,
                                          famTemper,
                                          widget.puntosl)
                                ],
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: AnimatedContainer(
                                    duration: Duration(milliseconds: 100),
                                    width: double.infinity,
                                    height: conheight,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            style: BorderStyle.solid,
                                            color: Colors.orange,
                                            width: 2.5),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Wrap(
                                      children: [
                                        Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: CloseButton(
                                                  color: Colors.red,
                                                  onPressed: () => setState(() {
                                                        conheight = 0;
                                                      })),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                for (int i = 0;
                                                    i < debfor.length;
                                                    i++)
                                                  SizedBox(
                                                    height: size.height * 0.3,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Text(
                                                          debfor[i],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize:
                                                                  size.width *
                                                                      0.05),
                                                        ),
                                                        for (int j = 0;
                                                            j <
                                                                bloque[description]
                                                                        [debfor[
                                                                            i]]
                                                                    .length;
                                                            j++)
                                                          Text(
                                                            bloque[description][
                                                                    debfor[
                                                                        i]][j]
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize:
                                                                    size.width *
                                                                        0.037),
                                                          )
                                                      ],
                                                    ),
                                                  )
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    )),
                              )
                            ],
                          ),
                        )),
            ));
  }
}
