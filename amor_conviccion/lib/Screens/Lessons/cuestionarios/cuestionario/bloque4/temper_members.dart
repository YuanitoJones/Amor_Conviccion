import 'package:flutter/material.dart';

import '../../../../../utils/cuestionarios.dart';
import '../../../../../widgets/questionaire/lines/unir_lineas.dart';

typedef TempersCallBack = void Function(String val);

class TemperMembers extends StatefulWidget {
  TemperMembers(this.FamMembers, this.cont,
      {required this.tempersCallBack, required this.child, Key? key})
      : super(key: key);

  final Widget child;
  final int FamMembers;
  final int cont;
  late bool modalOpen = true;
  final TempersCallBack tempersCallBack;
  @override
  State<TemperMembers> createState() => _TemperMembers();
}

class _TemperMembers extends State<TemperMembers> {
  final Map bloque = CuestionarioBloque().anomia;
  late String description = 'Melancólico'; // Descripcion de los temperamentos
  double conheight = 0;
  final List debfor = ['Debilidades', 'Fortalezas'];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      color: widget.modalOpen ? Colors.black54 : Colors.transparent,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(
                      size.width * 0.05,
                      size.height * 0.03,
                      size.width * 0.05,
                      size.height * 0.03),
                  child: !widget.modalOpen
                      ? Text(
                          'Selecciona el temperamento de cada integrante de tu familia',
                          style: TextStyle(fontSize: size.width * 0.05),
                        )
                      : Container(
                          color: Colors.white,
                          height: size.height * 0.12,
                          width: size.width * 0.9,
                          child: Stack(
                            children: [
                              Positioned(
                                  top: 0,
                                  right: 0,
                                  child: CloseButton(
                                      color: Colors.red,
                                      onPressed: () => setState(() {
                                            widget.modalOpen = false;
                                          }))),
                              Positioned(
                                width: size.width * 0.9,
                                bottom: 0,
                                child: Text(
                                  "Para conocer más sobre las opciones, toque cada uno de los recuadros",
                                  style: TextStyle(fontSize: size.width * 0.05),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ))),
              LinesScreen(
                true,
                [
                  'Miembro ${widget.cont + 1}',
                  'Melancólico',
                  'Sanguíneo',
                  'Colérico',
                  'Flemático'
                ],
                50,
                true,
                answers: (val) => setState(() => widget.tempersCallBack(val)),
                answersCallBack: (int val) {},
                descriptioncallback: (val) => setState(() {
                  description = val;
                  conheight = size.height * 0.3;
                }),
              ),
              if (!widget.modalOpen) widget.child
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                width: double.infinity,
                height: conheight,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        style: BorderStyle.solid,
                        color: Colors.blue,
                        width: 2.5),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            for (int i = 0; i < debfor.length; i++)
                              SizedBox(
                                height: size.height * 0.3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      debfor[i],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: size.width * 0.05),
                                    ),
                                    for (int j = 0;
                                        j <
                                            bloque[description][debfor[i]]
                                                .length;
                                        j++)
                                      Text(
                                        bloque[description][debfor[i]][j]
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: size.width * 0.037),
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
    );
  }
}
