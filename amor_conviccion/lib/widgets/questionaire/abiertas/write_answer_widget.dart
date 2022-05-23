import 'package:flutter/material.dart';

typedef answercallback = void Function(String val);

class WriteAnswer extends StatefulWidget {
  final answercallback answers;

  const WriteAnswer(this.option, this.pregunta,
      {Key? key, required this.answers})
      : super(key: key);

  final bool option; //Saber si escribira texto o numeros
  final List? pregunta; //Pregunta de la leccion

  @override
  _WriteAnswer createState() => _WriteAnswer();
}

class _WriteAnswer extends State<WriteAnswer> {
  late bool option = widget.option;
  late List? pregunta = widget.pregunta;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          children: [
            Text(
              pregunta![0],
              style: const TextStyle(
                fontFamily: 'Comfortaa',
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            (option)
                ? TextFormField(
                    onChanged: (texto) {
                      widget.answers(texto);
                    },
                    style: const TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      counterText: "",
                      filled: true,
                      fillColor: const Color.fromRGBO(242, 242, 242, 1),
                      hintText: ('Respuesta'),
                    ),
                    keyboardType: TextInputType.multiline,
                    minLines: 1, //Normal textInputField will be displayed
                    maxLines: 5,
                  )
                : SizedBox(
                    width: 60,
                    child: TextFormField(
                        onChanged: (texto) {
                          widget.answers(texto);
                        },
                        maxLength: 2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Comfortaa',
                          fontSize: 20,
                        ),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          counterText: "",
                          filled: true,
                          fillColor: const Color.fromRGBO(242, 242, 242, 1),
                        )),
                  ),
          ],
        ),
      ),
    );
  }
}
