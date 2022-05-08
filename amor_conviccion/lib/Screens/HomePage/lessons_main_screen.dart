import 'package:flutter/material.dart';

class MainLessons extends StatelessWidget {
  const MainLessons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: size.height * 0.03),
            // -----------------------------------------------------------------
            // Remover el espacio extra entre la imagen y el container.
            // -----------------------------------------------------------------
            // color: Colors.orange,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/logos/pentagono.png',
                  width: size.width * 0.35,
                ),
                Column(
                  children: [
                    Text(
                      'El Pentagono',
                      style: TextStyle(
                        fontSize: size.width * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Curso',
                      style: TextStyle(
                        fontSize: size.width * 0.05,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // Bloque #1
                margin: EdgeInsets.fromLTRB(
                  size.width * 0.15,
                  size.height * 0.03,
                  size.width * 0.15,
                  0,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // -----------------------------------------------------------
                    // Modificar el size.width para el top y bottom en el padding.
                    // -----------------------------------------------------------
                    padding: EdgeInsets.fromLTRB(
                      0,
                      size.width * 0.1,
                      0,
                      size.width * 0.1,
                    ),
                    onPrimary: Colors.black,
                    // -------------------------------------------------------
                    // El borde redondeado esta con un valor estatico.
                    // -------------------------------------------------------
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () => print('El rente es gey'),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.book,
                        size: size.width * .125,
                      ),
                      Column(
                        children: [
                          Text(
                            'Lección',
                            style: TextStyle(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Bloque #1',
                            style: TextStyle(
                              fontSize: size.width * 0.035,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                // Bloque #2
                margin: EdgeInsets.fromLTRB(
                  size.width * 0.15,
                  size.height * 0.03,
                  size.width * 0.15,
                  0,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // -----------------------------------------------------------
                    // Modificar el size.width para el top y bottom en el padding.
                    // -----------------------------------------------------------
                    padding: EdgeInsets.fromLTRB(
                      0,
                      size.width * 0.04,
                      0,
                      size.width * 0.04,
                    ),
                    onPrimary: Colors.black,
                    // -------------------------------------------------------
                    // El borde redondeado esta con un valor estatico.
                    // -------------------------------------------------------
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.book,
                        size: size.width * .125,
                      ),
                      Column(
                        children: [
                          Text(
                            'Lección',
                            style: TextStyle(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Bloque #2',
                            style: TextStyle(
                              fontSize: size.width * 0.035,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                // Bloque #3
                margin: EdgeInsets.fromLTRB(
                  size.width * 0.15,
                  size.height * 0.03,
                  size.width * 0.15,
                  0,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // -----------------------------------------------------------
                    // Modificar el size.width para el top y bottom en el padding.
                    // -----------------------------------------------------------
                    padding: EdgeInsets.fromLTRB(
                      0,
                      size.width * 0.04,
                      0,
                      size.width * 0.04,
                    ),
                    onPrimary: Colors.black,
                    // -------------------------------------------------------
                    // El borde redondeado esta con un valor estatico.
                    // -------------------------------------------------------
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.book,
                        size: size.width * .125,
                      ),
                      Column(
                        children: [
                          Text(
                            'Lección',
                            style: TextStyle(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Bloque #3',
                            style: TextStyle(
                              fontSize: size.width * 0.035,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                // Bloque #4
                margin: EdgeInsets.fromLTRB(
                  size.width * 0.15,
                  size.height * 0.03,
                  size.width * 0.15,
                  0,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // -----------------------------------------------------------
                    // Modificar el size.width para el top y bottom en el padding.
                    // -----------------------------------------------------------
                    padding: EdgeInsets.fromLTRB(
                      0,
                      size.width * 0.04,
                      0,
                      size.width * 0.04,
                    ),
                    onPrimary: Colors.black,
                    // -------------------------------------------------------
                    // El borde redondeado esta con un valor estatico.
                    // -------------------------------------------------------
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.book,
                        size: size.width * .125,
                      ),
                      Column(
                        children: [
                          Text(
                            'Lección',
                            style: TextStyle(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Bloque #4',
                            style: TextStyle(
                              fontSize: size.width * 0.035,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                // Bloque #5
                margin: EdgeInsets.fromLTRB(
                  size.width * 0.15,
                  size.height * 0.03,
                  size.width * 0.15,
                  size.height * 0.03,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // -----------------------------------------------------------
                    // Modificar el size.width para el top y bottom en el padding.
                    // -----------------------------------------------------------
                    padding: EdgeInsets.fromLTRB(
                      0,
                      size.width * 0.04,
                      0,
                      size.width * 0.04,
                    ),
                    onPrimary: Colors.black,
                    // -------------------------------------------------------
                    // El borde redondeado esta con un valor estatico.
                    // -------------------------------------------------------
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.book,
                        size: size.width * .125,
                      ),
                      Column(
                        children: [
                          Text(
                            'Lección',
                            style: TextStyle(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Bloque #5',
                            style: TextStyle(
                              fontSize: size.width * 0.035,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
