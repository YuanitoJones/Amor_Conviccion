import 'package:amor_conviccion/utils/mensajes_intimidad.dart';
import 'package:amor_conviccion/widgets/intimidad/mensajes.dart';
import 'package:flutter/material.dart';

class SendMessage extends StatelessWidget {
  SendMessage(this.opc, {Key? key}) : super(key: key);

  final int opc;

  MapMensajes mensajes = MapMensajes();
  late Map textos;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
        ],
      ),
    ));
  }
}
