import 'package:amor_conviccion/services/userData.dart';
import 'package:amor_conviccion/widgets/UploadPhoto.dart';
import 'package:amor_conviccion/widgets/avatar.dart';
import 'package:amor_conviccion/widgets/profile_info.dart';
import 'package:amor_conviccion/widgets/user_points.dart';
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
                      children: [
                        Column(
                          children: <Widget>[
                            SizedBox(height: size.height*0.08,),
                            Container(
                                width: size.width * 0.6,
                                height: size.height * 0.2,
                                child: Avatar()
                            ),
                            Upload(),
                          ],
                        ),
                        Container(
                          width: size.width * 0.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, size.height*0.03, 0, 0),
                                child: Text(
                                  'Puntos',
                                  style: TextStyle(
                                      fontSize: size.height * 0.035,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                      width: size.width*0.2,
                                      child: UserPoints()
                                  ),
                                  SizedBox(
                                    width: size.width*0.06,
                                    child: Image(image: AssetImage('assets/Icons/noto_heartsuit.png'),),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: ProfileInfo(),
                  ),
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
                      child: Text('logout'))
                ],
              ),
            ],
          )
        ),
    );
  }
}