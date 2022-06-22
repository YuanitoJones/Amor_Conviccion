import 'package:amor_conviccion/services/authentication.dart';
import 'package:amor_conviccion/services/userData.dart';
import 'package:amor_conviccion/widgets/infoTextFields/nameTextField.dart';
import 'package:amor_conviccion/widgets/infoTextFields/passTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../widgets/infoTextFields/emailTextField.dart';

class EmailSignIn extends StatefulWidget {
  const EmailSignIn({Key? key}) : super(key: key);

  @override
  _EmailSignIn createState() => _EmailSignIn();
}

class _EmailSignIn extends State<EmailSignIn>
    with SingleTickerProviderStateMixin {
  void initstate() {
    super.initState();
    txt1Controller.addListener((onListen));
  }

  @override
  void dispose() {
    txt1Controller.removeListener((onListen));
    super.dispose();
  }

  void onListen() => setState(() {});

  TextEditingController txt1Controller = TextEditingController();
  TextEditingController txt2Controller = TextEditingController();
  TextEditingController txt3Controller = TextEditingController();

  EmailSignInProvider es = EmailSignInProvider();
  final _formKey = GlobalKey<FormState>();

  registerUser() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    try {
      await es
          .signUp(
              email: txt1Controller.text,
              password: txt2Controller.text,
              name: txt3Controller.text)
          .then((result) {
        if (result == null) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Authentication()));
        } else {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Algo salio mal'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                          'Verifique sus datos e intentelo de nuevo, es posible que ya se encuentre registrado'),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          child: const Text('Aceptar'),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              });
        }
      });
    } catch (e) {
      if (e is FirebaseAuthException) {
        debugPrint(e.message!);
      }
    }
  }

  Widget main(Size size) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 43.0),
        child: Form(
          key: _formKey,
          child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                Image.asset(
                  'assets/logos/logo.png',
                  width: size.width * 0.50,
                ),
                SizedBox(
                  height: size.height * 0.1,
                ),
                SizedBox(
                  width: size.width * 0.72,
                  child: EmailTextField(txt1Controller),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                SizedBox(
                  width: size.width * 0.72,
                  child: PassTextField(txt2Controller),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                SizedBox(
                  width: size.width * 0.72,
                  child: NameTextField(txt3Controller),
                ),
                SizedBox(
                  height: size.height * 0.1,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        registerUser();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Favor de llenar todos los campos')));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(size.width * 0.60, size.height * 0.07),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      primary: const Color(0xFFFF7E27),
                      elevation: 4.0,
                    ),
                    child: Text(
                      'Registrarse',
                      style: TextStyle(
                        fontSize: size.width * 0.05,
                        fontFamily: 'Comfortaa',
                      ),
                    )),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(home: Builder(builder: (context) {
      return main(size);
    }));
  }
}
