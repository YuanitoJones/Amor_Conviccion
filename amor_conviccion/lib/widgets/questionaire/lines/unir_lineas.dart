import 'package:flutter/material.dart';

import 'brush.dart';

typedef intCallBack = void Function(int val);
typedef answerlist = void Function(String val);

class LinesScreen extends StatefulWidget {
  const LinesScreen(this.questions, this.points,
      {required this.answersCallBack, //Puntos de la leccion
      required this.answers, //Retorna respuesta enviada
      Key? key})
      : super(key: key);

  final intCallBack answersCallBack;
  final answerlist answers;
  final List? questions; //Lista de pregunta es incisos
  final int points; //Representa la opcion correcta

  @override
  _LineScreen createState() => _LineScreen();
}

class _LineScreen extends State<LinesScreen> {
  var start_offset = ValueNotifier(Offset.zero);
  var end_offset = ValueNotifier(Offset.zero);

  var key1 = GlobalKey();
  var key2 = GlobalKey();
  var key3 = GlobalKey();
  var key4 = GlobalKey();
  var globalkey = GlobalKey();
  late double globalY = 0;

  bool first = true;
  late String question = widget.questions![0],
      opc1 = widget.questions![1],
      opc2 = widget.questions![2],
      opc3 = widget.questions![3];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Container(
        key: globalkey,
        width: size.width,
        height: 350,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        //Create canvas
        child: CustomPaint(
          foregroundPainter: Painter3(start_offset, end_offset),
          child: Column(
            children: [
              _buildItems(),
            ],
          ),
        ),
      ),
    );
  }

  //Create content
  Row _buildItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Draggable is the left column
        Draggable(
          data: 1,
          //Drag feedback
          feedback: Container(
            width: 150,
            height: 80,
            color: Colors.red,
            child: const Center(
              child: Text(
                'Respuesta',
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
          ),
          //Calculates the coordinate center point of the current box when you start dragging
          onDragStarted: () {
            _getOffset(globalkey);
            var box = key1.currentContext!.findRenderObject() as RenderBox;
            var x = box.localToGlobal(Offset.zero).dx + box.size.width;
            var y = box.localToGlobal(Offset.zero).dy -
                globalY +
                box.size.height * 0.5;
            start_offset.value = Offset(x, y);
          },
          child: Container(
            key: key1,
            width: 150,
            height: 120,
            decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.blue),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Text(
                question,
                style: const TextStyle(
                  fontSize: 15,
                  fontFamily: 'Comfortaa',
                ),
              ),
            ),
          ),
        ),

        //Dragtarget is the right column
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 10),
              child: DragTarget(
                builder: (context, c, r) => Container(
                  key: key2,
                  width: 130,
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xFF282828),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text(
                      opc1,
                      style: const TextStyle(
                        fontFamily: 'Comfortaa',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                //Get the coordinate center point of the current box after receiving the data
                onAccept: (_) {
                  var box =
                      key2.currentContext!.findRenderObject() as RenderBox;
                  var x =
                      box.localToGlobal(Offset.zero).dx - box.size.width * 0.1;
                  var y = box.localToGlobal(Offset.zero).dy -
                      globalY +
                      box.size.height * 0.5;
                  end_offset.value = Offset(x, y);
                  setState(() {
                    result(0, widget.points);
                  });
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            DragTarget(
              builder: (context, c, r) => Container(
                key: key3,
                width: 130,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFF282828),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                    child: Text(
                  opc2,
                  style: const TextStyle(
                    fontFamily: 'Comfortaa',
                    color: Colors.white,
                  ),
                )),
              ),
              onAccept: (_) {
                var box = key3.currentContext!.findRenderObject() as RenderBox;
                var x =
                    box.localToGlobal(Offset.zero).dx - box.size.width * 0.1;
                var y = box.localToGlobal(Offset.zero).dy -
                    globalY +
                    box.size.height * 0.5;
                end_offset.value = Offset(x, y);
                setState(() {
                  result(1, widget.points);
                });
              },
            ),
            const SizedBox(
              height: 50,
            ),
            DragTarget(
              builder: (context, c, r) => Container(
                key: key4,
                width: 130,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFF282828),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                    child: Text(
                  opc3,
                  style: const TextStyle(
                    fontFamily: 'Comfortaa',
                    color: Colors.white,
                  ),
                )),
              ),
              onAccept: (_) {
                var box = key4.currentContext!.findRenderObject() as RenderBox;
                var x =
                    box.localToGlobal(Offset.zero).dx - box.size.width * 0.1;
                var y = box.localToGlobal(Offset.zero).dy -
                    globalY +
                    box.size.height * 0.5;
                end_offset.value = Offset(x, y);
                setState(() {
                  result(2, widget.points);
                });
              },
            ),
          ],
        )
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

  void result(int opc, int points) {
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
      default:
        break;
    }
  }
}
