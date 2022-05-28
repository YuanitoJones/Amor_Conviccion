import 'package:amor_conviccion/services/authentication.dart';
import 'package:amor_conviccion/services/userData.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmailSignIn extends StatefulWidget {
  const EmailSignIn({Key? key}) : super(key: key);

  @override
  _EmailSignIn createState() => _EmailSignIn();
}

class _EmailSignIn extends State<EmailSignIn>
    with SingleTickerProviderStateMixin {
  @override
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

  late bool flag = true;
  var btnEnabled = true;
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
                  child: Material(
                    type: MaterialType.transparency,
                    child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? 'Ingresa un correo válido'
                                : null,
                        maxLength: 50,
                        controller: txt1Controller,
                        style: TextStyle(
                          fontFamily: 'Comfortaa',
                          fontSize: size.width * 0.045,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: txt1Controller.text.isEmpty
                              ? Container(
                                  width: 0,
                                )
                              : IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () {
                                    txt1Controller.clear();
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  }),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                          counterText: "",
                          filled: true,
                          fillColor: const Color.fromRGBO(242, 242, 242, 1),
                          hintText:
                              (/*AppLocalizations.of(context)!.lastName).toString()*/ 'Correo'),
                        )),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                SizedBox(
                  width: size.width * 0.72,
                  child: Material(
                      type: MaterialType.transparency,
                      child: Stack(
                        children: [
                          TextFormField(
                              obscureText: flag,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) =>
                                  value != null && value.length < 6
                                      ? 'Debe contener al menos 6 caracteres'
                                      : null,
                              maxLength: 20,
                              controller: txt2Controller,
                              style: TextStyle(
                                  fontSize: size.width * 0.045,
                                  fontFamily: 'Comfortaa'),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                counterText: "",
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(242, 242, 242, 1),
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
                                primary: const Color.fromRGBO(242, 242, 242, 1),
                              ),
                              child: const Icon(Icons.remove_red_eye_outlined,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                SizedBox(
                  width: size.width * 0.72,
                  child: Material(
                    type: MaterialType.transparency,
                    child: TextFormField(
                        maxLength: 50,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => value != null && value.length < 3
                            ? 'Nombre de minimo 3 caracteres'
                            : null,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp("[a-zA-Z ]")),
                        ],
                        controller: txt3Controller,
                        style: TextStyle(
                            fontSize: size.width * 0.045,
                            fontFamily: 'Comfortaa'),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                          counterText: "",
                          filled: true,
                          fillColor: const Color.fromRGBO(242, 242, 242, 1),
                          hintText:
                              (/*AppLocalizations.of(context)!.lastName).toString()*/ 'Nombre'),
                        )),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.1,
                ),
                ElevatedButton(
                    onPressed: () {
                      registerUser();
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(size.width * 0.60, size.height * 0.07),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      primary: const Color(0xFFFF7E27),
                      elevation: 4.0,
                    ),
                    child: Text(
                      /*AppLocalizations.of(context)!.nextStep*/ 'Registrarse',
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
    return MaterialApp(
        /*debugShowCheckedModeBanner: false,

        //Configuracion idiomas
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        //Idiomas soportados
        supportedLocales: const [
          Locale('en', ''), // English, no country code
          Locale('es', ''), // Spanish, no country code
        ],*/
        home: Builder(builder: (context) {
      return main(size);
    }));
  }
}
