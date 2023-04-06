import 'package:amor_conviccion/services/UpdateInfo.dart';
import 'package:amor_conviccion/utils/lecturas.dart';
import 'package:flutter/material.dart';

class LectureScreen extends StatefulWidget {
  const LectureScreen(this.nombloq, this.bloque, this.nombre, this.flag,
      {Key? key})
      : super(key: key);

  final bool flag;
  final String nombloq;
  final String nombre;
  final int bloque;

  @override
  State<LectureScreen> createState() => _LectureScreenState();
}

class _LectureScreenState extends State<LectureScreen> {
  MapLectura bloque = MapLectura();
  late Map lectura;
  late int contador = 0;

  final List<String> asset = [
    '',
    'Drogodependencia',
    'Liderazgo',
    'Intimidad',
    'Anomia',
    'Amor_Perdón'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    switch (widget.bloque) {
      case 1:
        lectura = bloque.drogodependencia;
        break;
      case 2:
        lectura = bloque.liderazgo;
        break;
      case 3:
        lectura = bloque.intimidad;
        break;
      case 4:
        lectura = bloque.anomia;
        break;
      case 5:
        lectura = bloque.amorPerdon;
        break;
    }
    late List? pagina = lectura[contador];

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background/standard.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: const Color(0xFF42ADE2),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom:
                  Radius.circular(25), //-------------------------------------
            ),
          ),
          leading: IconButton(
            splashRadius:
                28, //--------------------------------------------------
            onPressed: () {
              if (contador != 0) {
                contador--;
                pagina = lectura[contador];
                setState(() {});
              } else {
                Navigator.pop(context);
              }
            },
            icon: const Icon(
              Icons.keyboard_backspace_rounded,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => {},
              child: Text(
                pagina![0],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width *
                      0.055, //------------------------------------------------
                ),
              ),
            ),
          ],
        ),
        body: Container(
          padding:
              const EdgeInsets.all(20), //-----------------------------------
          width: size.width,
          child: Column(
            children: [
              Container(
                // -------------------------------------------- Titulo y subtitulo
                margin:
                    const EdgeInsets.only(bottom: 20), //---------------------
                child: Column(
                  children: [
                    Text(
                      pagina![1],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: size.width *
                            0.08, //------------------------------------------
                      ),
                    ),
                    Text(
                      'Lectura',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: size.width * 0.06,
                        //------------------------------------------------
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // ------------------------------------------------------- Lectura
                margin: EdgeInsets.only(bottom: size.height * 0.03),
                //---------------------
                padding: EdgeInsets.all(size.height * 0.03),
                //-----------------------------
                width: size.width,
                height: size.height * 0.35,
                //---------------------------------------------------
                decoration: BoxDecoration(
                  color: const Color(0xFF87EDF1),
                  borderRadius:
                      BorderRadius.circular(25), //---------------------
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 0,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: RawScrollbar(
                    thumbVisibility: true,
                    thumbColor: const Color(0xFF42ADE2),
                    thickness: 1.5,
                    child: SingleChildScrollView(
                      child: Text(
                        pagina![2],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: size.width * 0.045,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: size.height * 0.15,
                margin:
                    const EdgeInsets.only(bottom: 20), //---------------------
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: SizedBox(
                      height: size.height * 0.1,
                      child: Image.asset(
                          'assets/Icons/${asset[widget.bloque]}.png')),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (contador != 0)
                      ? SizedBox(
                          // ----------------------------------------------- Boton Siguiente
                          width: size.width * 0.35,
                          height: size.height * 0.065,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFfcd010),
                                elevation: 4,
                              ),
                              onPressed: () {
                                //Seccion dinamica de las lecturas
                                if (contador != 0) {
                                  contador--;
                                  pagina = lectura[contador];
                                  setState(() {});
                                }
                              },
                              child: const Icon(
                                Icons.arrow_back_rounded,
                                size: 30,
                                color: Colors.black,
                              )),
                        )
                      : Container(),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.06),
                    child: SizedBox(
                      // ----------------------------------------------- Boton Siguiente
                      width: size.width * 0.35,
                      height: size.height * 0.065,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF42ADE2),
                            elevation: 4,
                          ),
                          onPressed: () {
                            //Seccion dinamica de las lecturas
                            if (contador != lectura.length - 1) {
                              contador++;
                              pagina = lectura[contador];
                              setState(() {});
                            } else {
                              if (!widget.flag) {
                                UpdateLesson lesson = UpdateLesson();
                                lesson.updateCompleted(
                                    widget.nombloq, widget.nombre);
                              }
                              Navigator.pop(context);
                              Navigator.pop(context);
                            }
                          },
                          child: const Icon(
                            Icons.arrow_forward_rounded,
                            size: 30,
                          )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
