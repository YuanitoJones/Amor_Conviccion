import 'package:amor_conviccion/Screens/homePage.dart';
import 'package:amor_conviccion/Screens/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authentication extends StatelessWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    resizeToAvoidBottomInset: false,
    body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
        if(snapshot.connectionState==ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(),);
        } else if(snapshot.hasData){
          return const HomePage();
        }else if(snapshot.hasError){
          return const Center(child: Text('Something went wrong'),);
        }else{
          return const SignInScreen();
        }
      },
    ),
  );
}