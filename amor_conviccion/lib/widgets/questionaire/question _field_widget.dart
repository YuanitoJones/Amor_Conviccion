import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionField extends StatefulWidget{
  QuestionField(this.flag, this.questions,
      {Key? key}) : super(key: key);

  final bool flag;
  final List? questions;
  @override
  _QuestionField createState() => _QuestionField();
}

class _QuestionField extends State<QuestionField>{
  late bool flag = widget.flag;
  late double height1 = 200;
  late String question = widget.questions![0], opc1 = widget.questions![1],
  opc2 = widget.questions![2], opc3 = widget.questions![3];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(0, size.width*0.06, 0, 0),
      child: Center(
          child: GestureDetector(
            onTap: () {
              if(!flag){
                changesize(size);
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
                    padding: EdgeInsets.all(10.0),
                    child: Text(question),
                  ),
                  (flag)?
                  Column(
                    children: [
                      Container(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.lightBlue
                          ),
                            onPressed: () => changesize(size),
                            child: Text(opc1)
                        ),
                        width: size.width,
                      ),
                      Container(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.lightBlue
                            ),
                            onPressed: () => changesize(size),
                            child: Text(opc2)
                        ),
                        width: size.width,
                      ),
                      Container(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.lightBlue
                            ),
                            onPressed: () => changesize(size),
                            child: Text(opc3)
                        ),
                        width: size.width,
                      ),
                    ],
                  ): Container(),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                //borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          )
      ),
    );
  }


  void changesize(Size size) async{
    flag=!flag;
    print(flag);
    (flag)? height1=200: height1 = size.width*0.13;
    setState(() {});
  }
}