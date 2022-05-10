import 'package:amor_conviccion/services/userData.dart';
import 'package:amor_conviccion/widgets/profile/UploadPhoto.dart';
import 'package:amor_conviccion/widgets/profile/avatar.dart';
import 'package:amor_conviccion/widgets/profile/profile_info.dart';
import 'package:amor_conviccion/widgets/profile/user_points.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/googleSignIn.dart';

class UserInfoScreen extends StatefulWidget{
  const UserInfoScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _UserInfoScreen();
}

class _UserInfoScreen extends State<UserInfoScreen> with SingleTickerProviderStateMixin{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context)  {
    WidgetsFlutterBinding.ensureInitialized();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: <Widget>[
                            SizedBox(height: size.height*0.08,),
                            SizedBox(
                                width: size.width * 0.6,
                                height: size.height * 0.23,
                                child: Avatar()
                            ),
                            const Upload(),
                          ],
                        ),
                        Container(
                          width: size.width * 0.4,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, size.width*0.07, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(size.width*0.04, 0, 0, 0),
                                  child: Text(
                                    'Puntos',
                                    style: TextStyle(
                                        fontSize: size.height * 0.035,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    SizedBox(
                                        width: size.width*0.15,
                                        child: UserPoints()
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                                      child: SizedBox(
                                        width: size.width*0.07,
                                        child: const Image(image: AssetImage('assets/Icons/noto_heartsuit.png'),),
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
                  ProfileInfo(),
                  SizedBox(height: size.height*0.02,),
                  ElevatedButton(
                      onPressed: (){
                        if (_auth.currentUser?.providerData[0].providerId ==
                            "google.com") {
                          final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                          provider.signOutFromGoogle();
                        }else{
                          EmailSignInProvider _email = EmailSignInProvider();
                          _email.signOut();
                        }
                      },
                      child: const Text('logout'))
                ],
              ),
            ],
          )
        ),
    );
  }
}