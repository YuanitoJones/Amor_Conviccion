import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YtPlayer extends StatefulWidget {
  const YtPlayer(this._controller, {Key? key}) : super(key: key);

  final YoutubePlayerController _controller;
  @override
  State<YtPlayer> createState() => _YtPlayer();
}

class _YtPlayer extends State<YtPlayer> {
  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: widget._controller,
          liveUIColor: Colors.amber,
        ),
        builder: (context, player) => player);
  }
}
