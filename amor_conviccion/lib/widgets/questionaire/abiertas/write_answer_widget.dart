import 'package:flutter/material.dart';

typedef answercallback = void Function(String val);

class WriteAnswer extends StatefulWidget {
  final answercallback answers;

  const WriteAnswer(this.option, this.pregunta, this.textEditingController,
      {Key? key, required this.answers})
      : super(key: key);

  final bool option; //Saber si escribira texto o numeros
  final String pregunta; //Pregunta de la leccion
  final textEditingController;
  @override
  _WriteAnswer createState() => _WriteAnswer();
}

class _WriteAnswer extends State<WriteAnswer> {
  late bool option = widget.option;
  late String pregunta = widget.pregunta;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          children: [
            Text(
              pregunta,
              style: TextStyle(
                fontFamily: 'Comfortaa',
                fontSize: size.width * 0.045,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            (option)
                ? TextFormField(
                    onChanged: (texto) {
                      widget.answers(texto);
                    },
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: size.width * 0.045,
                    ),
                    controller: widget.textEditingController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value != null && value.length < 1
                        ? 'No debe estar vacio'
                        : null,
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
                    width: size.width * 0.15,
                    child: TextFormField(
                        onChanged: (texto) {
                          widget.answers(texto);
                        },
                        maxLength: 2,
                        textAlign: TextAlign.center,
                        controller: widget.textEditingController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) =>
                            value != null && value.length < 1 ? '' : null,
                        style: TextStyle(
                          fontFamily: 'Comfortaa',
                          fontSize: size.width * 0.045,
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
