import 'package:flutter/material.dart';

class AuthorPage extends StatelessWidget {
  const AuthorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(children: [
            SizedBox(
              height: size.height * 0.4,
            ),
            Padding(
              padding: EdgeInsets.all(size.width * 0.1),
              child: Column(children: [
                Center(
                  child: Text(
                    "Aplicación diseñada y desarrollada por Tecnológico Nacional de México, campus Hermosillo",
                    style: TextStyle(  fontSize: size.width * 0.04)),
                ),
                
                    SizedBox(height:size.height*0.02),
                Text("Autor: Juan Allexandro Rentería Abril",
                    style: TextStyle(fontSize: size.width * 0.04))
              ]),
            )
          ]),
        ),
      ),
    );
  }
}
