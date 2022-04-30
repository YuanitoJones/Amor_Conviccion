import 'package:amor_conviccion/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

bool loading = true;

class ProfileInfo extends StatefulWidget{

  bool namefield = true;
  bool emailfield = true;
  bool actionbutton = true;

  @override
  State<StatefulWidget> createState() => _Profile_Info();
}

class _Profile_Info extends State<ProfileInfo> {

  TextEditingController txt1Controller = TextEditingController();
  TextEditingController txt2Controller = TextEditingController();

  void editableTextFields(){
    if(widget.actionbutton){
      setState(() {
        widget.namefield = !widget.namefield;
        widget.emailfield = !widget.emailfield;
        widget.actionbutton = !widget.actionbutton;
      });
    }else{
      DatabaseService service = DatabaseService(uid: user.uid);
      setState(() {
        loading = !loading;
      });
      service.updateProfile(txt1Controller.text, txt2Controller.text);
      setState(() {
        loading = !loading;
      });
    }
  }
  final user = FirebaseAuth.instance.currentUser!;
    @override
    Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
      return main(size);
    }

    Widget main(Size size) {
      return StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('puntuacion')
              .where('correo', isEqualTo: user.email)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(),);
            }
            else if (snapshot.hasError) {
              return const Text('Algo salio mal');
            }
            else {
              var documents = (snapshot.data!).docs;
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: const Text('Nombre',
                            style: TextStyle(
                              fontSize: 20,
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
                              readOnly: widget.namefield,
                              controller: txt1Controller..text = documents[index].get('nombre'),
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
                                fontSize: 20,
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
                              readOnly: widget.namefield,
                              controller: txt2Controller..text = documents[0].get('correo'),
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
                          SizedBox(height: size.height*0.06,),
                          Container(
                            child: loading? ElevatedButton(
                              onPressed: editableTextFields,
                              child: (widget.actionbutton)? const Text('Editar Perfil'): const Text('Guardar'),
                              style: ElevatedButton.styleFrom(
                                  fixedSize:Size(size.width*0.75, size.height*0.07),
                                  primary: Colors.red,
                                  textStyle:const TextStyle(
                                      fontSize: 15
                                  )
                              ),
                            ) : const Center(child: CircularProgressIndicator(),),
                          )
                        ],
                      ),
                    );
                  });
            }
          });
    }
}