import 'package:amor_conviccion/Screens/HomePage/leaderboard_screen.dart';
import 'package:amor_conviccion/Screens/HomePage/lessons_main_screen.dart';
import 'package:amor_conviccion/Screens/HomePage/new_entry_screen.dart';
import 'package:amor_conviccion/Screens/HomePage/user_info_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    MainLessons(),
    LeaderBoard(),
    const UserInfoScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget main(size) {
    return DoubleBackToCloseApp(
        snackBar: const SnackBar(content: Text('Presione otra vez para salir')),
        child: Scaffold(
          body: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/background/standard.png'),
                      fit: BoxFit.cover)),
              child: _widgetOptions.elementAt(_selectedIndex)),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 2,
                )
              ],
            ),
            child: BottomNavigationBar(
              elevation: 10,
              type: BottomNavigationBarType.shifting,
              selectedFontSize: size.width * 0.05,
              selectedIconTheme: IconThemeData(color: Colors.yellow[800]),
              unselectedIconTheme: const IconThemeData(color: Colors.grey),
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.yellow[800],
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Lecciones',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.flag_rounded),
                  label: 'Marcador',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  label: 'Perfil',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var _user = FirebaseAuth.instance.currentUser;
    return MaterialApp(
        home: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('puntuacion')
                .where('correo', isEqualTo: _user!.email)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('Algo salió mal');
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var documents = (snapshot.data!).docs;
                if (documents[0].get('nuevo') == true) {
                  return const NewEntry();
                }
                return main(size);
              }
            }));
  }
}
