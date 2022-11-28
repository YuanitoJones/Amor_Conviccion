import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField(this.txtcontroller, {Key? key}) : super(key: key);

  final TextEditingController txtcontroller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      type: MaterialType.transparency,
      child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (email) => email != null && !EmailValidator.validate(email)
              ? 'Ingresa un correo válido'
              : null,
          maxLength: 50,
          controller: txtcontroller,
          style: TextStyle(
            fontSize: size.width * 0.045,
          ),
          decoration: InputDecoration(
            suffixIcon: txtcontroller.text.isEmpty
                ? Container(
                    width: 0,
                  )
                : IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      txtcontroller.clear();
                      FocusManager.instance.primaryFocus?.unfocus();
                    }),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            counterText: "",
            filled: true,
            fillColor: const Color.fromRGBO(242, 242, 242, 1),
            hintText:
                (/*AppLocalizations.of(context)!.lastName).toString()*/ 'Correo'),
          )),
    );
  }
}
