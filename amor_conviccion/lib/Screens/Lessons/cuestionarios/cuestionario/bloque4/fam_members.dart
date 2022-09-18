import 'package:flutter/material.dart';

import '../../../../../widgets/questionaire/abiertas/write_answer_widget.dart';

typedef MembersCallBack = void Function(List val);

class FamMembers extends StatefulWidget {
  const FamMembers({required this.members, Key? key}) : super(key: key);

  final MembersCallBack members;

  @override
  State<FamMembers> createState() => _FamMembers();
}

class _FamMembers extends State<FamMembers> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            width: size.width * 0.7,
            height: size.height * 0.35,
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(80)),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blue, Colors.white])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WriteAnswer(false, '¿Cuántos integrantes tiene tu familia?',
                    textEditingController,
                    answers: (val) => {}),
              ],
            )),
        SizedBox(
          height: size.height * 0.06,
          width: size.width * 0.35,
          child: ElevatedButton(
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                widget.members(List.generate(
                    int.parse(textEditingController.text) + 1,
                    (index) => String));
              },
              child: const Icon(
                Icons.arrow_forward_rounded,
                size: 30,
              )),
        )
      ],
    );
  }
}
