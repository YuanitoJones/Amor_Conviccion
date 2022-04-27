import 'package:amor_conviccion/Screens/email_login_screen.dart';
import 'package:amor_conviccion/services/googleSignIn.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'emailSignInScreen.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);


  @override
  _SignInScreenState createState() => _SignInScreenState();
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
              ElevatedButton.icon(
                onPressed: (){
                  final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();
                },
                icon: const FaIcon(FontAwesomeIcons.google, color: Colors.white,),
                label: const Text('Login con Google'),
                style: ElevatedButton.styleFrom(
                    elevation: 4.0,
                    fixedSize: Size(size.width * 0.70, size.height * 0.068),
                    primary: Colors.red,
                    textStyle: TextStyle(
                      fontSize: size.width * 0.058,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SizedBox(height: size.height*0.06,),
              ElevatedButton(
                child: const Center(
                  child: Text('Login Con correo',
                    style: TextStyle(
                      color: Colors.black
                    ),
                  ),
                ),

                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>const EmailLogin())
                  );
                },
                style: ElevatedButton.styleFrom(
                    elevation: 4.0,
                    fixedSize: Size(size.width * 0.70, size.height * 0.068),
                    primary: Colors.yellow,
                    textStyle: TextStyle(
                      fontSize: size.width * 0.058,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SizedBox(height: size.height*0.015,),
              const Text('O',
                style: TextStyle(
                    color: Colors.black
                ),
              ),
              SizedBox(height: size.height*0.015,),
              ElevatedButton(
                child: const Center(
                  child: Text('Registrate con correo',
                    style: TextStyle(
                        color: Colors.black),
                  ),
                ),
                onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const EmailSignIn()));
                },
                style: ElevatedButton.styleFrom(
                    elevation: 4.0,
                    fixedSize: Size(size.width * 0.70, size.height * 0.068),
                    primary: Colors.yellow,
                    textStyle: TextStyle(
                      fontSize: size.width * 0.058,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}