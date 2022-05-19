import 'package:flutter/material.dart';

typedef intCallBack = void Function(int val);
typedef answerlist = void Function(int val);


class QuestionField extends StatefulWidget{

  final intCallBack answersCallBack;
  final answerlist answers;

  const QuestionField(this.flag, this.questions, this.points,
      {
        Key? key,
        required this.answersCallBack,
        required this.answers,
      })
      : super(key: key);

  final bool flag;
  final int points;
  final List? questions;
  @override
  _QuestionField createState() => _QuestionField();
}

class _QuestionField extends State<QuestionField>{
  bool first=true;
  late bool flag = widget.flag;
  late double height1 = 220;
  late String question = widget.questions![0], opc1 = widget.questions![1],
  opc2 = widget.questions![2], opc3 = widget.questions![3];
  late List answers = [0,0,0];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, size.width*0.04),
      child: Center(
          child: GestureDetector(
            onTap: () {
              if(!flag){
                changesize(size,3,widget.points);
              }
            },
            child: AnimatedContainer(
                clipBehavior: Clip.hardEdge,
                duration: const Duration(milliseconds: 800),
                curve: Curves.elasticInOut,
                height: height1,
                width: size.width*0.9,

                decoration: (flag)? const BoxDecoration()
                    : BoxDecoration(
                  color: const Color(0xFFee4a4a),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: (flag)? Text(question, style: const TextStyle(fontSize: 16, fontFamily: 'Comfortaa'), )
                          : Center(child: Text(question, style: const TextStyle(fontSize: 16, fontFamily: 'Comfortaa', color: Colors.white),),),
                    ),
                    (flag)?
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: SizedBox(
                            height: (answers[0]==1)? size.height*0.07 : size.height*0.055,
                            width: size.width,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: (answers[0]==1)?const Color(0xFFee4a4a) : const Color(0xFF282828)
                                ),
                                onPressed: () => changesize(size,0,widget.points),
                                child: Text(opc1, style: const TextStyle(fontFamily: 'Comfortaa'),)
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: SizedBox(
                            height: (answers[1]==1)? size.height*0.07 : size.height*0.055,
                            width: size.width,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: (answers[1]==1)?const Color(0xFFee4a4a) : const Color(0xFF282828)
                                ),
                                onPressed: () => changesize(size,1,widget.points),
                                child: Text(opc2, style: const TextStyle(fontFamily: 'Comfortaa'),)
                            ),
                          ),
                        ),
                        SizedBox(
                          height: (answers[2]==1)? size.height*0.07 : size.height*0.055,
                          width: size.width,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: (answers[2]==1)?const Color(0xFFee4a4a) : const Color(0xFF282828)
                              ),
                              onPressed: () => changesize(size,2,widget.points),
                              child: Text(opc3, style: const TextStyle(fontFamily: 'Comfortaa'),)
                          ),
                        ),
                      ],
                    ): Container(),
                  ],
                )
            ),
          )
      ),
    );
  }


  void changesize(Size size, int opc, int points) async{
    flag=!flag;
    (flag)? height1=size.height*0.3: height1 = size.width*0.18;
    (first)? {
      widget.answersCallBack(0)
    }:{
      widget.answersCallBack(-1),
      first=true
    };
    switch(opc){
      case 0:
        answers[0]=1;
        answers[1]=0;
        answers[2]=0;
        if(points==1){
          widget.answersCallBack(1);
          widget.answers(1);
          first=false;
        }
        break;
      case 1:
        answers[0]=0;
        answers[1]=1;
        answers[2]=0;
        if(points==2){
          widget.answersCallBack(1);
          widget.answers(2);
          first=false;
        }
        break;
      case 2:
        answers[0]=0;
        answers[1]=0;
        answers[2]=1;
        if(points==3){
          widget.answersCallBack(1);
          widget.answers(3);
          first=false;
        }
        break;
      default:
        break;
    }
    setState(() {});
  }
}