import 'package:amor_conviccion/Screens/sign_in_screen.dart';
import 'package:amor_conviccion/Screens/user_info_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authentication extends StatelessWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
        if(snapshot.connectionState==ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(),);
        } else if(snapshot.hasData){
          return UserInfoScreen();
        }else if(snapshot.hasError){
          return const Center(child: Text('Something went wrong'),);
        }else{
          return const SignInScreen();
        }
      },
    ),
  );
}