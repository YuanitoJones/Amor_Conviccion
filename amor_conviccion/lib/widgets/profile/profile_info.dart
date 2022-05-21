import 'package:amor_conviccion/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

bool loading = true;

class ProfileInfo extends StatefulWidget{

  bool namefield = true;
  bool emailfield = true;
  bool actionbutton = true;

  ProfileInfo({Key? key, required this.nombre, required this.correo}) : super(key: key);

  final String correo, nombre;

  @override
  State<StatefulWidget> createState() => _Profile_Info();
}

class _Profile_Info extends State<ProfileInfo> {

  TextEditingController txt1Controller = TextEditingController();
  TextEditingController txt2Controller = TextEditingController();

  void editableTextFields(){
    final _auth = FirebaseAuth.instance;
    if(widget.actionbutton){
      setState(() {
        if (_auth.currentUser?.providerData[0].providerId ==
            "google.com") {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('No es posible editar correo'),
            duration: Duration(milliseconds: 2500),));
        }else{
          widget.emailfield = !widget.emailfield;
        }
        widget.namefield = !widget.namefield;
        widget.actionbutton = !widget.actionbutton;
      });
    }else{
      DatabaseService service = DatabaseService(uid: user.uid, email: user.email.toString());
      setState(() {
        loading = !loading;
      });
      service.updateProfile(txt1Controller.text, txt2Controller.text);
      setState(() {
        loading = !loading;
        widget.namefield = !widget.namefield;
        widget.actionbutton = !widget.actionbutton;
        if(widget.emailfield == false){
          widget.emailfield = !widget.emailfield;
        }
      });
    }
  }
  final user = FirebaseAuth.instance.currentUser!;
  late bool edit = true;
    @override
    Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
      return main(size);
    }

    Widget main(Size size) {
      return Container(
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text('Nombre',
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.bold,
                ),),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 3,
                  ),
                ],
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: TextFormField(
                style: const TextStyle(
                    fontFamily: 'Comfortaa'
                ),
                readOnly: widget.namefield,
                controller: txt1Controller..text = widget.nombre,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0,),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 3.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height*0.015,),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text('Correo',
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.bold,
                ),),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 3,
                  ),
                ],
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: TextFormField(
                style: const TextStyle(
                    fontFamily: 'Comfortaa'
                ),
                readOnly: widget.emailfield,
                controller: txt2Controller..text = widget.correo,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0,),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 3.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height*0.06,),
            Container(
              alignment: Alignment.center,
              child: loading? ElevatedButton(
                onPressed: editableTextFields,
                style: ElevatedButton.styleFrom(
                    fixedSize:Size(size.width*0.75, size.height*0.07),
                    primary: (widget.actionbutton)? Colors.red : Colors.amber,
                    textStyle: const TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 15
                    )
                ),
                child: (widget.actionbutton)? const Text('Editar Perfil',
                  style: TextStyle(
                      color: Colors.white
                  ),): const Text('Guardar', style: TextStyle(
                    color: Colors.black
                ),),
              ) : const Center(child: CircularProgressIndicator(),),
            )
          ],
        ),
      );
    }
}