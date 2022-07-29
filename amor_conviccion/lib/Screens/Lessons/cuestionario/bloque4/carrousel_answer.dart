import 'package:flutter/material.dart';

import '../../../../utils/cuestionarios.dart';
import '../../../../widgets/carrousel_widget.dart';
import '../../../../widgets/temper_card_widget.dart';

class CarrouselAnswer extends StatelessWidget {
  CarrouselAnswer({Key? key}) : super(key: key);
  final Map bloque = CuestionarioBloque().anomia;

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

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.only(
              right: size.width * 0.05, left: size.width * 0.05),
          child: Text(
            'Selecciona la tarjeta con el temperamento que mas se adapte a ti',
            style: TextStyle(color: Colors.black, fontSize: size.width * 0.05),
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
    );
  }
}
