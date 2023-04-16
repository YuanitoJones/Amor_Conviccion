import 'package:flutter/material.dart';

class AuthorPage extends StatelessWidget {
  const AuthorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background/standard.png'),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Padding(
              padding: EdgeInsets.all(size.width * 0.06),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Text(
                          "Aplicación diseñada y desarrollada por Tecnológico Nacional de México, campus Hermosillo",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: size.width * 0.045)),
                    ),
                    Center(
                      child: Text(
                          "Autor: Juan Alexandro Rentería Abril, ingeniero en sistemas computacionales",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: size.width * 0.045)),
                    ),
                    Center(
                        child: Text("Gracias por el apoyo y la confianza!!!",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: size.width * 0.06))),
                    Center(
                      child: Text(
                          "Correo de contacto: juanrenteria55@gmail.com",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: size.width * 0.05)),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
