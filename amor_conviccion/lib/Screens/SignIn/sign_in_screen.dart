import 'package:amor_conviccion/Screens/SignIn/email_login_screen.dart';
import 'package:amor_conviccion/Screens/privacy_politics.dart';
import 'package:amor_conviccion/services/googleSignIn.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'emailSignInScreen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 40.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Image.asset(
                        'assets/logos/logo.png',
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    shadowColor: Colors.black,
                    elevation: 10.0,
                    fixedSize: Size(size.width * 0.80, size.height * 0.090),
                    backgroundColor: Colors.red,
                    textStyle: TextStyle(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold,
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.white,
                    ),
                    Text(
                      'Login con Google',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EmailLogin()));
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    shadowColor: Colors.black,
                    elevation: 10.0,
                    fixedSize: Size(size.width * 0.80, size.height * 0.085),
                    backgroundColor: const Color(0xFFFF7E27),
                    textStyle: TextStyle(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold,
                    )),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.envelope,
                      color: Colors.white,
                    ),
                    Text(
                      'Login con correo',
                    ),
                  ],
                )),
              ),
              SizedBox(
                height: size.height * 0.015,
              ),
              const Divider(
                thickness: 1,
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No tienes una cuenta?',
                    style: TextStyle(
                        color: Colors.black, fontSize: size.width * 0.04),
                  ),
                  TextButton(
                    child: Center(
                      child: Text(
                        'Registrate aqui!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.04),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EmailSignIn()));
                    },
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.03),
                child: Text(
                  'Al crear una cuenta, estas aceptando nuestro',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black, fontSize: size.width * 0.035),
                ),
              ),
              TextButton(
                child: Center(
                  child: Text(
                    'Aviso de privacidad',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.035),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PrivacyPolitics()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
