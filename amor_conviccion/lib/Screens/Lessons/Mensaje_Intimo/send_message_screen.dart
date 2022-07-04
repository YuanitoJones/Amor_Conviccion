import 'package:amor_conviccion/utils/mensajes_intimidad.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class SendMessage extends StatelessWidget {
  SendMessage(this.opc, {Key? key}) : super(key: key);

  final int opc;

  List<TextEditingController> txtcontroller =
      List.generate(3, (i) => TextEditingController());

  MapMensajes mensajes = MapMensajes();
  late Map textos;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    int cont = 0;
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
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 3,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: TextFormField(
                              readOnly: true,
                              controller: txtcontroller[index]
                                ..text = pagina![0],
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: EdgeInsets.fromLTRB(
                                  size.width * 0.03,
                                  size.height * 0.01,
                                  size.width * 0.03,
                                  size.height * 0.01,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                    width: 3.0,
                                  ),
                                ),
                              ),
                              maxLines: 5,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.3,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Share.share(txtcontroller[index].text);
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                              ),
                              icon: Icon(Icons.share),
                              label: const Text(
                                'Enviar',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}
