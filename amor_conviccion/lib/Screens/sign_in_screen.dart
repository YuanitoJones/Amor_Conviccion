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
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Image.asset(
                        'assets/logos/firebase_logo.png',
                        height: 160,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'FlutterFire',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 40,
                      ),
                    ),
                    const Text(
                      'Authentication',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton.icon(
<<<<<<< HEAD
                onPressed: (){
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => const EmailSignIn()));
                },
                icon: const FaIcon(FontAwesomeIcons.store, color: Colors.red,),
                label: const Text('Log in with Email'),
              ),
              ElevatedButton.icon(
=======
>>>>>>> parent of 7802e83 (Email Firebase)
                  onPressed: (){
                    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                    provider.googleLogin();
                  },
                  icon: const FaIcon(FontAwesomeIcons.google, color: Colors.red,),
                  label: const Text('Log in with Google'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}