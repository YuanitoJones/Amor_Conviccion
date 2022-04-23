import 'dart:async';
import 'package:amor_conviccion/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    return MaterialApp(
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
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        Size size = MediaQuery.of(context).size;
        return Container(
          height: size.height,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/logos/advertencia.png'),
                  fit: BoxFit.cover)),
        );
      }),
    );
  }
}

