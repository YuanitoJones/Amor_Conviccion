import 'package:amor_conviccion/services/userData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


class EmailSignIn extends StatefulWidget {
  const EmailSignIn({Key? key}) : super(key: key);

  @override
  _EmailSignIn createState() => _EmailSignIn();
}


class _EmailSignIn extends State<EmailSignIn> with SingleTickerProviderStateMixin{
  var btnEnabled = true;
  var txt1Filled = false;
  var txt2Filled = false;
  var txt3Filled = false;
  var txt4Filled = false;
  TextEditingController txt1Controller = TextEditingController();
  TextEditingController txt2Controller = TextEditingController();
  TextEditingController txt3Controller = TextEditingController();
  TextEditingController txt4Controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    txt1Controller.dispose();
    txt2Controller.dispose();
    super.dispose();
  }

  Color txt1Color() {
    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(txt1Controller.text);
    if (txt1Controller.text.isEmpty) {
      txt1Filled = false;
      return Colors.red;
    } else {
      enableButton();
      txt1Filled = true;
      if (emailValid == true) {
        enableButton();
        return Colors.green;
      } else {
        enableButton();
        txt1Filled=false;
        return Colors.red;
      }
    }
  }

  Color txt2Color() {
    Color color;
    if (txt2Controller.text.isEmpty) {
      txt2Filled = false;
      color = Colors.red;
    } else {
      txt2Filled = true;
      if ((txt2Controller.text != txt3Controller.text)) {
        txt2Filled=false;
        color = Colors.red;
      } else {
        color = Colors.green;
      }
    }
    enableButton();
    return color;
  }
  Color txt4Color() {
    if (txt4Controller.text.isNotEmpty && txt4Controller.text.length > 3){
      return Colors.green;
    }else{
      return Colors.red;
    }
  }

  void enableButton(){
    btnEnabled = true;
  }

  Widget main(Size size) {
    txt1Controller.addListener(() {
      txt1Color();
      setState(() {});
    });
    txt2Controller.addListener(() {
      txt2Color();
      setState(() {});
    });
    txt4Controller.addListener(() {
      txt4Color();
      setState(() {});
    });
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 43.0),
        child: Form(
          key: _formKey,
          child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.4,
                    ),
                    SizedBox(
                      width: size.width*0.72,
                      child:  Material(
                        type: MaterialType.transparency,
                        child: TextField(
                            maxLength: 20,
                            controller: txt1Controller,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              counterText: "",
                              focusedBorder: OutlineInputBorder(
                                borderSide: txt1Filled
                                    ? BorderSide(
                                    color: txt2Color(), width: size.width * 0.0110)
                                    : BorderSide.none,
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: txt1Filled
                                    ? BorderSide(
                                    color: txt2Color(), width: size.width * 0.0110)
                                    : BorderSide.none,
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              filled: true,
                              fillColor: const Color.fromRGBO(242, 242, 242, 1),
                              hintText: (/*AppLocalizations.of(context)!.lastName).toString()*/'Email'),
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
                        child: TextField(
                            maxLength: 20,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
                            ],
                            controller: txt2Controller,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              counterText: "",
                              focusedBorder: OutlineInputBorder(
                                borderSide: txt2Filled
                                    ? BorderSide(
                                    color: txt2Color(), width: size.width * 0.0110)
                                    : BorderSide.none,
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: txt2Filled
                                    ? BorderSide(
                                    color: txt2Color(), width: size.width * 0.0110)
                                    : BorderSide.none,
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              filled: true,
                              fillColor: const Color.fromRGBO(242, 242, 242, 1),
                              hintText: (/*AppLocalizations.of(context)!.lastName).toString()*/'Password'),
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
                        child: TextField(
                            maxLength: 20,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
                            ],
                            controller: txt3Controller,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              counterText: "",
                              focusedBorder: OutlineInputBorder(
                                borderSide: txt3Filled
                                    ? BorderSide(
                                    color: txt2Color(), width: size.width * 0.0110)
                                    : BorderSide.none,
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: txt3Filled
                                    ? BorderSide(
                                    color: txt2Color(), width: size.width * 0.0110)
                                    : BorderSide.none,
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              filled: true,
                              fillColor: const Color.fromRGBO(242, 242, 242, 1),
                              hintText: (/*AppLocalizations.of(context)!.lastName).toString()*/'Confirm Email'),
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
                        child: TextField(
                            maxLength: 20,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
                            ],
                            controller: txt4Controller,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              counterText: "",
                              focusedBorder: OutlineInputBorder(
                                borderSide: txt4Filled
                                    ? BorderSide(
                                    color: txt2Color(), width: size.width * 0.0110)
                                    : BorderSide.none,
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: txt4Filled
                                    ? BorderSide(
                                    color: txt2Color(), width: size.width * 0.0110)
                                    : BorderSide.none,
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              filled: true,
                              fillColor: const Color.fromRGBO(242, 242, 242, 1),
                              hintText: (/*AppLocalizations.of(context)!.lastName).toString()*/'Name'),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    SizedBox(
                      height: size.height * 0.08,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (btnEnabled) {
                          EmailSignInProvider signin = EmailSignInProvider();
                          signin.signUp(email: txt1Controller.text, password: txt2Controller.text, name: txt4Controller.text);
                        }
                      },
                      child: const Text(/*AppLocalizations.of(context)!.nextStep*/'Sign up'),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(size.width * 0.50, size.height * 0.07),
                          primary: btnEnabled ? const Color(0xf036A138) : Colors.grey,
                          elevation: 4.0,
                          textStyle: TextStyle(
                            fontSize: size.width * 0.058,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.bold,
                          )),
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
        }));
  }
}