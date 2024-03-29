import 'package:flutter/material.dart';

import 'brush.dart';

typedef IntCallBack = void Function(int val);
typedef Answerlist = void Function(String val);
typedef Descallback = void Function(String val);

class LinesScreen extends StatefulWidget {
  const LinesScreen(
      this.description, this.questions, this.points, this.anyAnswer,
      {required this.answersCallBack, //Puntos de la leccion
      required this.answers, //Retorna respuesta enviada
      required this.descriptioncallback,
      Key? key})
      : super(key: key);

  final bool description; // Mostrar descripcion de campos
  final Descallback descriptioncallback;
  final IntCallBack answersCallBack;
  final Answerlist answers;
  final List? questions; //Lista de pregunta e incisos
  final int points; //Representa la opcion correcta
  final bool anyAnswer; //Acepta cualquier respuesta

  @override
  State<LinesScreen> createState() => _LineScreen();
}

class _LineScreen extends State<LinesScreen> {
  var startOffset = ValueNotifier(Offset.zero);
  var endOffset = ValueNotifier(Offset.zero);

  late var key =
      List.generate(widget.questions!.length + 2, (index) => GlobalKey());

  late double globalY = 0;

  bool first =
      true; // Flag para saber si es el primer inciso enviado (evita ue puntuacion baje de 0)
  bool flag =
      false; //Flag para saber si ya se encuentra seleccionada una opcion

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Container(
        key: key[0],
        width: size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        //Create canvas
        child: CustomPaint(
          foregroundPainter: Painter3(startOffset, endOffset),
          child: Column(
            children: [
              _buildItems(size),
            ],
          ),
        ),
      ),
    );
  }

  //Create content
  Row _buildItems(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Draggable is the left column
        Draggable(
          key: widget.key,
          data: 1,
          //Drag feedback
          feedback: Container(),
          //Calculates the coordinate center point of the current box when you start dragging
          onDragStarted: () {
            flag = false;
            result(-1, -1, '');
            _getOffset(key[0]);
            var box = key[1].currentContext!.findRenderObject() as RenderBox;
            var x = box.localToGlobal(Offset.zero).dx + box.size.width;
            var y = box.localToGlobal(Offset.zero).dy -
                globalY +
                box.size.height * 0.5;
            startOffset.value = Offset(x, y);
          },
          onDragEnd: (touch) {
            if (!flag) {
              endOffset = ValueNotifier(Offset.zero);
            }
            setState(() {});
          },
          onDragUpdate: (touch) {
            var x = touch.globalPosition.dx;
            var y = touch.globalPosition.dy - globalY;
            endOffset.value = Offset(x, y);
            setState(() {});
          },
          child: Container(
            key: key[1],
            width: size.width * 0.4,
            height: size.height * 0.17,
            decoration: BoxDecoration(
              color: Colors.blue[300],
              // border: Border.all(width: 3, color: Colors.blue),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Text(
                widget.questions![0],
                style:
                    TextStyle(fontSize: size.width * 0.04, color: Colors.black),
              ),
            ),
          ),
        ),

        Column(children: [
          for (int i = 0; i < (widget.questions!.length - 1); i++)
            Padding(
                padding: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
                child: GestureDetector(
                  onTap: () {
                    if (widget.description) {
                      widget.descriptioncallback(widget.questions![i + 1]);
                    }
                  },
                  child: DragTarget(
                    builder: (context, c, r) => Container(
                      key: key[i + 2],
                      width: size.width * 0.35,
                      height: size.height * 0.11,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 3, color: const Color(0xFF87EDF1)),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Center(
                        child: Text(
                          widget.questions![i + 1],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Comfortaa',
                            color: Colors.black,
                            fontSize: size.width * 0.04,
                          ),
                        ),
                      ),
                    ),
                    //Get the coordinate center point of the current box after receiving the data
                    onAccept: (_) {
                      flag = true;
                      var box = key[i + 2].currentContext!.findRenderObject()
                          as RenderBox;
                      var x = box.localToGlobal(Offset.zero).dx -
                          box.size.width * 0.1;
                      var y = box.localToGlobal(Offset.zero).dy -
                          globalY +
                          box.size.height * 0.5;
                      endOffset.value = Offset(x, y);
                      setState(() {
                        widget.anyAnswer
                            ? result(
                                50, widget.points, widget.questions![i + 1])
                            : result(i, widget.points, '');
                      });
                    },
                  ),
                )),
        ]),
        //Dragtarget is the right column
      ],
    );
  }

  void _getOffset(GlobalKey key) {
    RenderBox? box = key.currentContext?.findRenderObject() as RenderBox?;
    Offset? position = box?.localToGlobal(Offset.zero);
    if (position != null) {
      setState(() {
        globalY = position.dy;
      });
    }
  }

  void result(int opc, int points, String texto) {
    (first)
        ? {widget.answersCallBack(0)}
        : {widget.answersCallBack(-1), first = true};
    switch (opc) {
      case 0:
        if (points == 1) {
          widget.answersCallBack(1);
          widget.answers('1');
          first = false;
        }
        break;
      case 1:
        if (points == 2) {
          widget.answersCallBack(1);
          widget.answers('2');
          first = false;
        }
        break;
      case 2:
        if (points == 3) {
          widget.answersCallBack(1);
          widget.answers('3');
          first = false;
        }
        break;
      case 50:
        widget.answersCallBack(1);
        widget.answers(texto);
        first = false;
        break;
      default:
        (first)
            ? {widget.answersCallBack(0)}
            : {widget.answersCallBack(-1), first = true};
        break;
    }
  }
}
