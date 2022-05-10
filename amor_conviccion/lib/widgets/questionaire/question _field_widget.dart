import 'package:flutter/material.dart';

typedef intCallBack = void Function(int val);


class QuestionField extends StatefulWidget{

  final intCallBack answersCallBack;

  const QuestionField(this.flag, this.questions, this.points,
      {
        Key? key,
        required this.answersCallBack,
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
  late double height1 = 200;
  late String question = widget.questions![0], opc1 = widget.questions![1],
  opc2 = widget.questions![2], opc3 = widget.questions![3];
  late List answers = [0,0,0];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(0, size.width*0.11, 0, 0),
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
              width: size.width,
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(question),
                  ),
                  (flag)?
                  Column(
                    children: [
                      SizedBox(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: (answers[0]==1)?Colors.indigo : Colors.lightBlue
                          ),
                            onPressed: () => changesize(size,0,widget.points),
                            child: Text(opc1)
                        ),
                        width: size.width,
                      ),
                      SizedBox(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: (answers[1]==1)?Colors.indigo : Colors.lightBlue
                            ),
                            onPressed: () => changesize(size,1,widget.points),
                            child: Text(opc2)
                        ),
                        width: size.width,
                      ),
                      SizedBox(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: (answers[2]==1)?Colors.indigo : Colors.lightBlue
                            ),
                            onPressed: () => changesize(size,2,widget.points),
                            child: Text(opc3)
                        ),
                        width: size.width,
                      ),
                    ],
                  ): Container(),
                ],
              ),
              decoration: const BoxDecoration(
                color: Colors.blue,
                //borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          )
      ),
    );
  }


  void changesize(Size size, int opc, int points) async{
    flag=!flag;
    (flag)? height1=200: height1 = size.width*0.13;
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
          first=false;
        }
        break;
      case 1:
        answers[0]=0;
        answers[1]=1;
        answers[2]=0;
        if(points==2){
          widget.answersCallBack(1);
          first=false;
        }
        break;
      case 2:
        answers[0]=0;
        answers[1]=0;
        answers[2]=1;
        if(points==3){
          widget.answersCallBack(1);
          first=false;
        }
        break;
      default:
        break;
    }
    setState(() {});
  }
}