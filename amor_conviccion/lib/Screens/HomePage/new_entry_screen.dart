import 'package:amor_conviccion/services/authentication.dart';
import 'package:amor_conviccion/services/database.dart';
import 'package:amor_conviccion/widgets/video/chewie_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class NewEntry extends StatefulWidget {
  const NewEntry({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewEntry();
}

class _NewEntry extends State<NewEntry> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
        "https://firebasestorage.googleapis.com/v0/b/amor-y-conviccion.appspot.com/o/videos%2Fpresentacion.mp4?alt=media&token=245cd1ce-e40e-4ce1-b4a6-2f519db3220a")
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((value) => _videoPlayerController.play());
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var chewie = ChewieWidget(_videoPlayerController);
    return Scaffold(
      body: Container(
         decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background/standard.png'),
                fit: BoxFit.cover)),
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(size.width * 0.07),
              child: Text(
                "Bienvenido al programa Pentágono!",
                style: TextStyle(fontSize: size.width * 0.05),
              ),
            ),
            SizedBox(
              height: size.height * 0.75,
              child: chewie,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: () {
                    DatabaseService service = DatabaseService(
                        uid: user.uid, email: user.email.toString());
                    service.updateNew();
                  },
                  child: Text(
                    "Continuar",
                    style: TextStyle(fontSize: size.width * 0.05),
                  )),
            )
          ],
        )),
      ),
    );
  }
}
