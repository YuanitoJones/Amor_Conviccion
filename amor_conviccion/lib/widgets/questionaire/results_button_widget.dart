import 'package:amor_conviccion/models/lessons_model.dart';
import 'package:amor_conviccion/widgets/questionaire/success_widget.dart';
import 'package:flutter/material.dart';

import 'fail_widget.dart';

class ResultButton {
  Widget RBUtton(Size size, bool resul, BuildContext context, List answers) {
    final lessonsModel =
        context.dependOnInheritedWidgetOfExactType<LessonsModel>();

    return SizedBox(
      height: size.height * 0.065,
      child: Padding(
        padding:
            EdgeInsets.fromLTRB(size.width * 0.25, 0, size.width * 0.25, 0),
        child: ElevatedButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => (resul)
                      ? SuccessScreen(
                          lessonsModel!.nombloq,
                          lessonsModel.bloque,
                          lessonsModel.nombre,
                          lessonsModel.completed,
                          answers,
                          lessonsModel.puntosl)
                      : const FailScreen())),
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
}
