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
              liveUIColor: Colors.amber,
            ),
            builder: (context, player) => player));
  }
}
