import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NameTextField extends StatefulWidget {
  const NameTextField(this.txtcontroller, {Key? key}) : super(key: key);

  final TextEditingController txtcontroller;

  @override
  _NametextField createState() => _NametextField();
}

class _NametextField extends State<NameTextField> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      type: MaterialType.transparency,
      child: TextFormField(
          maxLength: 50,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => value != null && value.length < 3
              ? 'Nombre de minimo 3 caracteres'
              : null,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
          ],
          controller: widget.txtcontroller,
          style: TextStyle(fontSize: size.width * 0.045),
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            counterText: "",
            filled: true,
            fillColor: const Color.fromRGBO(242, 242, 242, 1),
            hintText:
                (/*AppLocalizations.of(context)!.lastName).toString()*/ 'Nombre'),
          )),
    );
  }
}
