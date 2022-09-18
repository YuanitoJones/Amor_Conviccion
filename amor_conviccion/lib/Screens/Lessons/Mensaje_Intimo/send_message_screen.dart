import 'package:amor_conviccion/models/lessons_model.dart';
import 'package:amor_conviccion/utils/mensajes_intimidad.dart';
import 'package:amor_conviccion/widgets/intimidad/mensajes.dart';
import 'package:flutter/material.dart';

import '../../../services/UpdateInfo.dart';

class SendMessage extends StatelessWidget {
  SendMessage(this.opc, {Key? key}) : super(key: key);

  final int opc;

  MapMensajes mensajes = MapMensajes();
  late Map textos;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final lessonsModel =
        context.dependOnInheritedWidgetOfExactType<LessonsModel>();

    switch (opc) {
      case 1:
        textos = mensajes.padres_hijos;
        break;
      case 2:
        textos = mensajes.padre_hijo;
        break;
      case 3:
        textos = mensajes.madre_hija;
        break;
    }
    late List? pagina;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Asegurate de enviar todos los mensajes!',
            style: TextStyle(
              color: Colors.black,
              fontSize: size.width * 0.045,
            ),
          ),
          SizedBox(
            height: size.height * 0.8,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                pagina = textos[index];
                return Mensajes(index, pagina);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.03),
            child: SizedBox(
              height: size.height * 0.065,
              width: size.width * 0.35,
              child: ElevatedButton(
                  onPressed: () {
                    UpdateLesson lesson = UpdateLesson();
                    lesson.updateCompleted(
                        lessonsModel!.nombloq, lessonsModel.nombre);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_forward_rounded,
                    size: 35,
                  )),
            ),
          ),
        ],
      ),
    ));
  }
}
