import 'package:flutter/material.dart';

import '../../../widgets/intimidad/boton_mensaje_categoria.dart';

class OptionScreen extends StatelessWidget {
  const OptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
  }
}
