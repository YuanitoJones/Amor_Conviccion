import 'package:amor_conviccion/services/userData.dart';
import 'package:amor_conviccion/widgets/profile/UploadPhoto.dart';
import 'package:amor_conviccion/widgets/profile/avatar.dart';
import 'package:amor_conviccion/widgets/profile/profile_info.dart';
import 'package:amor_conviccion/widgets/profile/user_points.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/googleSignIn.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _UserInfoScreen();
}

class _UserInfoScreen extends State<UserInfoScreen>
    with SingleTickerProviderStateMixin {
  final FirebaseAuth _auth = FirebaseAuth.instance;
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
                    height: size.height * 0.35,
                    decoration: const BoxDecoration(
                        color: Color(0xFF42ADE2),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: size.height * 0.09,
                                ),
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
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    0, 0, size.width * 0.07, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          size.width * 0.05, 0, 0, 0),
                                      child: Text(
                                        'Puntos',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Comfortaa',
                                            fontSize: size.height * 0.028,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
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
                        child: ElevatedButton.icon(
                          onPressed: () {
                            if (_auth.currentUser?.providerData[0].providerId ==
                                "google.com") {
                              final provider =
                                  Provider.of<GoogleSignInProvider>(context,
                                      listen: false);
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
                        ),
                      )
                    ],
                  ),
                ],
              )),
            );
          }
        });
  }
}
