import 'package:flutter/material.dart';

import '../../services/authentication.dart';

class FailScreen extends StatelessWidget {
  const FailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Authentication()));
            },
            child: Container(
              width: size.width,
              height: size.height,
              color: const Color(0xFFFFFFFF),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    '¡Hey, mejor suerte la próxima vez!',
                    style: TextStyle(
                        fontFamily: 'Comfortaa', fontSize: size.width * 0.08),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'No has acertdo lo suficiente para continuar :(',
                  style: TextStyle(
                      fontFamily: 'Comfortaa', fontSize: size.width * 0.053),
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Center(
                child: Container(
                  width: size.width * 0.22,
                  child: Image.asset('assets/Icons/noto_heartsuit.png'),
                ),
              ),
              SizedBox(
                height: size.height * 0.15,
              ),
              Text(
                'Toca para continuar',
                style: TextStyle(
                    fontFamily: 'Comfortaa', fontSize: size.width * 0.075),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
