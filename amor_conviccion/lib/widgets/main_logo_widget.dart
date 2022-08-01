import 'package:flutter/material.dart';

class MainLogoWidget extends StatelessWidget {
  const MainLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.35,
      height: size.height * 0.25,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: ClipOval(
            child: Image.asset(
          'assets/logos/pentagono.png',
          fit: BoxFit.fill,
        )),
      ),
    );
  }
}
