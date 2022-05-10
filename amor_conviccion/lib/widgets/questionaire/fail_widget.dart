import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FailScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('No lograste alcanzar la competencia \n estudia un poco mas y vuelve a intentarlo \n TU PUEDES'),
      ),
    );
  }
}