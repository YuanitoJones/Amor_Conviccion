import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class Mensajes extends StatelessWidget {
  Mensajes(this.index, this.mensajes, {Key? key}) : super(key: key);

  final int index;
  final List? mensajes;
  List<TextEditingController> txtcontroller =
      List.generate(3, (i) => TextEditingController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  child: RawScrollbar(
                    thumbColor: const Color(0xFF42ADE2),
                    thickness: 2,
                    child: TextFormField(
                      readOnly: true,
                      controller: txtcontroller[index]..text = mensajes![0],
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
                  )),
              SizedBox(
                width: size.width * 0.3,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Share.share(txtcontroller[index].text);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  icon: const Icon(Icons.share),
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
  }
}
