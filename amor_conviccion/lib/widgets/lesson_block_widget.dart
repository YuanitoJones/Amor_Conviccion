import 'package:flutter/material.dart';

import '../Screens/Lessons/lesson_selection_screen.dart';

class LessonBlockWidget extends StatelessWidget {
  LessonBlockWidget(this.index, {Key? key}) : super(key: key);

  final int index;

  final List<String> asset = [
    'drogodependencia',
    'mochila',
    'noto_heartsuit',
    'noto_heartsuit',
    'noto_heartsuit'
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
        border: Border.all(width: 4, color: const Color(0xFFFF7E27)),
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
          backgroundColor: Colors.white,
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
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    LessonSelectionScreen(index + 1, bloqnom[index]))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                height: size.height * 0.08,
                child: Image.asset('assets/Icons/${asset[index]}.png')),
            Column(
              children: [
                Text(
                  bloqnom[index],
                  style: TextStyle(
                    fontSize: size.width * 0.05,
                  ),
                ),
                Text(
                  'Bloque #${index + 1}',
                  style: TextStyle(
                    fontSize: size.width * 0.035,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
