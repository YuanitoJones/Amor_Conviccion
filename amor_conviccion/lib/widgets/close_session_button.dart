import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/googleSignIn.dart';
import '../services/userData.dart';

class CloseSessionButton extends StatelessWidget {
  const CloseSessionButton(this.user, {Key? key}) : super(key: key);

  final user;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        if (user.providerData[0].providerId == "google.com") {
          final provider =
              Provider.of<GoogleSignInProvider>(context, listen: false);
          provider.signOutFromGoogle();
        } else {
          EmailSignInProvider email = EmailSignInProvider();
          email.signOut();
        }
      },
      icon: const Icon(Icons.logout),
      label: const Text(
        'Cerrar sesion',
        style: TextStyle(fontFamily: 'Comfortaa'),
      ),
    );
  }
}
