import 'package:amor_conviccion/widgets/questionaire/success_widget.dart';
import 'package:flutter/material.dart';

import 'fail_widget.dart';

class ResultButton {
  Widget RBUtton(Size size, bool resul, BuildContext context, int bloque,
      String nombre, bool completed, List answers, int puntosl) {
    return SizedBox(
      height: size.height * 0.065,
      child: Padding(
        padding:
            EdgeInsets.fromLTRB(size.width * 0.25, 0, size.width * 0.25, 0),
        child: ElevatedButton(
          onPressed: () => results(
              resul, context, bloque, nombre, completed, answers, puntosl),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                Text('Siquiente'),
                Icon(Icons.arrow_forward_rounded)
              ]),
        ),
      ),
    );
  }

  void results(bool resul, BuildContext context, int bloque, String nombre,
      bool completed, List answers, int puntosl) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => (resul)
                ? SuccessScreen(bloque, nombre, completed, answers, puntosl)
                : FailScreen(puntosl)));
  }
}
