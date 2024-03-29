import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YtPlayer extends StatefulWidget {
  const YtPlayer({Key? key}) : super(key: key);
  @override
  State<YtPlayer> createState() => _YtPlayer();
}

class _YtPlayer extends State<YtPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    const video = 'https://youtu.be/7eO_23yq3pI';
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(video)!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        loop: false,
        isLive: false,
        forceHD: false,
      ),
    );
  }

@override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/background/standard.png'),
                      fit: BoxFit.cover)),
        child: YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: _controller,
            ),
            builder: (context, player) {
              return OrientationBuilder(builder: (context, orientation) {
                if (orientation == Orientation.landscape) {
                  return player;
                } else {
                  return Column(
                    children: [
                      player,
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      SizedBox(
                        height: size.height * 0.065,
                        width: size.width * 0.5,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            'Siguiente',
                            style: TextStyle(fontSize: size.width * 0.05),
                          ),
                        ),
                      )
                    ],
                  );
                }
              });
            }),
      ),
    );
  }
}
