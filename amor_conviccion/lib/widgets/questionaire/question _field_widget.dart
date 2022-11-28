import 'package:flutter/material.dart';

typedef intCallBack = void Function(int val);
typedef answerlist = void Function(String val);

class QuestionField extends StatefulWidget {
  final intCallBack answersCallBack;
  final answerlist answers;

  const QuestionField(
    this.size,
    this.flag,
    this.questions,
    this.points, {
    Key? key,
    required this.answersCallBack, //Representa la puntuacion de la leccion
    required this.answers, //Retorna numero con respuesta
  }) : super(key: key);

  final Size size;
  final bool flag; // Para diferencia entre estado de container
  final int points; // representa la opcion correcta
  final List? questions; //Lista de pregunta e incisos
  @override
  _QuestionField createState() => _QuestionField();
}

class _QuestionField extends State<QuestionField> {
  bool first = true; //Bandera que indica si ya se ha seleccionado una opcion
  late bool flag = widget.flag;
  late double height1 =
      widget.size.height * 0.345; //Tamaño inicial de contenedor
  late String question = widget.questions![0],
      opc1 = widget.questions![1],
      opc2 = widget.questions![2],
      opc3 = widget.questions![3];
  late List answers = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, size.width * 0.04),
      child: Center(
          child: GestureDetector(
        onTap: () {
          if (!flag) {
            changesize(size, 3, widget.points);
          }
        },
        child: AnimatedContainer(
            clipBehavior: Clip.hardEdge,
            duration: const Duration(milliseconds: 800),
            curve: Curves.elasticInOut,
            height: height1,
            width: size.width * 0.9,
            decoration: (flag)
                ? const BoxDecoration()
                : BoxDecoration(
                    color: const Color(0xFF42ADE2),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: (flag)
                      ? Text(
                          question,
                          style: TextStyle(fontSize: size.width * 0.041),
                        )
                      : Center(
                          child: Text(
                            question,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                        ),
                ),
                (flag)
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: SizedBox(
                              height: (answers[0] == 1)
                                  ? size.height * 0.075
                                  : size.height * 0.07,
                              width: size.width,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: (answers[0] == 1)
                                          ? const Color(0xFF42ADE2)
                                          : Colors.black54),
                                  onPressed: () =>
                                      changesize(size, 0, widget.points),
                                  child: Text(
                                    opc1,
                                    style: TextStyle(
                                        fontSize: size.width * 0.0356),
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: SizedBox(
                              height: (answers[1] == 1)
                                  ? size.height * 0.075
                                  : size.height * 0.07,
                              width: size.width,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: (answers[1] == 1)
                                          ? const Color(0xFF42ADE2)
                                          : Colors.black54),
                                  onPressed: () =>
                                      changesize(size, 1, widget.points),
                                  child: Text(
                                    opc2,
                                    style: TextStyle(
                                        fontSize: size.width * 0.0356),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: (answers[2] == 1)
                                ? size.height * 0.075
                                : size.height * 0.07,
                            width: size.width,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: (answers[2] == 1)
                                        ? const Color(0xFF42ADE2)
                                        : Colors.black54),
                                onPressed: () =>
                                    changesize(size, 2, widget.points),
                                child: Text(
                                  opc3,
                                  style:
                                      TextStyle(fontSize: size.width * 0.0356),
                                )),
                          ),
                        ],
                      )
                    : Container(),
              ],
            )),
      )),
    );
  }

  void changesize(Size size, int opc, int points) async {
    flag = !flag;
    (flag) ? height1 = size.height * 0.345 : height1 = size.width * 0.17;
    (first)
        ? {widget.answersCallBack(0)}
        : {widget.answersCallBack(-1), first = true};

    switch (opc) {
      case 0:
        answers[0] = 1;
        answers[1] = 0;
        answers[2] = 0;
        if (points == 1) {
          widget.answersCallBack(1);
          widget.answers('1');
          first = false;
        }
        break;
      case 1:
        answers[0] = 0;
        answers[1] = 1;
        answers[2] = 0;
        if (points == 2) {
          widget.answersCallBack(1);
          widget.answers('2');
          first = false;
        }
        break;
      case 2:
        answers[0] = 0;
        answers[1] = 0;
        answers[2] = 1;
        if (points == 3) {
          widget.answersCallBack(1);
          widget.answers('3');
          first = false;
        }
        break;
      default:
        break;
    }
    setState(() {});
  }
}
