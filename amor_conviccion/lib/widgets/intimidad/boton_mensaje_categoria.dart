import 'package:flutter/material.dart';

import '../../Screens/Lessons/Mensaje_Intimo/send_message_screen.dart';

class BotonMensaje extends StatelessWidget {
  BotonMensaje(this.opc, {Key? key}) : super(key: key);

  final int opc; //opcion seleccionada

  late String text; //Texto a mostrar
  late String img; //Imagen a desplegar
  @override
  Widget build(BuildContext context) {
    switch (opc) {
      case 1:
        text = 'Padres a hijos';
        img = 'padres_hijos';
        break;
      case 2:
        text = 'Padre a hijo';
        img = 'padre_hijo';
        break;
      case 3:
        text = 'Madre a hija';
        img = 'madre_hija';
        break;
    }
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          switch (opc) {
            case 1:
              return SendMessage(1);
            case 2:
              return SendMessage(2);
            case 3:
              return SendMessage(3);
          }
          return SendMessage(4);
        }));
      },
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(35.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF42ADE2),
                spreadRadius: 3,
                blurRadius: 10,
              )
            ]),
        child: Stack(
          children: [
            InkWell(
              child: SizedBox(
                width: size.width * 0.45,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35.0),
                  child: Image.asset('assets/Icons/$img.jpg'),
                ),
              ),
            ),
            Positioned(
                left: size.width * 0.04,
                bottom: size.height * 0.005,
                child: mainText(size))
          ],
        ),
      ),
    );
  }

  Widget mainText(Size size) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: size.width * 0.052,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 6
              ..color = Colors.white,
          ),
        ),
        shadowText(size),
      ],
    );
  }

  Widget shadowText(Size size) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: size.width * 0.052,
        color: const Color(0xFFFCD010),
      ),
    );
  }
}
