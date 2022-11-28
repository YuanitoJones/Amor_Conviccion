import 'package:amor_conviccion/services/authentication.dart';
import 'package:amor_conviccion/services/userData.dart';
import 'package:amor_conviccion/widgets/infoTextFields/emailTextField.dart';
import 'package:amor_conviccion/widgets/infoTextFields/passTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class EmailLogin extends StatefulWidget {
  const EmailLogin({Key? key}) : super(key: key);

  @override
  State<EmailLogin> createState() => _EmailLogin();
}

class _EmailLogin extends State<EmailLogin>
    with SingleTickerProviderStateMixin {
  List<TextEditingController> txtcontroller =
      List.generate(2, (index) => TextEditingController());

  EmailSignInProvider es = EmailSignInProvider();
  final _formKey = GlobalKey<FormState>();

  login() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    try {
      await es
          .signIn(email: txtcontroller[0].text, password: txtcontroller[1].text)
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
                  title: const Text('Algo salió mal'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Correo y/o contraseña incorrectos'),
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
                for (int i = 0; i < txtcontroller.length; i++)
                  Column(
                    children: [
                      SizedBox(
                        width: size.width * 0.72,
                        child: (i == 0)
                            ? EmailTextField(txtcontroller[i])
                            : PassTextField(txtcontroller[i]),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                    ],
                  ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        login();
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
                      backgroundColor: const Color(0xFFFF7E27),
                      elevation: 4.0,
                    ),
                    child: Text(
                      'Iniciar sesión',
                      style: TextStyle(
                        fontSize: size.width * 0.058,
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
