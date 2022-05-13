import 'package:amor_conviccion/Screens/SignIn/email_login_screen.dart';
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
              ElevatedButton(
                onPressed: (){
                  final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    FaIcon(FontAwesomeIcons.google, color: Colors.white,),
                    Text('Login con Google',style: TextStyle(
                      fontFamily: 'Comfortaa'
                    ),),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 4.0,
                    fixedSize: Size(size.width * 0.80, size.height * 0.090),
                    primary: Colors.red,
                    textStyle: TextStyle(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SizedBox(height: size.height*0.06,),
              ElevatedButton(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      FaIcon(FontAwesomeIcons.envelope, color: Colors.white,),
                      Text('Login con correo',
                        style: TextStyle(
                            fontFamily: 'Comfortaa',
                            color: Colors.black
                        ),
                      ),
                    ],
                  )
                ),

                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>const EmailLogin())
                  );
                },
                style: ElevatedButton.styleFrom(
                    elevation: 4.0,
                    fixedSize: Size(size.width * 0.80, size.height * 0.085),
                    primary: Colors.yellow,
                    textStyle: TextStyle(
                      fontSize: size.width * 0.05,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SizedBox(height: size.height*0.03,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('No tienes una cuenta?',style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Comfortaa'
                  ),),
                  TextButton(
                    child: const Center(
                      child: Text('Registrate aqui!', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Comfortaa'
                      ),
                      ),
                    ),
                    onPressed: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => const EmailSignIn()));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}