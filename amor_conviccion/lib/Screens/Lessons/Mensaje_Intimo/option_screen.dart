import 'package:amor_conviccion/models/lessons_model.dart';
import 'package:flutter/material.dart';

import '../../../widgets/intimidad/boton_mensaje_categoria.dart';

class OptionScreen extends StatelessWidget {
  const OptionScreen(this.nombloq, this.nombre, {Key? key}) : super(key: key);

  final String nombloq;
  final String nombre;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LessonsModel(
      nombloq: nombloq,
      bloque: 0,
      nombre: nombre,
      completed: false,
      puntosl: 0,
      child: Builder(builder: (BuildContext innercontext) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: size.height * 0.1,
                ),
                Text(
                  '¿A quien va dirigido el mensaje?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width * 0.05,
                    fontFamily: 'Comfortaa',
                  ),
                ),
                SizedBox(
                  height: size.height * 0.15,
                ),
                BotonMensaje(1),
                SizedBox(
                  height: size.height * 0.15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    BotonMensaje(2),
                    BotonMensaje(3),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
