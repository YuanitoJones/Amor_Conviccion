import 'package:flutter/material.dart';

class PassTextField extends StatefulWidget {
  const PassTextField(this.txtcontroller, {Key? key}) : super(key: key);

  final TextEditingController txtcontroller;

  @override
  State<PassTextField> createState() => _PassTextField();
}

class _PassTextField extends State<PassTextField> {
  late bool flag = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
        type: MaterialType.transparency,
        child: Stack(
          children: [
            TextFormField(
                obscureText: flag,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value != null && value.length < 6
                    ? 'Debe contener al menos 6 caracteres'
                    : null,
                maxLength: 20,
                controller: widget.txtcontroller,
                style: TextStyle(
                    fontSize: size.width * 0.045, fontFamily: 'Comfortaa'),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                  counterText: "",
                  filled: true,
                  fillColor: const Color.fromRGBO(242, 242, 242, 1),
                  hintText:
                      (/*AppLocalizations.of(context)!.lastName).toString()*/ 'Contraseña'),
                )),
            Positioned(
              right: 10,
              top: 6,
              child: ElevatedButton(
                onPressed: () {
                  flag = !flag;
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
                ),
                child: const Icon(Icons.remove_red_eye_outlined,
                    color: Colors.black),
              ),
            ),
          ],
        ));
  }
}
