import 'package:amor_conviccion/models/lessons_model.dart';
import 'package:amor_conviccion/widgets/questionaire/success_widget.dart';
import 'package:flutter/material.dart';

import 'fail_widget.dart';

class ResultButton {
  Widget RBUtton(Size size, bool resul, BuildContext context, List questions,
      List answers, GlobalKey<FormState>? formKey) {
    final lessonsModel =
        context.dependOnInheritedWidgetOfExactType<LessonsModel>();

    return SizedBox(
      height: size.height * 0.065,
      width: size.width * 0.35,
      child: ElevatedButton(
          onPressed: () {
            if (formKey != null) {
              if (!formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Favor de llenar los campos obligatorios')));
                return;
              }
            }
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => (resul)
                        ? SuccessScreen(
                            lessonsModel!.nombloq,
                            lessonsModel.bloque,
                            lessonsModel.nombre,
                            lessonsModel.completed,
                            questions,
                            answers,
                            lessonsModel.puntosl)
                        : const FailScreen()));
          },
          child: const Icon(
            Icons.arrow_forward_rounded,
            size: 40,
          )),
    );
  }
}
