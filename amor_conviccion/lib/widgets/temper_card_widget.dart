import 'package:flutter/material.dart';

typedef answercallback = void Function(String val);

class TemperCardWidget extends StatelessWidget {
  final answercallback answers;

  const TemperCardWidget(this.temperamento, this.debilidades, this.fortalezas,
      {Key? key, required this.answers})
      : super(key: key);

  final String temperamento;
  final List debilidades;
  final List fortalezas;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        color: Colors.orange,
        child: Card(
            child: Material(
          color: Colors.white,
          child: InkWell(
            onTap: () {
              answers(temperamento);
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    temperamento,
                    style: TextStyle(
                        color: Colors.black, fontSize: size.width * 0.06),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'Fortalezas',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.045),
                        ),
                        for (int i = 0; i < fortalezas.length; i++)
                          Padding(
                            padding: EdgeInsets.only(top: size.height * 0.04),
                            child: Text(
                              fortalezas[i].toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: size.width * 0.035),
                            ),
                          )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Debilidades',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.045),
                        ),
                        for (int i = 0; i < debilidades.length; i++)
                          Padding(
                            padding: EdgeInsets.only(top: size.height * 0.04),
                            child: Text(
                              debilidades[i].toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: size.width * 0.035),
                              maxLines: 2,
                            ),
                          )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        )));
  }
}
