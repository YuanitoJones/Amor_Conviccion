import 'package:amor_conviccion/Screens/HomePage/author_page.dart';
import 'package:amor_conviccion/widgets/close_session_button.dart';
import 'package:amor_conviccion/widgets/profile/UploadPhoto.dart';
import 'package:amor_conviccion/widgets/profile/avatar.dart';
import 'package:amor_conviccion/widgets/profile/profile_info.dart';
import 'package:amor_conviccion/widgets/profile/user_points.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _UserInfoScreen();
}

class _UserInfoScreen extends State<UserInfoScreen>
    with SingleTickerProviderStateMixin {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('puntuacion')
            .where('correo', isEqualTo: user.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                  'Oops, parece que hubo un error, intentelo de nuevo mas tarde'),
            );
          } else {
            var documents = (snapshot.data!).docs;
            return Scaffold(
              body: SingleChildScrollView(
                  child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: size.height * 0.32,
                    decoration: const BoxDecoration(
                        color: Color(0xFF42ADE2),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  SafeArea(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: const Icon(Icons.info),
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AuthorPage())),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                      width: size.width * 0.45,
                                      height: size.height * 0.16,
                                      child: Avatar(
                                          photourl: documents[0].get('imagen'))),
                                  const Upload(),
                                ],
                              ),
                              SizedBox(
                                width: size.width * 0.4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Puntos',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: size.height * 0.028,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                            width: size.width * 0.15,
                                            child: UserPoints(
                                                points: documents[0]
                                                    .get('puntos'))),
                                        SizedBox(
                                          width: size.width * 0.065,
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/Icons/noto_heartsuit.png'),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.035,
                        ),
                        ProfileInfo(
                            nombre: documents[0].get('nombre'),
                            correo: documents[0].get('correo')),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Container(
                          color: const Color(0xFF42ADE2),
                          width: size.width * 0.5,
                          height: size.height * 0.06,
                          child: CloseSessionButton(user),
                        )
                      ],
                    ),
                  ),
                ],
              )),
            );
          }
        });
  }
}
