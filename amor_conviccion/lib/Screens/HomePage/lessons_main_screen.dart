import 'package:amor_conviccion/widgets/lesson_block_widget.dart';
import 'package:amor_conviccion/widgets/main_logo_widget.dart';
import 'package:flutter/material.dart';

class MainLessons extends StatelessWidget {
  const MainLessons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: size.height * 0.35,
          decoration: const BoxDecoration(
              color: Color(0xFF42ADE2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const MainLogoWidget(),
                      Column(
                        children: [
                          Text(
                            'El Pentagono',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.07,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Curso',
                            style: TextStyle(
                                fontSize: size.width * 0.06,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.6,
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return LessonBlockWidget(index);
                      }),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
