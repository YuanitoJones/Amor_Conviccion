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

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: YoutubePlayerBuilder(
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
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            size.width * 0.25, 0, size.width * 0.25, 0),
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const <Widget>[
                                Text('Terminar'),
                                Icon(Icons.arrow_forward_rounded)
                              ]),
                        ),
                      ),
                    )
                  ],
                );
              }
            });
          }),
    );
  }
}
