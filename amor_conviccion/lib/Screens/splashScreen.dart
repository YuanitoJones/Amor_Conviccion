import 'dart:async';
import 'package:amor_conviccion/services/authentication.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    valoresIniciales();
  }

  void valoresIniciales() async {

      Timer(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Authentication()));
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        Size size = MediaQuery.of(context).size;
        return Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/background/splash.png'),
                  fit: BoxFit.cover)),
        );
      }),
    );
  }
}

