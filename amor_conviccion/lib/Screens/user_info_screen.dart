/*import 'package:amor_conviccion/Screens/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/authentication.dart';

class UserInfoScreen extends StatefulWidget {
  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  late User _user;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const SignInScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 20.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(),
            _user.photoURL != null
                ? ClipOval(
              child: Material(
                color: Colors.grey.withOpacity(0.3),
                child: Image.network(
                  _user.photoURL!,
                  fit: BoxFit.fitHeight,
                ),
              ),
            )
                : ClipOval(
              child: Material(
                color: Colors.grey.withOpacity(0.3),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Hello',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 26,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              _user.displayName!,
              style: const TextStyle(
                color: Colors.yellow,
                fontSize: 26,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              '( ${_user.email!} )',
              style: const TextStyle(
                color: Colors.orange,
                fontSize: 20,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 24.0),
            Text(
              'You are now signed in using your Google account. To sign out of your account, click the "Sign Out" button below.',
              style: TextStyle(
                  color: Colors.grey.withOpacity(0.8),
                  fontSize: 14,
                  letterSpacing: 0.2),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.redAccent,
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () async {
                    },
              child: const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(
                  'Sign Out',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/

import 'package:amor_conviccion/services/googleSignIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserInfoScreen extends StatelessWidget{
  const UserInfoScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logged in'),
        centerTitle: true,
        actions: [
          TextButton(child: const Text('Logout'),
          onPressed: (){
            final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.signOutFromGoogle();
          },
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.blueGrey.shade900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  <Widget>[
            const Text('Profile',
            style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 32,),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            const SizedBox(height: 8,),
            Text('Name: ' + user.displayName!,
            style: const TextStyle(color: Colors.white, fontSize: 16),),
            const SizedBox(height: 8,),
            Text('Name: ' + user.email!,
              style: const TextStyle(color: Colors.white, fontSize: 16),)
          ],
        ),
      ),
    );
  }
  
}