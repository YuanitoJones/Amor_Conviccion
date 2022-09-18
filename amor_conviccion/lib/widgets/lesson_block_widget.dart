import 'dart:async';

import 'package:flutter/material.dart';

import '../Screens/Lessons/lesson_selection_screen.dart';

class LessonBlockWidget extends StatefulWidget {
  LessonBlockWidget(this.index, {Key? key}) : super(key: key);

  final int index;
  late Color lessonBorderColor = Colors.black;
  @override
  State<StatefulWidget> createState() => _LessonBlockWidget();
}

class _LessonBlockWidget extends State<LessonBlockWidget> {
  final List<String> asset = [
    'Drogodependenciaa',
    'Liderazgoo',
    'Intimidadd',
    'Anomiaa',
    'Amor_Perdonn'
  ];

  final List<String> bloqnom = [
    'Drogodependencia',
    'Liderazgo',
    'Intimidad',
    'Anomia',
    'Amor y Perdon'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 4, color: widget.lessonBorderColor),
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: EdgeInsets.fromLTRB(
        size.width * 0.1,
        size.height * 0.03,
        size.width * 0.1,
        0,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFfcd010),
          padding: EdgeInsets.fromLTRB(
            0,
            size.width * 0.08,
            0,
            size.width * 0.08,
          ),
          foregroundColor: Colors.black54,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () => {
          setState(() => {
                widget.lessonBorderColor = Colors.green,
              }),
          Timer(const Duration(milliseconds: 180), () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LessonSelectionScreen(
                        widget.index + 1, bloqnom[widget.index])));
            setState(() => {
                  widget.lessonBorderColor = Colors.black,
                });
          })
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: SizedBox(
                  height: size.height * 0.08,
                  child:
                      Image.asset('assets/Icons/${asset[widget.index]}.png')),
            ),
            SizedBox(
              width: size.width * 0.5,
              child: Column(
                children: [
                  Text(
                    bloqnom[widget.index],
                    style: TextStyle(
                        fontSize: size.width * 0.05, color: Colors.black),
                  ),
                  Text(
                    'Bloque #${widget.index + 1}',
                    style: TextStyle(
                      fontSize: size.width * 0.035,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
