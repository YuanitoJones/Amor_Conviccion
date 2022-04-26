//import 'dart:html';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainLessons extends StatefulWidget {
  const MainLessons({Key? key}) : super(key: key);

  @override
  _MainLessons createState() => _MainLessons();
}

class _MainLessons extends State<MainLessons> {
  Widget main(Size size) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: size.height * 0.05,
        ),
        SizedBox(
          //color: Color.fromARGB(255, 255, 134, 134),
          width: double.infinity,
          child: Row(children: [
            SizedBox(
              //color: Colors.red,
              width: size.width * 0.5,
              height: size.height * 0.2,
              child: Image.asset(
                'assets/logos/pentagono.png',
              ),
            ),
            SizedBox(
              //color: Colors.orange,
              width: size.width * 0.5,
              height: size.height * 0.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'El Pentagono',
                    style: TextStyle(
                        fontSize: size.height * 0.035,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Curso',
                    style: TextStyle(
                      fontSize: size.height * 0.035,
                      color: Color.fromARGB(181, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
        Container(
            child: ElevatedButton.icon(
                onPressed: null,
                icon: const Icon(Icons.search),
                label: const Text('Pene'))),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: main(size),
    );
  }
}
