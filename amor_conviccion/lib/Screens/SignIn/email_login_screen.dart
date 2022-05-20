import 'package:amor_conviccion/services/authentication.dart';
import 'package:amor_conviccion/services/userData.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../HomePage/homePage.dart';


class EmailLogin extends StatefulWidget{
  const EmailLogin({Key? key}) : super(key: key);

  @override
  _EmailLogin createState() => _EmailLogin();
}


class _EmailLogin extends State<EmailLogin> with SingleTickerProviderStateMixin{
  var btnEnabled = true;
  TextEditingController txt1Controller = TextEditingController();
  TextEditingController txt2Controller = TextEditingController();

  EmailSignInProvider es = EmailSignInProvider();
  final _formKey = GlobalKey<FormState>();


  login() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    try {
      await es.signIn(email: txt1Controller.text, password: txt2Controller.text)
      .then((result){
        if (result==null){
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const Authentication()));
        }else{
          showDialog(
              barrierDismissible: false,
              context: context, builder: (context){
            return AlertDialog(
              title: Text('Algo salio mal'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('Correo y/o contraseña incorrectos'),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      child: Text('Aceptar'),
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
              child: Column(
                  children: <Widget>[
                    Image.asset('assets/logos/logo.png',
                      width: size.width * 0.50,
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    SizedBox(
                      width: size.width*0.72,
                      child:  Material(
                        type: MaterialType.transparency,
                        child: TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? 'Ingresa un correo válido' : null,
                            maxLength: 50,
                            controller: txt1Controller,
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'Comfortaa'
                            ),
                            decoration: const InputDecoration(
                              counterText: "",
                              filled: true,
                              fillColor: Color.fromRGBO(242, 242, 242, 1),
                              hintText: (/*AppLocalizations.of(context)!.lastName).toString()*/'Correo'),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    SizedBox(
                      width: size.width*0.72,
                      child:  Material(
                        type: MaterialType.transparency,
                        child: TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) =>
                            value != null && value.length < 6
                                ? 'Contraseña debe contener al menos 6 caracteres' : null,
                            maxLength: 20,
                            controller: txt2Controller,
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'Comfortaa'
                            ),
                            decoration: const InputDecoration(
                              counterText: "",
                              filled: true,
                              fillColor: Color.fromRGBO(242, 242, 242, 1),
                              hintText: (/*AppLocalizations.of(context)!.lastName).toString()*/'Contraseña'),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        login();
                      },
                      child: Text(/*AppLocalizations.of(context)!.nextStep*/'Iniciar sesión',
                        style: TextStyle(
                          fontSize: size.width * 0.058,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(size.width * 0.50, size.height * 0.07),
                          primary: Colors.yellow,
                          elevation: 4.0,
                      )
                    ),
                  ]
              ),
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
        debugShowCheckedModeBanner: false,

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
        ],
        home: Builder(builder: (context) {
          return main(size);
        }
        )
    );
  }
}