import 'package:amor_conviccion/Screens/Lessons/cuestionarios/cuestionario/bloque4/temper_cards.dart';
import 'package:amor_conviccion/Screens/Lessons/cuestionarios/cuestionario/bloque4/temper_members.dart';
import 'package:amor_conviccion/utils/cuestionarios.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/questionaire/results_button_widget.dart';
import 'fam_members.dart';

class CuestBloq4 extends StatefulWidget {
  const CuestBloq4({Key? key}) : super(key: key);

  @override
  State<CuestBloq4> createState() => _CuestBloq4();
}

class _CuestBloq4 extends State<CuestBloq4> {
  final Map bloque = CuestionarioBloque().anomia;

  late String temperAnswer = ''; //Respesta de temperamento para usario
  late int famMembers = 0; // Cantidad de miembros de familia
  late List famTemper; // Lista para temperamento de x miembros de familia
  late int cont = 0; // Contador para guardar temperamentos en la lista anterior
  late bool flag =
      false; // Bool para diferncia entre boton siguiente y el qe termina la leccion

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return (temperAnswer == '')
        ? TemperCards(
            tempers: (String val) => setState(() {
              temperAnswer = val;
            }),
          )
        : WillPopScope(
            onWillPop: () async {
              setState(() {
                temperAnswer = '';
                famMembers = 0;
                cont = 0;
                flag = false;
              });
              return false;
            },
            child: SizedBox(
                height: size.height,
                child: Center(
                    child: (famMembers == 0)
                        ? FamMembers(
                            members: (List valor) => setState(() {
                              famTemper = valor;
                              famTemper[0] = temperAnswer;
                              famMembers = valor.length - 1;
                              if (famMembers == 1) {
                                flag = true;
                              }
                            }),
                          )
                        : Stack(
                            children: [
                              TemperMembers(
                                famMembers,
                                cont,
                                tempersCallBack: (String val) {
                                  famTemper[cont + 1] = val;
                                },
                                child: (!flag)
                                    ? SizedBox(
                                        width: size.width * 0.3,
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
                                            child: const Icon(
                                              Icons.arrow_forward_rounded,
                                              size: 30,
                                            )),
                                      )
                                    : ResultButton().RBUtton(
                                        size,
                                        true,
                                        context,
                                        miembros(famMembers + 1),
                                        famTemper,
                                        null),
                              ),
                            ],
                          ))));
  }

  List miembros(int members) {
    List miembros = List.generate(members, (index) => '');
    for (int i = 0; i < miembros.length; i++) {
      miembros[i] = 'Miembro ${i + 1}';
    }
    return miembros;
  }
}
